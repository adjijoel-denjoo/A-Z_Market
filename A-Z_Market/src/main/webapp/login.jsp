<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, data_access.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String message = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nomUtilisateur = request.getParameter("nomUtilisateur");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String confirmMotDePasse = request.getParameter("confirmMotDePasse");

        if (nomUtilisateur != null && email != null && motDePasse != null && confirmMotDePasse != null) {
            if (motDePasse.equals(confirmMotDePasse)) {
                Connection con = null;
                PreparedStatement pstmt = null;
                try {
                    // Hashage du mot de passe
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
                <form method="post" action="Login.java">
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

                <form method="post" action="login.jsp">
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
