<%-- 
    Document   : AltPanier
    Created on : 22 déc. 2016, 09:31:33
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
        ArrayList<Medicament> listemedic = new ArrayList<Medicament>(){};
        listemedic=new Medicament().GetAllMedic();
        
        
        //request.getSession().setAttribute("panier", panier);
        
        
        ArrayList<FactMedic> basket= new ArrayList<FactMedic>(){};
        //basket= (ArrayList<Medicament>)request.getSession().getAttribute("panier");
        basket=(ArrayList<FactMedic>)session.getAttribute("panier");
       
                    
                    if(request.getParameter("addbasket")!=null){
                        int id=0,nbr=0;
                        String[] isa= request.getParameterValues("nombre");
                        for(int cpt=0;cpt<listemedic.size();cpt++){
                            if(isa[cpt]!=""){
                                if(isa[cpt]!="0"){
                                    id=listemedic.get(cpt).getId();
                                    nbr=Integer.valueOf(isa[cpt]);
                                    out.println(id+" : " +nbr);
                                    response.sendRedirect("TraitementPanier.jsp?id="+id+"&nbr="+nbr);
                                }
                            }
                        }
                      
                        
                    }
                %>
    </body>
</html>
