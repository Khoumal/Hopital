<%-- 
    Document   : TraitementPanier
    Created on : 13 déc. 2016, 15:09:48
    Author     : HKhoumal
--%>

<%@page import="utilitaire.FactMedic"%>
<%@page import="utilitaire.Medicament"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
      
        
        int id=Integer.parseInt(request.getParameter("id"));
        int nbr=Integer.parseInt(request.getParameter("nbr"));
        ArrayList<FactMedic> panier= new ArrayList<FactMedic>(){};
        panier=(ArrayList<FactMedic>)session.getAttribute("panier");
        out.print("taille panier= "+panier.size());
       
        Medicament medic = new Medicament();
        medic=new Medicament().findMedic(id);
        
        FactMedic med= new FactMedic();
        med.setId(medic.getId());
        med.setNom(medic.getNom());
        med.setDesc(medic.getDesc());
        med.setDaty(medic.getDaty());
        med.setPrix(medic.getPrix());
        med.setNbr(nbr);
        
        panier.add(med);
        //request.getSession().setAttribute("panier", panier);
        //session.setAttribute("panier", panier);
        %>
        <jsp:forward page="Pharmacie.jsp"></jsp:forward>
    </body>
</html>
