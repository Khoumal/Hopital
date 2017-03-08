<%@page import="utilitaire.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html lang="fr-FR">
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
        ArrayList<Medicament> listemedic = new ArrayList<Medicament>(){};
        listemedic=new Medicament().GetAllMedic();
        
        
        //request.getSession().setAttribute("panier", panier);
        
        
        ArrayList<FactMedic> basket= new ArrayList<FactMedic>(){};
        //basket= (ArrayList<Medicament>)request.getSession().getAttribute("panier");
        basket=(ArrayList<FactMedic>)session.getAttribute("panier");
       
       

    
    %>
<div id="container">
	<div id="header">
		<img src="affichage/image/hopital.png" alt="logo hopital">

	</div>
	<div class="navbar">
		 <nav class="navbar navbar-inverse">
				<div class="container-fluid">
	 				<div class="navbar-header">
	  			    	<a class="navbar-brand" href="index.jsp">HOPITAL</a>
                                                <a class="navbar-brand" href="Addnew.jsp"> Personnel</a>
                                                <a class="navbar-brand" href="Pharmacie.jsp"> Pharmacie</a>
                                                
	 	   			</div>

				    	<ul class="nav navbar-nav">
				    	 	
				      		
				    	</ul>
    
    		<ul class="nav navbar-nav navbar-right">
                    <!--<li><a id="toggle"><i class="fa fa-search"> Recherche</i></a></li>-->
      			<li><a href="login.html"><span class="fa fa-sign-in"></span> Log out</a></li>
    		</ul>
  			</div>
		</nav>
	</div>
    <div class="panier">
        <button  type="button" class="pull-right btn btn-info" id="toggle" name="toggle"><i class="fa fa-shopping-cart" ></i> Mon Panier <span class="badge"> <% out.print(basket.size()); %> </span></button>
        <form action="AddMedic.jsp">
            <button class="pull-right btn btn-info" type="submit" style="margin-right: 2px">Nouveau <i class="fa fa-plus-circle"></i></button>
        </form>
    </div>

	

	<div id="content">
            <form method="POST" action="AltPanier.jsp">
            <table class="table table-hover">
                <tr>
                    <th>Designation</th>
                    <th>Description</th>
                    <th>Prix</th>
                    <th>Nombre</th>
                    <th>Ajouter au panier</th>
                </tr>
                
                <% int i=0; while(i<listemedic.size()){%>
                <tr>
                    <td><% out.print(listemedic.get(i).getNom()); %></td>
                    <td><% if(listemedic.get(i).getDesc()!=null) out.println(listemedic.get(i).getDesc()); %></td>
                    <td><% out.print(listemedic.get(i).getPrix()); %></td>
                    <td><input type="number" min="0" name="nombre" style="color:#000"></td>
                    <td><button type="submit" class="btn btn-primary" name="addbasket"><i class="fa fa-shopping-cart isLink" style="color:#FFF"> Ajouter au panier </i></a> </button> </td>
              
                </tr>
                <%i++;}%>
                
            </table>
            </form>
            
                             
             <div id="MonPanier">
                 <table class="table">
                     <tr>
                         <th>Designation</th>
                         <th>Nombre</th>
                         <th>Prix Unitaire</th>
                         <th>Action</th>
                     </tr>
                     
                 
                 <%
                    int j=0;
                    while(j<basket.size()){
                        %>
                        <tr>
                            <td><%= basket.get(j).getNom()%></td>
                            <td><%= basket.get(j).getNbr()%></td>
                            <td><%= basket.get(j).getPrix()%></td>
                            <td><a href="removePanier.jsp?id=<%= basket.get(j).getId()%>"><i class="fa fa-trash lien"> Remove</i></a></td>
                                
                        </tr>
                        <%
                        j++;
                    }
                %>
                </table>
                <div class="form-group">
                    <form method="POST" action="FactureMedic.jsp">
                        <button type="submit" class="btn btn-primary" style="margin-left: 225px;margin-bottom: 5px">
                            <i class="fa fa-credit-card-alt"> Facturer </i>
                        </button>
                    </form>
                    <form method="POST" action="removePanier.jsp?id=0">
                        <button type="submit" class="btn btn-danger" style="margin-left: 225px;margin-bottom: 5px;width: 95px">
                            <i class="fa fa-trash-o"> Vider</i>
                        </button>
                    </form>
                </div>
            </div>
           
	
        </div>
</div>
               
    <script>
    $("#MonPanier").hide();
    $("#toggle").click(function(){
        
            $('#MonPanier').fadeToggle(500);     // jQuery <>1.4.4
    });
    </script>
    
   
    

</body>


</html>