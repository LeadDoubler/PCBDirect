/*
 * UploadActionBean.java
 *
 * Created on 23. november 2007, 21:53
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.web.upload;

import com.asap.security.Role;
import com.asap.security.Secure;
import com.asap.web.CatalogActionBean;
import com.asap.web.specification.SpecificationActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.FileBean;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.ValidationErrors;

import java.io.File;
import java.io.IOException;

/**
 * @author JRO
 */
@Secure(role = Role.MODERATOR, currentUser = true)
public class UploadActionBean extends CatalogActionBean {
    private FileBean file;
    private String filename;
    private double schemeVer;
    private String check;

    private String error;

    public FileBean getFile() {
        return file;
    }

    public void setFile(FileBean file) {
        this.file = file;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    @DefaultHandler
    public Resolution edit() {
        schemeVer = -999;
        return new ForwardResolution("edit.jsp");
    }

    public Resolution upload() {
        if (file != null) {
            filename = file.getFileName();
            try {
                String path = getContext().getServletContext().getRealPath(SpecificationActionBean.filename);
                File f = new File(path);
                file.save(f);
                System.out.println("Path=" + path);
                if (f.exists()) {
                    System.out.println("File exists");
                }
//                SpreadsheetManager.getInstance().setJxcell(new Spreadsheet(path));
//                System.out.println("Path="+path);
            } catch (IOException ex) {
                ex.printStackTrace();
                setError("An error occured!: " + ex);
            }
        }
        if (check != null && check.equals("true")) {
            if (schemeVer >= 0) {
                int liUpdatedItems = getSession().createQuery("update Qoute q set q.version =:version").setDouble("version", schemeVer).executeUpdate();
                persist();
                ValidationErrors error = new ValidationErrors();
                error.addGlobalError(new SimpleError("Total number of quotes affected: " + liUpdatedItems));
                System.out.println("Total number of quotes affected: " + liUpdatedItems);
                getContext().setValidationErrors(error);
            }
        }
        return new ForwardResolution("edit.jsp");
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public double getSchemeVer() {
        return schemeVer;
    }

    public void setSchemeVer(double schemeVer) {
        this.schemeVer = schemeVer;
    }
}
