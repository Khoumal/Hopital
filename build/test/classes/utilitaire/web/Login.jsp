<%@page import="utilitaire.* "%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>
<%@page import="utilitaire.UtilDB" %>


<html>
<head>
	<title>INSCRIPTION</title>
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/style.css">
        <link rel="stylesheet" type="text/css" href="affichage/css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="affichage/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="affichage/font-awesome-4.6.3/css/font-awesome.min.css">
        
         <script type="text/javascript" src="affichage/js/jquery3.1.1.js"></script>
        <script type="text/javascript" src="affichage/js/jquery-ui.js"></script>
        <script type="text/javascript" src="affichage/js/captcha.js"></script>
        
</head>
<body>
    <div class="entete">
		<img src="affichage/image/hopital.png" alt="logo hopital">
                
    </div>
<div id="contentAdd">
   
	<form method="POST" action="#">
            <div class="form-group">
                    <a class="isLink" href="index.jsp"><i class="fa fa-arrow-left"> Retour</i></a>
            </div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Nom et Prenom</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="user" required="true">
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Date de Naissance</label>
			  <br>
			  <input type="date" class="form-control" id="datepick" name="datenaissance" required="true">
		</div>
		<div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Email</label>
			  <br>
			  <input type="email" class="form-control" name="mail" required="true">
		</div>
            
                <div class="form-group">
			  <label for="usr" style="margin-left: 105px;">Contact</label>
			  <br>
			  <input type="text" class="form-control" id="usr" name="contact" required="true">
		</div>
            
		<div class="form-group">
			  <label for="pwd" style="margin-left: 105px;">Mot de passe</label>
			  <br>
			  <input type="password" class="form-control" id="pwd" name="mdp" pattern="(?=.*\d)(?=.*[&$ù%!§:/;.])(?=.*[a-z])(?=.*[A-Z]).{8,}" required="true">
		</div>
                
                 <div class="form-group">
			  <label for="pwd" style="margin-left: 105px;">Confirmation mot de passe</label>
			  <br>
                          <input type="password" class="form-control err_selected" id="valid" name="valid" required="true"  >
		</div>
		<div class="g-recaptcha" data-sitekey="6Le2jhIUAAAAACJRtxn0ffr5B-7uGnhhhZHtqcdu"></div>
		
		<br><br>
                  
			<input type="submit" name="add" class="btn btn-primary" value="S'inscrire" id="ajouter">
                        <input type="submit" name="checkmdp" class="btn btn-primary" value="checkMDP" id="ajouter">
                        
	</form>
		

</div>
	<% 
            if(request.getParameter("checkmdp")!=null){
                    String mdp = request.getParameter("mdp");
                    String valid = request.getParameter("valid");
                    if(!mdp.equals(valid)){
                        
                    }
             
                    if(request.getParameter("g-recaptcha-response").isEmpty()){
                        out.print(request.getParameter("g-recaptcha-response"));
                    }
                    if(!request.getParameter("g-recaptcha-response").isEmpty()){
                         out.print(request.getParameter("g-recaptcha-response"));
                    }
                    
            }
		if (request.getParameter("add")!=null){
                    
                    
			/*String nom = request.getParameter("user");
                        String dateNaissance = request.getParameter("datenaissance");
                        String mail = request.getParameter("mail");
                        String contact = request.getParameter("contact");
                        String mdp = request.getParameter("mdp");
                        */
                        User newUser = new User();
                        newUser.setNomUser(request.getParameter("user"));
                        newUser.setDateNaissanceUser(request.getParameter("datenaissance"));
                        newUser.setContactUser(request.getParameter("contact"));
                        newUser.setMailUser(request.getParameter("mail"));
                        newUser.setPwdUser(request.getParameter("mdp"));
                       int CheckMail= new User().checkMail(newUser.getMailUser());
                       switch(CheckMail){
                            case 0 :  new User().inscrire(newUser);
                                break;
                            case 1 : %><script> alert("Email déjà utilisé par un autre compte. Reessayez!");</script><% break;
                                
                                default : break;
                        }

                }
%>
<script>
     $( function() {
    $( "#datepick" ).datepicker({
altField: "#datepicker",
closeText: 'Fermer',
prevText: 'Précédent',
nextText: 'Suivant',
currentText: 'Aujourd\'hui',
monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
weekHeader: 'Sem.',
dateFormat: 'yy-mm-dd',
defaultDate: new Date('1995')

});
    } );
</script>

</body>
</html>