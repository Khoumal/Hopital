/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author HKhoumal
 */
public class Poste {
    private int id;
    private String Nom;
    
    public Poste(int id, String nom){
        this.id=id;
        this.Nom=nom;
    }
    public Poste(){}

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the Nom
     */
    public String getNom() {
        return Nom;
    }

    /**
     * @param Nom the Nom to set
     */
    public void setNom(String Nom) {
        this.Nom = Nom;
    }
    
    public ArrayList<Poste> getAllPost(){
        String reqGetPoste="select * from Post";
    ArrayList<Poste> poste= new ArrayList(){};
    
    
    try{
        UtilDB u= new UtilDB();
        Connection c =u.getConnOracle();
        Statement s=c.createStatement();
        ResultSet rs=s.executeQuery(reqGetPoste);
        
        while(rs.next()){
            Poste p= new Poste();
            p.setId(rs.getInt(1));
            p.setNom(rs.getString(2));
            poste.add(p);  
        }
        return poste;
    }
    catch(Exception e){
	e.getMessage();	
    }
        return null;
    }
    
    public void AddPost(String n, int sal) throws SQLException, Exception{
        UtilDB u= new UtilDB();
        String req="insert into POST values (idpost.nextVal,'"+n+"',"+sal+")";
        Connection c =u.getConnOracle();
        Statement s=c.createStatement();
        s.executeQuery(req);
        c.commit();
    }
    
    public Poste FindPoste(int id){
        return null;
    }
}
