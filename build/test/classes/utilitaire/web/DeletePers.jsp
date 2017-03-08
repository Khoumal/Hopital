<%-- 
    Document   : DeletePers
    Created on : 1 déc. 2016, 13:00:10
    Author     : HKhoumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitaire.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitaire.UtilDB"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
<%
    String id= request.getParameter("id");
    int ind= Integer.parseInt(id);
    
     try{
                UtilDB util = new UtilDB();
                Connection c=util.getConnOracle();
                String req="delete from personnel where id_personnel="+ind;

                Statement s=c.createStatement();
                s.executeQuery(req);
                c.commit();
                               
                }
                catch(Exception e){
                        e.getMessage();	
                        
                }

%>
<jsp:forward page="index.jsp"/>