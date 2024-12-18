<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Stocks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Gestion des Stocks</h2>
        <a href="dashboard.jsp" class="btn btn-secondary mb-3">Retour au tableau de bord</a>
        <form action="StockServlet" method="post" class="mb-3">
            <label>Nom du produit :</label>
            <input type="text" name="productName" class="form-control" required>
            <label>Quantité :</label>
            <input type="number" name="quantity" class="form-control" required>
            <button type="submit" name="action" value="add" class="btn btn-success mt-2">Ajouter</button>
        </form>
        <h4>Liste des Produits</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Quantité</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Farine T45</td>
                    <td>50</td>
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
