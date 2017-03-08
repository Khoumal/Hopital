/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.Date;
import java.util.ArrayList;
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
public class PersonnelTest {
    
    public PersonnelTest() {
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
     * Test of getIdpersonnel method, of class Personnel.
     */
    
   
    @Test
    public void testAddPersonnel() {
        System.out.println("addPersonnel");
        Personnel pers = new Personnel("jean",new Date(95,12,1),"mail@mail.com","motdepasse","03030303",1);
        Personnel instance = new Personnel();
        instance.addPersonnel(pers);
        // TODO review the generated test code and remove the default call to fail.
     //   fail("The test case is a prototype.");
    }

   

    

    
   

    
    
}
