<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String title = "A propos " ;
%>

<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <div class="categories-container">
        <h2>Nos catégories d'articles</h2>
        <%
            String[][] categories = {
                {"Fruits et Légumes", "images/fruits-legumes.jpg", "Pommes, oranges, laitues, tomates"},
                {"Boissons et Jus", "images/jus.jpg", "Jus d'orange, sodas, eaux minérales"},
                {"Produits Laitiers", "images/produits-laitiers.jpg", "Lait, yaourts, fromages"},
                {"Produits Ménagers", "images/produits-menagers.jpg", "Détergents, papiers hygiéniques, savons"},
                {"Vêtements", "images/habits.jpg", "T-shirts, pantalons, accessoires de mode"},
                {"Snacks et Confiseries", "images/snacks.jpg", "Chips, bonbons, chocolats"},
                {"Boulangerie", "images/boulangerie.jpg", "Pains, croissants, gâteaux"},
                {"Épices et Condiments", "images/epices.jpg", "Sel, poivre, curry, herbes"}
            };

            for (String[] category : categories) {
        %>
        <div class="category">
            <img src="<%= category[1] %>" alt="<%= category[0] %>">
            <div>
                <h3><%= category[0] %></h3>
                <p><%= category[2] %></p>
            </div>
        </div>
        <%
            }
        %>
    </div>

<%@ include file="footer.jsp" %>