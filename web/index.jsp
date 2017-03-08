<%@page import="utilitaire.FactMedic"%>
<%@page import="utilitaire.Medicament"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utilitaire.Poste"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitaire.UtilDB"%>
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
        Poste pst= new Poste();
        ArrayList<Poste> listePoste = new ArrayList<Poste>(){};
        listePoste=pst.getAllPost();
        ArrayList<FactMedic> panier = new ArrayList<FactMedic>(){};
        session.setAttribute("panier", panier);

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
                                                <a class="navbar-brand" href="Login.jsp"> Login</a>
                                                
	 	   			</div>

				    	<ul class="nav navbar-nav">
				    	 	
				      		
				    	</ul>
    
    		<ul class="nav navbar-nav navbar-right">
                    <li><a id="toggle"><i class="fa fa-search"> Recherche</i></a></li>
      			<li><a href="login.html"><span class="fa fa-sign-in"></span> Log out</a></li>
    		</ul>
  			</div>
		</nav>
	</div>

	

	<div id="content">
           <!-- <button onclick="javascript:Rappel(19,12)">notif</button>-->
	<!-- <div class="menu">
		<ul>
			<a href=""><li><i class="fa fa-bars fa-2x"></i></li></a>
			<a href=""><li><i class="fa fa-info fa-2x"></i></li></a>
			<a href=""><li><i class="fa fa-book fa-2x"></i></li></a>
		</ul>
	</div>-->
                <div id="critere">  
                    <form method="POST" class="recherche" action="#">
                        <div class="form-group">
                            <label for="critere"> critere</label> 
                            <select name="find" class="form-control">
                                <option value="NOMPERSONNEL">Nom</option>
                                <option value="MAIL">Mail</option>
                                <option value="CONTACT">Contact</option>
                            </select> 
                        </div>
                        <div class="form-group">
                            <label> Poste </label>
                        <select name="poste" class="form-control">
                                <option value="">Tous</option>
                                <% int i=0; while(i<listePoste.size()){%>
                                <option value="<% out.print(listePoste.get(i).getId()); %>"> <% out.print(listePoste.get(i).getNom()); %></option>
                                <%i++; }%>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Valeur</label>
                            <input type="text" name="cond" class="form-control" placeholder="...">
                        </div>
                        <div class="form-group">
                            Date avant : <input type="date" name="avant" class="form-control" placeholder="AAAA-MM-JJ" >
                        </div>
                        <div class="form-group">
                            Date apres : <input type="date" name="apres" class="form-control" placeholder="AAAA-MM-JJ" >
                        </div>
                        
                        
                        
                        <input type="submit" name="recherche" value="Rechercher" class="btn btn-default">
                    </form>  
                </div>
        <%
            
        if (request.getParameter("recherche")!=null){
			String critere = request.getParameter("find");
                        
                        String condition = request.getParameter("cond");
                        String avant= request.getParameter("avant");
                        String apres = request.getParameter("apres");
                        String poste= request.getParameter("poste");
                        
                       String ReqPost=" and post.idpost="+poste;
                        String ReqAllPers="select personnel.nompersonnel,personnel.datenaissance,personnel.mail,personnel.contact,post.nom_post,personnel.id_personnel from personnel";
                        String Reqpers = " where "+critere+" like '%"+condition+"%'";
                        String ReqDateavant = " And DATENAISSANCE between TO_DATE('"+avant+"','yyyy-mm-dd')";
                        String currDate = " AND CURRENT_TIMESTAMP";
                        String ReqDateapres= " AND TO_DATE('"+apres+"','yyyy-mm-dd')";
                        String JoinPoste =" join POST on post.idpost=personnel.idpost";
                        
                        String req=ReqAllPers;
                        req+=JoinPoste;
                        
                        
                       
                        
                        if(  !condition.equals("")){
                            req+=Reqpers;
                        }
                        if( !poste.equals("")){
                            req+=ReqPost;
                        }
                        //out.print(req);
                        if(  !avant.equals("")) {
                            req+=ReqDateavant;
                            
                            if( apres.equals("")  ){
                                req+=currDate;
                            }
                            if( !apres.equals("")){
                                req+=ReqDateapres;
                            }
                        }
                        
                        
                        
                        
                         //  out.print(req);    
                        //String req="insert into personnel (nompersonnel,mail,datenaissance,motdepasse,idpost,contact) values ('"+n+"','"+mail+"','"+date+"','"+mdp+"','1',"+contact+");";
               
            
                        try{
                            UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				Statement s=c.createStatement();
                            //   req="select personnel.nompersonnel,personnel.datenaissance,personnel.mail,personnel.contact,post.nom_post from personnel join post on post.idpost=personnel.idpost where "+critere+" like '%"+condition+"%' OR  DATENAISSANCE between TO_DATE('"+avant+"','yyyy-mm-dd') AND TO_DATE('"+apres+"','yyyy-mm-dd')";
                           // out.print(req);                                
                                ResultSet rs=s.executeQuery(req);
                        
     %>
                  <div class="un">
                      <div class="col-sm-1"></div>
                     <table class="table table-hover col-sm-10">
                         <tr>
                             <th>Nom</th>
                             <th> Date de naissance</th>
                             <th>Poste</th>
                             <th> Mail </th>
                             <th> Contact </th>
                             <th></th>
                             <th></th>
                         </tr>
      <%                         while(rs.next()){ %>
                             <tr>
                             <td><% out.print(rs.getString(1)); %></td>
                             <td><% out .print(rs.getDate(2)); %></td>
                             <td><% out.print(rs.getString(5)); %></td>
                             <td><% out.print (rs.getString(3));%></td>
                             <td><% out.print (rs.getString(4));%></td>
                             <td><a href="UpdatePers.jsp?id=<%out.print(rs.getString(6));%>"><i class="fa fa-edit isLink" style="color: #FFF"></i></a></td>
                             <td><a href="#" onClick="confirmation(<%out.print(rs.getString(6)); %>)"><i class="fa fa-trash-o isLink" style="color: #FFF"></i></a></td>
                         </tr>       
      <%                          }
				

			}
			catch(Exception e){
				e.getMessage();	
			}
			

			
	
                       

			
	}
        

    
    %>                 
                  
		 
                         
                     </table>
    <div class="col-sm-1"></div>
                       
		
		</div>

	
</div>
    <script>
    $("#critere").hide();
    $("#toggle").click(function(){
            $('#critere').fadeToggle(1000);     // jQuery <>1.4.4
    });
    </script>
    <script>
        function confirmation(id){
           
            if(confirm("Voulez-vous vraiment supprimer ce personnel?")){
                
               window.location.href= "DeletePers.jsp?id="+id;
            }
            
            
        }
    </script>
   
    <script>
        function notif(){
            Notification.requestPermission( function(status) {
              console.log(status); // les notifications ne seront affichées que si "autorisées"
              var n = new Notification("Application 'Vita' ", {body: "ty le rappel oh"}); // this also shows the notification
            });
        }
        function NotifAfterTimeOut(){
            setTimeout(function(){
                        notif();
                        }, 3000);
        }
        
        function Rappel( heure, min){
            var datedebut= new Date();
            alert("fonction rappel declenché, compte à rebours en cours le " +datedebut.getHours()+":"+datedebut.getMinutes()+":"+datedebut.getSeconds()+"");
            
              setInterval(function(){ 
                    var ladate=new Date()
                    var h= ladate.getHours();
                    var m=ladate.getMinutes();
                  if(min==m){
                    notif();
                    
                   }
              }, 60000);
        }
    </script>

</body>


</html>