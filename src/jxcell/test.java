/*
 * test.java
 *
 * Created on 24. oktober 2007, 20:46
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package jxcell;

import com.jxcell.CellException;
import com.jxcell.View;

import java.io.IOException;

/**
 *
 * @author jro
 */
public class test {
    /** Creates a new instance of test */
    public static void main(String[] args){
        View view = new View();
        try {
            view.read("d:/blob/calc.xls");
            view.setActiveCell(9,28);
            String res = view.getText();
            System.out.println(res);
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (CellException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
}
