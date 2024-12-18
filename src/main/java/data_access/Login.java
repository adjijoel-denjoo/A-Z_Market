package data_access;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt; 


@SuppressWarnings("serial")
@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        try {
        	Connection connection = DBConnection.getConnection();
            String sql = "SELECT motDePasseHache FROM utilisateur WHERE email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String motDePasseHache = resultSet.getString("motDePasseHache");

                // Vérification du mot de passe
                if (BCrypt.checkpw(motDePasse, motDePasseHache)) {
                    response.sendRedirect("dashboard.jsp"); // Page utilisateur connectée
                } else {
                    response.sendRedirect("login.jsp?error=invalid"); // Erreur d'identifiant/mot de passe
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid"); // Erreur d'identifiant/mot de passe
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
