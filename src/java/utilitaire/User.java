/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

 
public class User {
    private int idUser;
    private String nomUser;
    private String DateNaissanceUser;
    private String mailUser;
    private String ContactUser;
    private String pwdUser;

    public User(){}
    /**
     * @return the idUser
     */
    public int getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    /**
     * @return the nomUser
     */
    public String getNomUser() {
        return nomUser;
    }

    /**
     * @param nomUser the nomUser to set
     */
    public void setNomUser(String nomUser) {
        this.nomUser = nomUser;
    }

    /**
     * @return the DateNaissanceUser
     */
    public String getDateNaissanceUser() {
        return DateNaissanceUser;
    }

    /**
     * @param DateNaissanceUser the DateNaissanceUser to set
     */
    public void setDateNaissanceUser(String DateNaissanceUser) {
        this.DateNaissanceUser = DateNaissanceUser;
    }

    /**
     * @return the mailUser
     */
    public String getMailUser() {
        return mailUser;
    }

    /**
     * @param mailUser the mailUser to set
     */
    public void setMailUser(String mailUser) {
        this.mailUser = mailUser;
    }

    /**
     * @return the ContactUser
     */
    public String getContactUser() {
        return ContactUser;
    }

    /**
     * @param ContactUser the ContactUser to set
     */
    public void setContactUser(String ContactUser) {
        this.ContactUser = ContactUser;
    }

    /**
     * @return the pswUser
     */
    public String getPwdUser() {
        return pwdUser;
    }

    /**
     * @param pswUser the pswUser to set
     */
    public void setPwdUser(String pwdUser) {
        this.pwdUser = pwdUser;
    }
    
    public  void inscrire(User us){
         String req ="insert into utilisateur values (iduser.nextval,'"+us.getNomUser()+"','"+us.getMailUser()+"','"+us.getContactUser()+"','"+us.getDateNaissanceUser()+"','"+us.getPwdUser()+"')";
        try {
            UtilDB util = new UtilDB();
            Connection c=util.getConnOracle();
            Statement s=c.createStatement();
            //out.print(req);
            //s.executeQuery(req);
            
            
        } catch (Exception ex) {
            ex.getMessage();
        }
        
        
    }
    
    public static int checkMail(String Mail){
        int result=0;
        String req ="Select count(*) from Utilisateur where mailuser='"+Mail+"'";
        try {
            UtilDB util = new UtilDB();
            Connection c=util.getConnOracle();
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(req);
            result=rs.getInt(1);
            
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }
}
