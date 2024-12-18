<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // Classe Produit
    class Produit {
        private String nom;
        private String image;
        private double prix;
        private boolean disponible;

        public Produit(String nom, String image, double prix, boolean disponible) {
            this.nom = nom;
            this.image = image;
            this.prix = prix;
            this.disponible = disponible;
        }

        public String getNom() {
            return nom;
        }

        public String getImage() {
            return image;
        }

        public double getPrix() {
            return prix;
        }

        public boolean isDisponible() {
            return disponible;
        }
    }

    // Liste de produits
    List<Produit> produits = new ArrayList<>();
    produits.add(new Produit("Sac à main Louis Vuiton", "sac_a_main.jpg", 30000, true));
    produits.add(new Produit("Sac ordinateur", "sac_ordinateur.jpg", 15000, false));
    produits.add(new Produit("Sandales hommes", "sandales_homme.jpg", 10000, true));
    produits.add(new Produit("Sandales femmes", "sandales_femme.jpg", 7500, true));
    produits.add(new Produit("Chaîne au cou pour Femmes", "chaine_cou.jpg", 5000, true));
    produits.add(new Produit("Montre en acier", "montre.jpg", 15060, false));
    produits.add(new Produit("Montre Connectee Samsung", "montre_connectee.webp", 50000, false));
    produits.add(new Produit("Souris sans fil HYBRID", "souris_sans_fil.jpg", 4500, true));
    produits.add(new Produit("Mk Clavier lumineux", "clavier_lumineux.jpg", 5000, true));

    // Calcul du coût total des produits disponibles
    double coutTotal = 0;
    for (Produit produit : produits) {
        if (produit.isDisponible()) {
            coutTotal += produit.getPrix();
        }
    }

    // Enregistrer le coût total dans un attribut de la page
    pageContext.setAttribute("coutTotal", coutTotal);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestion des Produits</title>
    <link rel="stylesheet" href="Produits.css">
</head>
<body>

<h1>Liste des Produits</h1>

<div class="produits-container">
    <% for (Produit produit : produits) { %>
        <div class="produit">
            <img src="images/<%= produit.getImage() %>" alt="<%= produit.getNom() %>" />
            <div class="produit-info">
                <h3><%= produit.getNom() %></h3>
                <p><strong>Prix :</strong> <%= produit.getPrix() %> Fcfa</p>
                <p class="<%= produit.isDisponible() ? "disponible" : "indisponible" %>">
                    <%= produit.isDisponible() ? "Disponible" : "Indisponible" %>
                </p>
            </div>
        </div>
    <% } %>
</div>

<!-- Affichage du coût total avec JSTL -->
<div class="cout-total">
    <strong>Coût total des produits disponibles : <c:out value="${coutTotal}" /> Fcfa</strong>
</div>

</body>
</html>
