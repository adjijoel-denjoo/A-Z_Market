<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String title = "A propos " ;
%>

<%@ include file="header.jsp" %>

    <div class="about-container">
        <h2>À propos de nous</h2>
        <p>
            Bienvenue chez <strong>A-Z Market</strong>, votre supermarché de confiance. Depuis notre création,
            nous nous engageons à offrir à nos clients une expérience d'achat exceptionnelle avec une large
            gamme de produits de qualité et un excellent service.
        </p>

        <h2>Nos coordonnées</h2>
        <ul>
            <li><strong>Adresse :</strong> 123 Rue des Champs, Abidjan, Côte d'Ivoire</li>
            <li><strong>Téléphone :</strong> +225 01 23 45 67 89</li>
            <li><strong>Email :</strong> contact@azmarket.ci</li>
        </ul>

        <h2>Nos horaires d'ouverture</h2>
        <p>Nous sommes ouverts tous les jours de la semaine, de <strong>8h00 à 22h00</strong>.</p>

        <h2>Nos services</h2>
        <p>
            Chez <strong>A-Z Market</strong>, nous proposons :
        </p>
        <ul>
            <li>Produits alimentaires frais et de qualité</li>
            <li>Produits ménagers essentiels</li>
            <li>Articles de soins personnels</li>
            <li>Offres promotionnelles exclusives</li>
        </ul>

        <h2>Notre mission</h2>
        <p>
            Fournir à nos clients une expérience d'achat agréable en leur offrant une large gamme de produits à des prix compétitifs,
            tout en soutenant notre communauté locale.
        </p>
    </div>

<%@ include file="footer.jsp" %>