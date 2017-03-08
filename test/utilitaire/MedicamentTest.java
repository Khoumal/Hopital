/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.util.ArrayList;
import java.util.Date;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author HKhoumal
 */
public class MedicamentTest {
    
    public MedicamentTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

   

    /**
     * Test of insertMedic method, of class Medicament.
     */
    @Test
    public void testInsertMedic() {
        System.out.println("insertMedic");
        String nom = "medic";
        String desc = "test medic";
        int prix = 100;
        String d = new Date().toString();
        Medicament instance = new Medicament();
        boolean expResult = false;
        boolean result = instance.insertMedic(nom, desc, prix, d);
        assertEquals(expResult, result);
       
    }

    
}
