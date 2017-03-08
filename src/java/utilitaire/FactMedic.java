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
public class FactMedic extends Medicament{
    int nbr;
    
    public FactMedic(){}
    
    public int getNbr(){
        return this.nbr;
    }
    public void setNbr(int n){
        this.nbr=n;
    }
}
