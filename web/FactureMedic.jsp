<%@page import="utilitaire.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
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
       
       Date now = new Date();
       int jour=now.getDate();
       int mois=now.getMonth();
       int annee=now.getYear();
       String datedujour= String.valueOf(jour);
       String moisEncours=String.valueOf(mois+1);
       String anneeEncours=String.valueOf(annee+1900);
       String daty=datedujour+"/"+moisEncours+"/"+anneeEncours;
       
       String nom="";
    
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
    

	

	<div id="content">
            <div class="facture">
                  <div class="form-group">
                        <form method="POST">
                            <div class="form-group">
                                <label> Au nom de : </label>
                                <input type="text" class="form-control" name="nomClient" id="nom" required>
                                
                            </div>
                            <div class="form-group">
                                <label> Antananarivo, le </label>
                                <label> <%= daty%></label>

                            </div>
                        
                    </div>
                                
                    <div class="form-group">
                        <table class="table">
                            <tr>
                                <th>Designation</th>
                                <th>Quantité</th>
                                <th>Prix unitaire </th>
                                <th>Prix Total</th>
                            </tr>
                            <% for(int i=0;i<basket.size();i++){%>
                            <tr>
                                <td><%= basket.get(i).getNom() %></td>
                                <td><%= basket.get(i).getNbr()%></td>
                                <td><%= basket.get(i).getPrix() %></td>
                                <td><%= basket.get(i).getPrix()*basket.get(i).getNbr()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <%
           int montantTotal=0;
           for(int i=0;i<basket.size();i++){
               montantTotal+=basket.get(i).getPrix()*basket.get(i).getNbr();
           }
           %>
                    <div class="form-group">
                        <input  class="form-control pull-right" type="text" value="<%= montantTotal%>" disabled>
                        <label class="form-control">Montant Total : </label> 
                        
                    </div>
                        
                    
                      
                    <div class="form-group">
                        <input  class="form-control pull-right" type="text" value="<%= montantTotal%>" disabled>
                        <label class="form-control " >Net à Payer : </label>
                    </div>
                    
                
            </div>
           
               <button type="submit" name="ok" class="btn btn-success" style="margin-left: 450px;margin-top: 5px" >
                    <i class="fa fa-check-square-o"> Payer</i>
                </button>
           </form>
         
             
           
	
        </div>
</div>
   
    <%
        if(request.getParameter("ok")!=null){
            String nomClient=request.getParameter("nomClient");
           // out.print(nomClient);
            int tva=20;
            int idmedic=0;
            int qte=0;
                String req="insert into facturemedicm values('"+nomClient+"',to_date('"+daty+"','dd/mm/yyyy '),"+tva+",idfacturem.nextval)";
                String req2="insert into facturemedicf values (idfacturef.nextval,idfacturem.currval,'"+idmedic+"',"+qte+")";
                UtilDB u = new UtilDB();
                Connection c=u.getConnOracle();
		Statement s=c.createStatement();
		s.executeQuery(req); 
                                
                
                for(int i=0;i<basket.size();i++){
                    idmedic=basket.get(i).getId();
                    qte=basket.get(i).getNbr();
                    s.executeQuery(req2);
                }
                response.sendRedirect("index.jsp");
        }
    %>
   
    

</body>
<script>
   $(document).ready(function(){
       $("#nom").change(function(e){
           var name= $("#nom").val();
           $.ajax({
                url: 'set.jsp',
                type: 'POST',
                dataType :'JSON',
                data : 'nom='+name,
                
                    success : function(code, statut){
                        alert(code);
                    }
                    error : function(error,result,status,){
                        alert();
                    }
            });
         });
      });
  
</script>

</html>