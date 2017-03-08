<%-- 
    Document   : TraitementPanier
    Created on : 13 déc. 2016, 15:09:48
    Author     : HKhoumal
--%>

<%@page import="utilitaire.Medicament"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            if(id!=0){
                    ArrayList<Medicament> panier= new ArrayList<Medicament>(){};
                   //panier= (ArrayList<Medicament>)request.getSession().getAttribute("panier");
                   panier=(ArrayList<Medicament>)session.getAttribute("panier");
                   out.print("taille panier= "+panier.size());

                   Medicament medic = new Medicament();
                   medic=new Medicament().findMedic(id);
                   for(int i=0;i<panier.size();i++){
                       if(panier.get(i).getNom().equals(medic.getNom()))
                           panier.remove(i);
                       break;
                   }

                   //request.getSession().setAttribute("panier", panier);
                   session.setAttribute("panier", panier);
            }
            if(id==0){
                   ArrayList<Medicament> panier= new ArrayList<Medicament>(){};
                   panier=(ArrayList<Medicament>)session.getAttribute("panier");
                   out.print("taille panier= "+panier.size());
                  while(panier.size()!=0){
                      for(int i=0;i<panier.size();i++){
                                panier.remove(i);
                        }
                  }
                        
                  

                   
                   session.setAttribute("panier", panier);
            }
        %>
        <jsp:forward page="Pharmacie.jsp"></jsp:forward>
    </body>
</html>
