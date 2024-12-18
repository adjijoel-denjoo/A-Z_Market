package servlet;

import data_access.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT idUtilisateur, nomUtilisateur, role FROM Utilisateurs WHERE email = ? AND motDePasseHache = SHA2(?, 256)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Récupération des informations
                        String nomUtilisateur = rs.getString("nomUtilisateur");
                        String role = rs.getString("role");

                        // Stocker les infos dans la session
                        HttpSession session = request.getSession();
                        session.setAttribute("nomUtilisateur", nomUtilisateur);
                        session.setAttribute("role", role);

                        // Redirection selon le rôle
                        switch (role) {
                            case "administrateur":
                                response.sendRedirect("admin/dashboard.jsp");
                                break;
                            case "employe":
                                response.sendRedirect("employe/accueilEmploye.jsp");
                                break;
                            case "client":
                                response.sendRedirect("client/accueilClient.jsp");
                                break;
                            default:
                                response.sendRedirect("index.jsp");
                                break;
                        }
                    } else {
                        // Login échoué
                        request.setAttribute("error", "Email ou mot de passe incorrect.");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la connexion : " + e.getMessage(), e);
        }
    }
}
