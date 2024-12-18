<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Clients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Gestion des Clients</h2>
        <a href="dashboard.jsp" class="btn btn-secondary mb-3">Retour au tableau de bord</a>

        <!-- Formulaire pour ajouter un client -->
        <form action="ClientServlet" method="post" class="mb-4">
            <label>Nom du client :</label>
            <input type="text" name="nom" class="form-control" required>
            <label>Points fidélité :</label>
            <input type="number" name="points" class="form-control" required>
            <button type="submit" name="action" value="add" class="btn btn-success mt-2">Ajouter</button>
        </form>

        <!-- Liste des clients -->
        <h4>Liste des Clients</h4>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Points Fidélité</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Dupont Jean</td>
                    <td>800</td>
                    <td>
                        <button class="btn btn-warning btn-sm">Modifier</button>
                        <button class="btn btn-danger btn-sm">Supprimer</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
