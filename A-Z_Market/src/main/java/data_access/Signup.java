package data_access;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

@SuppressWarnings("serial")
@WebServlet("/SignupServlet")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomUtilisateur = request.getParameter("nomUtilisateur");
        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");
        String confirmMotDePasse = request.getParameter("confirmMotDePasse");

        if (!motDePasse.equals(confirmMotDePasse)) {
            response.sendRedirect("signup.jsp?error=passwordMismatch");
            return;
        }

        try {
            String motDePasseHache = BCrypt.hashpw(motDePasse, BCrypt.gensalt());

            Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO utilisateur (nomUtilisateur, email, motDePasseHache) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nomUtilisateur);
            statement.setString(2, email);
            statement.setString(3, motDePasseHache);
            statement.executeUpdate();

            response.sendRedirect("login.jsp?signup=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=databaseError");
        }
    }
}
