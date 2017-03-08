/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HKhoumal
 */
public class Pharmacie {
    int idMedic;
    String NomMedic;
    int PrixMedic;
    String Desc;
    
    public ArrayList<Medicament> getAllMedic(){
        ArrayList<Medicament> listeMedic = new ArrayList<Medicament>(){};
        try{
            String req="select medicament.idmedic, medicament.nommedic,medicament.description,prixmedic.prixmedic,prixmedic.dateevoprixmedic from medicament join prixmedic on Medicament.idevoprix=prixmedic.idevoprix";
            
                            UtilDB util = new UtilDB(); 
				Connection c=util.getConnOracle();
				Statement s=c.createStatement();
				ResultSet rs=s.executeQuery(req);
				while (rs.next()){
                                    Medicament medic = new Medicament();
                                    medic.setNom(rs.getString(1));
                                    medic.setDesc(rs.getString(2));
                                    medic.setPrix(rs.getInt(3));
                                    medic.setDaty(rs.getDate(4).toString());
                                    listeMedic.add(medic);
                                }
                                
                              return listeMedic;  
			}
			catch(Exception e){
				e.getMessage();	
                                return null;
			}
         
    }
}
