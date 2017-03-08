/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.Date;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author HKhoumal
 */
public class Recherche {
    String critere;
    String condition;
    Date avant;
    Date apres;
    
    public Recherche(String crit,String cond,Date avnt,Date aprs){
        
        this.critere=crit;
        this.condition=cond;
        this.avant=avnt;
        this.apres=aprs;
    }
    
    public ArrayList<String> CritereRecherche(String crit,String cond) throws Exception{
        ArrayList<String> result= new ArrayList(){};
        UtilDB util = new UtilDB();
        Connection c=util.getConnOracle();
	Statement s=c.createStatement();
        String req="select * from personnel where "+critere+" like '%"+condition+"%' OR  DATENAISSANCE between TO_DATE('"+avant+"','yyyy-mm-dd') AND TO_DATE('"+apres+"','yyyy-mm-dd')";
                            //out.print(req);                                
        ResultSet rs=s.executeQuery(req);
        while(rs.next()){
            result.add(rs.getString(1));
        }
        return null;
    }
}
