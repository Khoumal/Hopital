<%@page import="utilitaire.* "%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>
<%@page import="utilitaire.UtilDB" %>

<%
     Poste p= new Poste();
     ArrayList<Poste> listePoste = new ArrayList(){};
     listePoste=p.getAllPost();
     
%>
<html>
<head>
	<title>Nouveau Personnel</title>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/style.css">
<script type="text/javascript" src="affichage/js/jquery3.1.1.js"></script>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="affichage/font-awesome-4.6.3/css/font-awesome.min.css">
</head>
<body>
<div id="contentAdd">
	<form method="POST" action="#">
            <div class="form-group">
                    <a class="isLink" href="index.jsp"><i class="fa fa-arrow-left"> Retour</i></a>
            </div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Nom et Prenom</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="user" required>
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Date de Naissance</label>
			  <br>
			  <input type="date" class="form-control" name="datenaissance" required>
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Email</label>
			  <br>
			  <input type="text" class="form-control" name="mail" required>
		</div>
		<div class="form-group">
			  <label for="pwd" style="margin-left: 105px;">Mot de passe</label>
			  <br>
			  <input type="password" class="form-control" id="pwd" name="mdp" required>
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Poste</label>
			  <a href="AddPost.jsp" class="lien"><i class="fa fa-plus"></i></a>
			  
			  <select class="form-control" name="select">
                              <% int i=0; while(i<listePoste.size()) { %>
                              
                              <option value="<% out.print(listePoste.get(i).getId()); %>"><% out.print( listePoste.get(i).getNom()); %></option>
                              <% i++; }%>
			  	
			  </select>


		</div>
		
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Contact</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="contact" required>
		</div><br><br>
		
			<input type="submit" name="add" class="btn btn-primary" value="Ajouter" id="ajouter">
	</form>
		

</div>
	<% 
		if (request.getParameter("add")!=null){
			String n=request.getParameter("user");
			String date=request.getParameter("datenaissance");
			String mail=request.getParameter("mail");
			String mdp=request.getParameter("mdp");
			String select=request.getParameter("select");
			String contact=request.getParameter("contact");

			Personnel pers = new Personnel();
                        pers.setNompersonnel(n);
                        pers.setDatedenaissance(Date.valueOf(date));
                        pers.setMail(mail);
                        pers.setMdp(mdp);
                        pers.setIdposte(Integer.valueOf(select));
                        pers.setContact(contact);
                        
                        new Personnel().addPersonnel(pers);
                        
                        response.sendRedirect("index.jsp");
                        
			
                        

			
	}
%>

</body>
</html>