<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administration - Tableau de Bord</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; }
        .sidebar { width: 250px; background: #333; color: #fff; height: 100vh; position: fixed; }
        .sidebar a { color: #fff; text-decoration: none; padding: 10px; display: block; }
        .sidebar a:hover { background: #444; }
        .content { margin-left: 260px; padding: 20px; }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center py-3">Admin</h3>
        <a href="dashboard.jsp">Tableau de bord</a>
        <a href="stocks.jsp">Gestion des stocks</a>
        <a href="caisses.jsp">Gestion des caisses</a>
        <a href="employes.jsp">Gestion des employés</a>
        <a href="clients.jsp">Gestion des clients</a>
        <a href="promotions.jsp">Gestion des promotions</a>
    </div>

    <!-- Contenu principal -->
    <div class="content">
        <h1>Tableau de Bord</h1>
        <p>Bienvenue sur le tableau de bord d'administration. Utilisez le menu pour naviguer vers les différentes sections.</p>
        <div class="alert alert-info" role="alert">
            Cette interface est en cours d'amélioration pour une meilleure expérience utilisateur !
        </div>
    </div>
</body>
</html>
