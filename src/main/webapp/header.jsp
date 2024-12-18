
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><%= "A-Z Market -" + ((title != null) ? title : "Tes achats de A à Z")  %></title>

    <link rel="shortcut icon" href="logo0.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Styles généraux pour la barre de navigation */
        .top-bar {
            background-color: #FFD97C; /* Jaune orangé */
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar {
            background-color: #003B80; /* Bleu marine */
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        /* Classe sticky qui fixe la barre de navigation */
        .navbar.sticky {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Animation des catégories au scroll */
        .category {
            opacity: 0;
            transform: translateY(50px);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="top-bar bg-primary text-light py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="d-none d-md-block">
                <p class="mb-0"><i class="bi bi-telephone-fill "></i> Service client : +225 07 08 09 10 11 | Livraison gratuite au-dessus de 50 000 FCFA!</p>
            </div>
            <div class="search-and-cart d-flex align-items-center gap-3">
                <input type="text" class="form-control form-control-sm" placeholder="rechercher un produit...">
                <button class="btn btn-warning btn-sm">RECHERCHE</button>
            </div>
            <div><a href="#cart" class="text-light link-underline-light"><i class="bi bi-cart3"></i> Panier (0)</a></div>
             
        </div>
    </header>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand text-primary fw-bold" href="#"> <img src="logo0.png" width="50px" alt="" > A-Z Market</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarNav">
                <ul class="navbar-nav ms-auto justify-content-center">
                    <li class="nav-item"><a class="nav-link" href="#">Accueil</a></li>
                    <li class="nav-item"><a class="nav-link" href="categories.jsp">Cat&#xE9;gories</a></li>
                    <li class="nav-item"><a class="nav-link" href="deals.jsp">Le Deal</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">A propos</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contacts</a></li>
                </ul>
		
				<div class="btn-group" role="group">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle"></i> <%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "Visiteur" %>
                    </button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="profile.jsp">Profil</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.userName}">
								<li><a class="dropdown-item" href="login.jsp">Se Connecter</a></li>
							</c:when>
						<c:otherwise>
							<li><a class="dropdown-item" href="logout.jsp">Se Déconnecter</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
            </div>    
        </div>
    </nav>

