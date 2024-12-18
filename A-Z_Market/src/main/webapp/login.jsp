<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, data_access.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String message = null;
    String param = request.getParameter("p");

    if ("out".equals(param) && "POST".equalsIgnoreCase(request.getMethod())) {
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
    
    if ("1".equals(param) && "POST".equalsIgnoreCase(request.getMethod())) {
        // Traitement de connexion
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT `idUtilisateur`, `nomUtilisateur`, `motDePasseHache`, `role` FROM `utilisateurs` WHERE `email`=? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

               if (rs.next()) {
                   String motDePasseHache = rs.getString("motDePasseHache");
                   String role = rs.getString("role");
                   int userId = rs.getInt("idUtilisateur");
                   String nomUtilisateur = rs.getString("nomUtilisateur");

                   if (BCrypt.checkpw(motDePasse, motDePasseHache)) {
                       session.setAttribute("userId", userId);
                       session.setAttribute("nomUtilisateur", nomUtilisateur);
                       session.setAttribute("role", role);
                       message = "Connecter";
                     // Redirection en fonction des rôles
                     switch (role.toLowerCase()) {
                         case "administrateur":
                             response.sendRedirect("job-views/dashboard/");
                             break;
                         case "client":
                             response.sendRedirect("index.jsp");
                             break;
                         case "employe":
                             String employeQuery = "SELECT `idEmploye`,`prenom`, `nom`, `poste`, `dateEmbauche` FROM `employes` WHERE idUtilisateur = ?";
                             try (PreparedStatement empStmt = con.prepareStatement(employeQuery)) {
                                 empStmt.setInt(1, userId);
                                 try (ResultSet empRs = empStmt.executeQuery()) {
                                     if (empRs.next()) {
                                         String poste = empRs.getString("poste").toLowerCase();
                                         String idEmploye = empRs.getString("idEmploye");
                                         String prenom = empRs.getString("prenom");
                                         String nom = empRs.getString("nom");
                                         String dateEmbauche = empRs.getString("dateEmbauche");
                                         
                                         //session
					                       session.setAttribute("poste", poste);
					                       session.setAttribute("idEmploye", idEmploye);
					                       session.setAttribute("prenom", prenom);
					                       session.setAttribute("nom", nom);
					                       session.setAttribute("dateEmbauche", dateEmbauche);
					                       
                                         if (poste.contains("caisse")) response.sendRedirect("job-views/caisse/");
                                         else if (poste.contains("stock")) response.sendRedirect("job-views/stock/");
                                         else if (poste.contains("rh")) response.sendRedirect("job-views/rh/");
                                         else response.sendRedirect("index.jsp");
                                     } else response.sendRedirect("index.jsp");
                                 }
                             }
                             break;
                         default:
                             response.sendRedirect("index.jsp");
                        }
                   } else {
                       request.setAttribute("error", "Mot de passe incorrect !");
                       request.getRequestDispatcher("login.jsp").forward(request, response);
                   }
               } else {
                   request.setAttribute("error", "Aucun utilisateur trouvé avec cet email !");
                   request.getRequestDispatcher("login.jsp").forward(request, response);
               }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Erreur" + e.getMessage();;
           // response.sendRedirect("errorPage.jsp");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }

    } else if ("2".equals(param) && "POST".equalsIgnoreCase(request.getMethod())) {
        // Traitement d'inscription
        String nomUtilisateur = request.getParameter("nomUtilisateur");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String confirmMotDePasse = request.getParameter("confirmMotDePasse");

        if (nomUtilisateur != null && email != null && motDePasse != null && confirmMotDePasse != null) {
            if (motDePasse.equals(confirmMotDePasse)) {
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    String motDePasseHache = BCrypt.hashpw(motDePasse, BCrypt.gensalt());
                    con = DBConnection.getConnection();
                    String sql = "INSERT INTO utilisateurs (nomUtilisateur, email, motDePasseHache, dateCreation) VALUES (?, ?, ?, NOW())";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, nomUtilisateur);
                    pstmt.setString(2, email);
                    pstmt.setString(3, motDePasseHache);
                    pstmt.executeUpdate();
                    message = "Vous avez été ajouté avec succès.";
                } catch (SQLException e) {
                    e.printStackTrace();
                    message = "Erreur lors de l'inscription : " + e.getMessage();
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                    if (con != null) try { con.close(); } catch (SQLException ignore) {}
                }
            } else {
                message = "Les mots de passe ne correspondent pas.";
            }
        } else {
            message = "Veuillez remplir tous les champs.";
        }
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentification</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }
        .auth-container {
            position: relative;
            width: 100%;
            max-width: 400px;
            height: 450px;
            perspective: 1000px;
        }
        .form-wrapper {
            position: absolute;
            width: 100%;
            height: 100%;
            display: flex;
            transform-style: preserve-3d;
            transition: transform 0.6s ease-in-out;
        }
        .auth-container.signup-active .form-wrapper {
            transform: rotateY(-180deg);
        }
        .login-form, .signup-form {
            width: 100%;
            padding: 30px;
            backface-visibility: hidden;
            position: absolute;
            height: 100%;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .signup-form {
            transform: rotateY(180deg);
        }
        .switch-btn {
            cursor: pointer;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .switch-btn:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="auth-container" id="authContainer">
        <div class="form-wrapper">
            <!-- Login Form -->
            <div class="login-form">
                <h3 class="text-center mb-4">Connexion</h3>
                <% if (message != null) { %>
                    <div class="alert alert-info"><%= message %></div>
                <% } %>
                <form method="post" action="login.jsp?p=1">
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="loginEmail" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="loginPassword" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control" id="loginPassword" name="motDePasse" required>
                    </div>
                    <button type="submit" class="btn btn-warning w-100">Se connecter</button>
                </form>
                <div class="text-center mt-3">
                    <p>Pas de compte ? <a href="#" class="switch-btn" onclick="switchToSignup()">Inscrivez-vous</a></p>
                </div>
            </div>

            <!-- Signup Form -->
            <div class="signup-form">
                <h3 class="text-center mb-4">Inscription</h3>

                <form method="post" action="login.jsp?p=2">
                    <div class="mb-3">
                        <label for="nomUtilisateur" class="form-label">Nom d'utilisateur</label>
                        <input type="text" class="form-control" id="nomUtilisateur" name="nomUtilisateur" required>
                    </div>
                    <div class="mb-3">
                        <label for="signupEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="signupEmail" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="signupPassword" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control" id="signupPassword" name="motDePasse" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmSignupPassword" class="form-label">Confirmez le mot de passe</label>
                        <input type="password" class="form-control" id="confirmSignupPassword" name="confirmMotDePasse" required>
                    </div>
                    <button type="submit" class="btn btn-warning w-100">S'inscrire</button>
                </form>
                <div class="text-center mt-3">
                    <p>Déjà un compte ? <a href="#" class="switch-btn" onclick="switchToLogin()">Connectez-vous</a></p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function switchToSignup() {
            document.getElementById('authContainer').classList.add('signup-active');
        }
        function switchToLogin() {
            document.getElementById('authContainer').classList.remove('signup-active');
        }
    </script>
</body>
</html>
