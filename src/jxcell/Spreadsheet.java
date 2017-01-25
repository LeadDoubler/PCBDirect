package jxcell;

import com.jxcell.CellException;
import com.jxcell.View;

import java.io.IOException;

/*
* This class is Singleton design pattern implementation.
*
* */
public class Spreadsheet {
    private static Spreadsheet sheet;
    private View view;

    private Spreadsheet(String file) {
        if (view == null) {
            view = new View();
            try {
                view.read(file);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (CellException e) {
                e.printStackTrace();
            }
        }
    }

    public static Spreadsheet getInstance(String file) {
       return getInstance(file, false);
    }

    public static Spreadsheet getInstance(String file, boolean forceful) {
        if (sheet == null || forceful) {
            sheet = new Spreadsheet(file);
        }
        return sheet;
    }

//    public Spreadsheet(String file) {
//        getInstance(file);
//        view = new View();
//        try {
//                view.read(file);
//        } catch (IOException e) {
//                e.printStackTrace();
//        } catch (CellException e) {
//                e.printStackTrace();
//        }
//    }

    public void setNumber(Position pos, double val) {
        try {
            getView().setActiveCell(pos.x, pos.y);
            getView().setNumber(val);
        } catch (CellException ex) {
            ex.printStackTrace();
        }
    }

    public void setString(Position pos, String val) {
        try {
            getView().setActiveCell(pos.x, pos.y);
            getView().setText(val);
        } catch (CellException ex) {
            ex.printStackTrace();
        }
    }

    public double getNumber(Position pos) {
        try {
            getView().setActiveCell(pos.x, pos.y);
            return getView().getNumber();
        } catch (CellException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    public String getString(Position pos) {
        try {
            getView().setActiveCell(pos.x, pos.y);
            return getView().getText();
        } catch (CellException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    /**
     * @return the view
     */
    public View getView() {
        return view;
    }

    /**
     * @param view the view to set
     */
    public void setView(View view) {
        this.view = view;
    }
}