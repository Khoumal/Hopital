<%@page import="utilitaire.* "%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>
<%@page import="utilitaire.UtilDB" %>


<html>
<head>
	<title>Nouveau POSTE</title>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/style.css">
<script type="text/javascript" src="affichage/js/jquery3.1.1.js"></script>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="affichage/font-awesome-4.6.3/css/font-awesome.min.css">
</head>
<body>
<div id="contentAdd">
    <div class="form-group">
        <a class="isLink" href="Addnew.jsp"><i class="fa fa-arrow-left"> Retour</i></a>
    </div>
	<form method="POST" action="#">
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Nom nouveau poste</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="NomPoste" required="true">
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Salaire de base</label>
			  <br>
			  <input type="date" class="form-control" name="salaire" required="true">
		</div>
		
                <input type="submit" name="add" class="btn btn-primary" value="Ajouter" id="ajouter">
	</form>
		

</div>
	<% 
		if (request.getParameter("add")!=null){
			String nomposte=request.getParameter("NomPoste");
			String salaire=request.getParameter("salaire");
			

			String req="insert into POST values (idPost.nextVal,'"+nomposte+"',"+salaire+")";

                       // out.print(req);
                        try{
                            UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				//out.print(req);
                                
				Statement s=c.createStatement();
				s.executeQuery(req);
				c.commit();
                               
			}
			catch(Exception e){
				e.getMessage();	
			}
                        
			
                        

		%> <script> alert(Nouveau poste ajouté avec success); </script><%	
	}
            
%>

</body>
</html>