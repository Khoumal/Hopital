<%@page import="utilitaire.* "%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="utilitaire.UtilDB" %>


<html>
<head>
	<title>Nouveau medicament</title>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/style.css">
<script type="text/javascript" src="affichage/js/jquery3.1.1.js"></script>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="affichage/font-awesome-4.6.3/css/font-awesome.min.css">
</head>
<body>
    <%
        Date d= new Date();
        int jour,mois,annee;
        jour=d.getDate();
        mois=d.getMonth();
        annee=d.getYear();
        String date=String.valueOf(jour)+"-"+String.valueOf(mois+1)+"-"+String.valueOf(annee+1900);
        
    %>
<div id="contentAdd">
    <div class="form-group">
        <a class="isLink" href="Pharmacie.jsp"><i class="fa fa-arrow-left"> Retour</i></a>
    </div>
	<form method="POST" action="#">
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Nom medicament</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="NomMedic" required="true">
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Prix</label>
			  <br>
			  <input type="date" class="form-control" name="prix" required="true">
		</div>
            <div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Description</label>
			  <br>
			  <input type="date" class="form-control" name="desc" >
		</div>
		
                <input type="submit" name="add" class="btn btn-primary" value="Ajouter" id="ajouter">
	</form>
		

</div>
	<% 
		if (request.getParameter("add")!=null){
			String nommedic=request.getParameter("NomMedic");
			String prix=request.getParameter("prix");
                        String description = request.getParameter("desc");
			Boolean a=new Medicament().insertMedic(nommedic,description,Integer.parseInt(prix),date);
                      if(a){
                        %> <script> alert(Nouveau medicament ajouté avec success); </script><%
                    }
                 
	}
            
%>

</body>
</html>