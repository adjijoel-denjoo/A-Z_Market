package data_access;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Constantes pour la configuration de la base de données
    private static final String URL = "jdbc:mysql://localhost:3306/az_market";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Laissez vide si aucun mot de passe

    /**
     * Établit une connexion à la base de données MySQL.
     * 
     * @return Connection objet représentant la connexion à la base de données.
     * @throws SQLException Si un problème survient au niveau SQL.
     * @throws ClassNotFoundException Si le driver MySQL n'est pas trouvé.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Charger le driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Le driver MySQL est introuvable.", e);
        }

        // Établir la connexion
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
