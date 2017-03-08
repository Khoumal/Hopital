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
public class Medicament {
    private int idmedic;
    private String nom;
    private String desc;
    private int prix;
    private String daty;
    
    public Medicament (){}
    
    public Medicament(String nom,String desc,int prix,String date){
        this.nom=nom;
        this.desc= desc;
        this.prix=prix;
        this.daty=date;
    }
    public ArrayList<Medicament> GetAllMedic(){
        
        try{
            String req="select * from medic";
            ArrayList<Medicament> listmedic = new ArrayList<Medicament>(){};
             UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				Statement s=c.createStatement();
				ResultSet rs=s.executeQuery(req); 
                                
                                while (rs.next()){
                                   Medicament medic = new Medicament();
                                   medic.setId(rs.getInt(1));
                                   medic.setNom(rs.getString(2));
                                   medic.setDesc(rs.getString(3));
                                   medic.setPrix(rs.getInt(4));
                                   medic.setDaty(rs.getDate(5).toString());
                                   listmedic.add(medic);
                                   
                                }
                                return listmedic;
        }
        catch(Exception e){
            e.printStackTrace();
                    return null;
        }
        
    }
    
    public Medicament findMedic(int id){
        
        try{
            String req="select * from medic where idmedic="+id;
            Medicament medic = new Medicament();
            
             UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				Statement s=c.createStatement();
				ResultSet rs=s.executeQuery(req); 
                                
                                
                                while (rs.next()){
                                   medic.setId(rs.getInt(1));
                                   medic.setNom(rs.getString(2));
                                   medic.setDesc(rs.getString(3));
                                   medic.setPrix(rs.getInt(4));
                                   medic.setDaty(rs.getDate(5).toString());
                                   
                                }
                                return medic;
        }
        catch(Exception e){
            e.printStackTrace();
                    return null;
        }
        
    }
    public boolean insertMedic(String nom,String desc, int prix, String d){
        String req="insert into MEDICAMENT values (idmedic.nextVal,idevoprix.nextVal,'"+nom+"','"+desc+"')";
        String req1="insert into prixmedic values (idevoprix.currval,"+prix+",to_date('"+d+"','dd-mm-yyyy'))";

                       // out.print(req);
                        try{
                            UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				//out.print(req);
                                
				Statement s=c.createStatement();
				s.executeQuery(req);
                                s.executeQuery(req1);
				c.commit();
                               return true;
			}
			catch(Exception e){
				e.getMessage();	
			}
                        return false;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }
    public void setId(int id){
        this.idmedic=id;
    }
    public int getId(){
        return this.idmedic;
    }
    

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the prix
     */
    public int getPrix() {
        return prix;
    }

    /**
     * @param prix the prix to set
     */
    public void setPrix(int prix) {
        this.prix = prix;
    }

    /**
     * @return the daty
     */
    public String getDaty() {
        return daty;
    }

    /**
     * @param daty the daty to set
     */
    public void setDaty(String daty) {
        this.daty = daty;
    }
}
