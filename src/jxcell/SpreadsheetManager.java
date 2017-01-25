/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package jxcell;

/**
 *
 * @author mortenmatras
 */
public class SpreadsheetManager {
    
    private static SpreadsheetManager instance;

    
    private Spreadsheet jxcell;
    
    private SpreadsheetManager(){
        
    }
    
    public static SpreadsheetManager getInstance(String path){
        if (instance == null){
            instance = new SpreadsheetManager();
            instance.setJxcell(Spreadsheet.getInstance(path));
        }
        return instance;
    }
    
    public static SpreadsheetManager getInstance(){
        if (instance == null){
            instance = new SpreadsheetManager();
        }
        return instance;
    }
    

    public Spreadsheet getJxcell() {
        return jxcell;
    }

    public void setJxcell(Spreadsheet jxcell) {
        this.jxcell = jxcell;
    }

}
