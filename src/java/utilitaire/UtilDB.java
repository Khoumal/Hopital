package utilitaire;

import java.sql.*;

public class UtilDB {
	
	
	public static Connection getConnOracle() throws Exception {
		Connection conn = null;
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl", "hopital","root");
                        System.out.print(conn);
			
		return conn;
	}
        
        public Connection getConnectionPostgres() throws Exception {
            Connection conn=null; 
            try {

      Class.forName("org.postgresql.Driver");
      System.out.println("Driver O.K.");
      String url = "jdbc:postgresql://localhost:5432/hopital";
      String user = "postgres";
      String passwd = "root";

      conn = DriverManager.getConnection(url, user, passwd);
      System.out.println("Connexion effective !");         

         

    } catch (ClassNotFoundException | SQLException e) {
    }   
	
             return conn;

	 
        }	
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 
 */

