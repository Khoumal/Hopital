/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
/**
 *
 * @author HKhoumal
 */
public class Personnel {
    private int idpersonnel;
    private int idposte;
    private String nomposte;
    private String nompersonnel;
    private Date datedenaissance;
    private String mdp;
    private String  mail;
    private String contact;
    
    public Personnel(){}
    public Personnel(String nom,Date dtn,String mail,String mdp,String contact,int idposte){
        this.nompersonnel=nom;
        this.mail=mail;
        this.datedenaissance=dtn;
        this.mdp=mdp;
        this.idposte=idposte;
        this.contact=contact;
    }

    /**
     * @return the idpersonnel
     */
    public int getIdpersonnel() {
        return idpersonnel;
    }

    /**
     * @param idpersonnel the idpersonnel to set
     */
    public void setIdpersonnel(int idpersonnel) {
        this.idpersonnel = idpersonnel;
    }

    /**
     * @return the idposte
     */
    public int getIdposte() {
        return idposte;
    }

    /**
     * @param idposte the idposte to set
     */
    public void setIdposte(int idposte) {
        this.idposte = idposte;
    }

    /**
     * @return the nompersonnel
     */
    public String getNompersonnel() {
        return nompersonnel;
    }

    /**
     * @param nompersonnel the nompersonnel to set
     */
    public void setNompersonnel(String nompersonnel) {
        this.nompersonnel = nompersonnel;
    }

    /**
     * @return the datedenaissance
     */
    public Date getDatedenaissance() {
        return datedenaissance;
    }

    /**
     * @param datedenaissance the datedenaissance to set
     */
    public void setDatedenaissance(Date datedenaissance) {
        this.datedenaissance = datedenaissance;
    }

    /**
     * @return the mail
     */
    public String getMail() {
        return mail;
    }

    /**
     * @param mail the mail to set
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
    }
    /**
     * @return the nomposte
     */
    public String getNomposte() {
        return nomposte;
    }

    /**
     * @param nomposte the nomposte to set
     */
    public void setNomposte(String nomposte) {
        this.nomposte = nomposte;
    }
    
    public void addPersonnel(Personnel pers){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String req="insert into Personnel(id_personnel,nompersonnel,mail,datenaissance,motdepasse,idpost,contact) values (id_Personnel.nextVal,'"+pers.getNompersonnel()+"','"+pers.getMail()+"',TO_DATE('"+sdf.format(pers.getDatedenaissance())+"','yyyy-mm-dd'),'"+pers.getMdp()+"',"+pers.getIdposte()+",'"+pers.getContact()+"')";

                       // out.print(req);
                        try{
                            UtilDB util = new UtilDB();
				Connection c=util.getConnOracle();
				//out.print(req);
                                
				Statement s=c.createStatement();
				s.executeQuery(req);
				c.commit();

			}
			catch(Exception e){
				e.getMessage();	
			}
    }
    
    public ArrayList<Personnel> GetAllPersonnelPoste(){
        String req="select * from PersonnelPoste";
        ArrayList<Personnel> listePers= new ArrayList(){};
        try{
                UtilDB util = new UtilDB();
                Connection c=util.getConnOracle();
                //out.print(req);

                Statement s=c.createStatement();
                ResultSet rs=s.executeQuery(req);
                while (rs.next()){
                    Personnel p= new Personnel();
                    p.setNompersonnel(rs.getString(1));
                    p.setDatedenaissance(rs.getDate(2));
                    p.setMail(rs.getString(3));
                    p.setContact(rs.getString(4));
                    p.setNomposte(rs.getString(5));
                    p.setIdpersonnel(rs.getInt(6));
                    
                    listePers.add(p);
                    
                }
                c.commit();
                               
                }
                catch(Exception e){
                        e.getMessage();	
                        return null;
                }
        return listePers;   
    }
    
    public Personnel FindPers(int id){
        String req= "select * from PersonnelPoste where ID_PERSONNEL="+id;
        Personnel pers= new Personnel();
        try{
                UtilDB util = new UtilDB();
                Connection c=util.getConnOracle();
                //out.print(req);

                Statement s=c.createStatement();
                ResultSet rs=s.executeQuery(req);
                while (rs.next()){
                   pers.setNompersonnel(rs.getString(1));
                   pers.setDatedenaissance(rs.getDate(2));
                   pers.setMail(rs.getString(3));
                   pers.setContact(rs.getString(4));
                   pers.setNomposte(rs.getString(5));
                   pers.setIdpersonnel(rs.getInt(6));
                    
                }
                c.commit();
                               
                }
                catch(Exception e){
                        e.getMessage();	
                        return null;
                }
        return pers;
    }
    
    public void UpdatePers(int id,int pst,String nom,String daten,String mail,String contact){
        String req="update personnel set nompersonnel='"+nom+"',idpost="+pst+",datenaissance=to_date('"+daten+"','yyyy-mm-dd'), mail='"+mail+"',contact='"+contact+"' where id_personnel="+id+"";
    try{
                UtilDB util = new UtilDB();
                Connection c=util.getConnOracle();
                //out.print(req);
                Statement s=c.createStatement();
                s.executeQuery(req); 
                c.commit();
                c.close();
                }
    catch(Exception e){
            e.getMessage();	

    }
    }

    /**
     * @return the mdp
     */
    public String getMdp() {
        return mdp;
    }

    /**
     * @param mdp the mdp to set
     */
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }
}
