package data_access;

import java.io.*;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import org.mindrot.jbcrypt.BCrypt;

@SuppressWarnings("serial")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupération des paramètres de connexion
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            // Requête pour récupérer l'utilisateur
            String sql = "SELECT id, nomUtilisateur, motDePasseHache, role FROM utilisateur WHERE email = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String motDePasseHache = rs.getString("motDePasseHache");
                String role = rs.getString("role");
                int userId = rs.getInt("id");
                String nomUtilisateur = rs.getString("nomUtilisateur");

                // Vérification du mot de passe
                if (BCrypt.checkpw(motDePasse, motDePasseHache)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);
                    session.setAttribute("nomUtilisateur", nomUtilisateur);
                    session.setAttribute("role", role);

                    // Redirection basée sur les rôles
                    switch (role.toLowerCase()) {
                        case "administrateur":
                            response.sendRedirect("job-views/dashboard");
                            break;
                        case "client":
                            response.sendRedirect("index.jsp");
                            break;
                        case "employe":
                            // Vérification du poste spécifique dans la table "employes"
                            String employeQuery = "SELECT poste FROM employes WHERE utilisateurId = ?";
                            PreparedStatement empStmt = con.prepareStatement(employeQuery);
                            empStmt.setInt(1, userId);
                            ResultSet empRs = empStmt.executeQuery();

                            if (empRs.next()) {
                                String poste = empRs.getString("poste").toLowerCase();
                                if (poste.contains("caisse")) {
                                    response.sendRedirect("job-views/caisse/");
                                } else if (poste.contains("stock")) {
                                    response.sendRedirect("job-views/stock");
                                } else if (poste.contains("rh")) {
                                    response.sendRedirect("job-views/rh");
                                } else {
                                    response.sendRedirect("index.jsp");
                                }
                            } else {
                                response.sendRedirect("index.jsp");
                            }
                            break;
                        default:
                            response.sendRedirect("index.jsp");
                            break;
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
            response.sendRedirect("errorPage.jsp");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
