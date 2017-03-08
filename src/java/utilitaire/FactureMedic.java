/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

/**
 *
 * @author HKhoumal
 */
public class FactureMedic {
    private String NomMedic;
    private int nbrMedic;
    private int prixUnit;
    private int MontantTotal;
    
    public FactureMedic (){}
    
    public FactureMedic GroupMedic(String nom){
        FactureMedic f= new FactureMedic();
        this.nbrMedic++;
        this.MontantTotal=this.prixUnit*nbrMedic;
        return f;
    }

    public String getNomMedic() {
        return NomMedic;
    }

    public int getNbrMedic() {
        return nbrMedic;
    }

    public int getPrixUnit() {
        return prixUnit;
    }

    public int getMontantTotal() {
        return MontantTotal;
    }

    public void setNomMedic(String NomMedic) {
        this.NomMedic = NomMedic;
    }

    public void setNbrMedic(int nbrMedic) {
        this.nbrMedic = nbrMedic;
    }

    public void setPrixUnit(int prixUnit) {
        this.prixUnit = prixUnit;
    }

    public void setMontantTotal(int MontantTotal) {
        this.MontantTotal = MontantTotal;
    }
}
