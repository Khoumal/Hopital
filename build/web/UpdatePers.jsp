<%@page import="utilitaire.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitaire.UtilDB"%>
<%-- 
    Document   : UpdatePage
    Created on : 1 déc. 2016, 10:09:02
    Author     : HKhoumal
--%>


<!DOCTYPE html>
<html>
    <head>
	<title>HOPITAL</title>

	<link rel="stylesheet" type="text/css" href="affichage/css/style.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="font-awesome-4.6.3/css/font-awesome.min.css">
        <script type="text/javascript" src="affichage/js/jquery3.1.1.js"></script>         

</head>
    <body>
        <%
        String id= request.getParameter("id");
        int indice=Integer.parseInt(id);
        Personnel p= new Personnel();
        Personnel pers = p.FindPers(indice);
        
    Poste ps= new Poste();
     ArrayList<Poste> listePoste = new ArrayList(){};
     listePoste=ps.getAllPost();
        %>
        
        <div class="container">
                <div id="header">
		<img src="affichage/image/hopital.png" alt="logo hopital">

                </div>
                <div class="navbar">
                         <nav class="navbar navbar-inverse">
                                        <div class="container-fluid">
                                                <div class="navbar-header">
                                                <a class="navbar-brand" href="index.jsp">HOPITAL</a>
                                                <a class="navbar-brand" href="Addnew.jsp">Nouveau personnel</a>
                                                </div>

                                                <ul class="nav navbar-nav">


                                                </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <!-- <li><a id="toggle"><i class="fa fa-play-circle-o"> Recherche</i></a></li> -->
                                <li><a href="login.html"><span class="fa fa-sign-in"></span> Log out</a></li>
                        </ul>
                                </div>
                        </nav>
                </div>
            <div id="updatePersonnel">
                <form method="POST">
                    <div class="form-group">
                        <label style="margin-left: 105px;">ID Personnel :</label>
                        <input type="text" class="form-control " value="<% out.println(pers.getIdpersonnel()); %>" disabled name="id"><br>
                    </div>
                    <div class="form-group">
                        <label style="margin-left: 105px;">Nom : </label>
                        <input type="text" class="form-control" value="<% out.println(pers.getNompersonnel());%>" name="nom"><br>
                    </div>
                    <div class="form-group">
                        <label style="margin-left: 105px;">Date de Naissance : </label>
                        <input type="text" class="form-control" value="<% out.println(pers.getDatedenaissance()); %>" name="daten"><br>
                    </div>
                    <div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Poste occupé</label>
                          <select class="form-control" name="select">
                              <% int i=0; while(i<listePoste.size()) { %>
                              
                              <option value="<% out.print(listePoste.get(i).getId()); %>" <% if(listePoste.get(i).getNom().equals(pers.getNomposte())){ out.print("selected");} %>><% out.print( listePoste.get(i).getNom()); %></option>
                              <% i++; }%>
			  	
			  </select>
                          
			  
                    </div>
                    
                    <div class="form-group">
                         <label style="margin-left: 105px;">Mail : </label>
                         <input type="text" class="form-control" value="<% out.println(pers.getMail()); %>" name="mail"><br>
                    </div>
                    
                    <div class="form-group">
                        <label style="margin-left: 105px;">Contact : </label>
                        <input type="text" class="form-control" value="<% out.println(pers.getContact());%>" name="contact"><br>
                    </div>
                   
                    <div class="form-group">
                        <input type="submit" value="Mettre à jour" class="btn btn-success" style="margin-left: 105px;" name="maj">
                    </div>
                    
                
                </form>
               
            </div>
        </div>
<%
    if (request.getParameter("maj")!=null){
        String ind = request.getParameter("id");
        int in = Integer.parseInt(ind);
        String nom = request.getParameter("nom");
        String daten = request.getParameter("daten");
        String mail= request.getParameter("mail");
        String contact = request.getParameter("contact");
        String poste= request.getParameter("select");
        int idp=Integer.parseInt(poste);
       Personnel persn= new Personnel(); 
       persn.UpdatePers(in,idp,nom, daten, mail, contact);
     
%>
        <script>alert("Modification Terminée avec succes");</script>
        <%
            
    }
%>
    </body>
</html>
