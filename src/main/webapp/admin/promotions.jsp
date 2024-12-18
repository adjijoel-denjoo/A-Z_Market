<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Promotions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Gestion des Promotions</h2>
        <a href="dashboard.jsp" class="btn btn-secondary mb-3">Retour au tableau de bord</a>

        <!-- Formulaire pour ajouter une promotion -->
        <form action="PromotionServlet" method="post" class="mb-4">
            <label>Nom de la promotion :</label>
            <input type="text" name="nom" class="form-control" required>
            <label>Réduction (%) :</label>
            <input type="number" name="reduction" class="form-control" required>
            <button type="submit" name="action" value="add" class="btn btn-success mt-2">Créer</button>
        </form>

        <!-- Liste des promotions -->
        <h4>Promotions Actuelles</h4>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Réduction</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Promo Nouvel An</td>
                    <td>15%</td>
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
