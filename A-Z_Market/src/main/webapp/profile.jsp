<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String title = "Profil " ;
%>

<%@ include file="header.jsp" %>

    <!-- Profil utilisateur -->
    <div class="profile-container">
        <h2>Votre profil</h2>
        <div class="info-item">
            <strong>Poste :</strong>
            <span><%= session.getAttribute("poste") %></span>
        </div>
        <div class="info-item">
            <strong>ID Employé :</strong>
            <span><%= session.getAttribute("idEmploye") %></span>
        </div>
        <div class="info-item">
            <strong>Nom complet :</strong>
            <span><%= session.getAttribute("prenom") %> <%= session.getAttribute("nom") %></span>
        </div>
        <div class="info-item">
            <strong>Date d'embauche :</strong>
            <%
                // Formatage de la date pour un affichage lisible
                Date dateEmbauche = (Date) session.getAttribute("dateEmbauche");
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            %>
            <span><%= formatter.format(dateEmbauche) %></span>
        </div>
    </div>

        
<%@ include file="footer.jsp" %>