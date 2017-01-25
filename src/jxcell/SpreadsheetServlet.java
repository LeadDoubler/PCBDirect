/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package jxcell;

import com.asap.web.specification.SpecificationActionBean;

import javax.servlet.*;
import java.io.IOException;

/**
 *
 * @author mortenmatras
 */
public class SpreadsheetServlet implements Servlet{
    
    ServletConfig servletConfig;

    public void init(ServletConfig servletConfig) throws ServletException {
        this.servletConfig = servletConfig;
        SpreadsheetManager.getInstance(servletConfig.getServletContext().getRealPath(SpecificationActionBean.filename));
    }

    public ServletConfig getServletConfig() {
        return servletConfig;
    }

    public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
       
    }

    public String getServletInfo() {
        return "";
       
    }

    public void destroy() {
        
    }

}
