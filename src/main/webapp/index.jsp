<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String title = "Accueil " ;
%>

<%@ include file="header.jsp" %>

    <main>
    <!-- Carousel Section -->
    <div id="carouselExampleCaptions" class="carousel slide custom-carousel" data-bs-ride="carousel">
        <!-- Indicators -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <c:forEach var="slide" begin="1" end="6" varStatus="status">
	        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${status.index}" aria-current="true" aria-label="Slide ${status.index + 1}"></button>
	    </c:forEach>
        </div>

        <!-- Slides -->
        <div class="carousel-inner">
            <!-- Fruit et Légumes -->
            <div class="carousel-item active">
                <img src="img/ban-1.jpg" class="d-block w-100" alt="Fruits et Légumes">
                <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                    <h5>Fruits et Légumes Frais</h5>
                    <p>Découvrez nos produits locaux et frais, directement du marché à votre table.</p>
                </div>
            </div>
        
            <!-- Vêtements -->
            <div class="carousel-item">
                <img src="img/ban-2.jpg" class="d-block w-100" alt="Vêtements">
                <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                    <h5>Mode et Style pour Tous</h5>
                    <p>Explorez notre collection de vêtements pour toutes les occasions.</p>
                </div>
            </div>
        
            <!-- Matériels Informatiques -->
            <div class="carousel-item">
                <img src="img/ban-3.jpg" class="d-block w-100" alt="Matériels Informatiques">
                <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                    <h5>Matériels Informatiques</h5>
                    <p>Obtenez les meilleurs équipements informatiques à des prix compétitifs.</p>
                </div>
            </div>
        
            <!-- Meubles -->
            <div class="carousel-item">
                <img src="img/ban-4.jpg" class="d-block w-100" alt="Meubles">
                <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                    <h5>Meubles Élégants</h5>
                    <p>Transformez votre maison avec notre collection de meubles modernes.</p>
                </div>
            </div>
        
            <!-- Promotion Fin d'Année -->
            <div class="carousel-item">
                <img src="img/ban-5.jpg" class="d-block w-100" alt="Promotion Fin d'Année">
                <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                    <h5>Promotions de Fin d'Année</h5>
                    <p>Ne manquez pas nos offres exceptionnelles pour célébrer la fin d'année.</p>
                </div>
            </div>
        </div>
        
        <!-- Navigation Buttons -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Précédent</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Suivant</span>
        </button>
    </div>

    <!-- Hero Section -->
    <section class="hero bg-warning text-center text-dark py-5" height="10%">
        <!-- Hero Text -->
        <div class="container mt-4">
            <h2>Votre guichet unique pour tout ce dont vous avez besoin !</h2>
            <p>Découvrez une large gamme de produits à des prix imbattables. Achetez maintenant et profitez de réductions exclusives !</p>
            <a href="#categories" class="btn btn-primary btn-lg mt-3">Achetez maintenant</a>
        </div>
    </section>


    <!-- Categories Section -->
    <section id="categories" class="py-5">
        <div class="container">
            <h2 class="text-primary text-center mb-4">Achetez par Catégories</h2>
            <div class="row gy-4">
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Épicerie</h5>
                            <p class="card-text">Produits frais, collations et produits de première nécessité.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Electronique</h5>
                            <p class="card-text">Les derniers gadgets et appareils électroménagers.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Vêtements</h5>
                            <p class="card-text">De la mode pour toutes les saisons et toutes les occasions.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row gy-4 mt-4">
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Produits Alimentaires</h5>
                            <p class="card-text">Produits frais, surgelés, secs, fruits, légumes, et viande.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Non-Alimentaires</h5>
                            <p class="card-text">Produits ménagers, hygiène, jouets, et articles saisonniers.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm category">
                        <div class="card-body text-center">
                            <h5 class="card-title text-warning">Produits à Marque Propre</h5>
                            <p class="card-text">Des alternatives économiques aux grandes marques.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section id="promotions" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-primary text-center mb-4">Promotions et Offres Spéciales</h2>
            <p class="text-center">Profitez de nos offres exclusives et économisez davantage !</p>
            <div class="row gy-4">
                <div class="col-md-6">
                    <h4 class="text-warning">Promotions Hebdomadaires</h4>
                    <p>Découvrez nos promotions hebdomadaires sur une sélection de produits.</p>
                </div>
                <div class="col-md-6">
                    <h4 class="text-warning">Opérations Saisonnières</h4>
                    <p>Profitez des offres adaptées aux événements comme Noël, Pâques, ou la rentrée scolaire.</p>
                </div>
            </div>
        </div>
    </section>
    
    <section id="e-commerce" class="py-5">
        <div class="container">
            <h2 class="text-primary text-center mb-4">Ventes en Ligne et Click & Collect</h2>
            <p class="text-center">Commandez en ligne et récupérez vos produits en magasin ou optez pour la livraison à domicile.</p>
            <div class="row gy-4">
                <div class="col-md-6">
                    <h4 class="text-warning">Flexibilité et Rapidité</h4>
                    <p>Accédez à notre e-commerce pour des achats pratiques et rapides.</p>
                </div>
                <div class="col-md-6">
                    <h4 class="text-warning">Click & Collect</h4>
                    <p>Commandez en ligne et récupérez vos articles sans attendre.</p>
                </div>
            </div>
        </div>
    </section>
    
    <section id="fidelite" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-primary text-center mb-4">Programme de Fidélité</h2>
            <p class="text-center">Cumulez des points et profitez d'offres personnalisées.</p>
            <div class="row gy-4">
                <div class="col-md-6">
                    <h4 class="text-warning">Points et Récompenses</h4>
                    <p>Gagnez des points à chaque achat et échangez-les contre des produits ou réductions.</p>
                </div>
                <div class="col-md-6">
                    <h4 class="text-warning">Offres Personnalisées</h4>
                    <p>Recevez des promotions adaptées à vos habitudes d'achat grâce à notre application mobile.</p>
                </div>
            </div>
        </div>
    </section>
        
    </main>
    
    
<%@ include file="footer.jsp" %>