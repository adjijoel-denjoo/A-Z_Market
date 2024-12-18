<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Caisses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Gestion des Caisses</h2>
        <a href="dashboard.jsp" class="btn btn-secondary mb-3">Retour au tableau de bord</a>

        <!-- Formulaire pour générer un rapport des ventes -->
        <form action="CaisseServlet" method="post" class="mb-4">
            <label>Générer un rapport :</label>
            <select name="periode" class="form-control">
                <option value="jour">Aujourd'hui</option>
                <option value="semaine">Cette semaine</option>
                <option value="mois">Ce mois</option>
            </select>
            <button type="submit" class="btn btn-primary mt-2">Générer</button>
        </form>

        <!-- Liste des ventes -->
        <h4>Transactions récentes</h4>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID Transaction</th>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Client</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>2024-01-01</td>
                    <td>150.00 €</td>
                    <td>Dupont Jean</td>
                </tr>
                <tr>
                    <td>002</td>
                    <td>2024-01-02</td>
                    <td>80.50 €</td>
                    <td>Martin Sarah</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
