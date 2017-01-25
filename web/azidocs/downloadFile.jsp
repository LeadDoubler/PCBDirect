<%@ page import="java.io.*" %>
<%--
  User: Gaurav Gharat
  Date: Apr 16, 2009
  Time: 2:59:12 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String lsFilepath = request.getSession().getServletContext().getRealPath("") + request.getParameter("file");

    try
    {
        BufferedInputStream loBufferedInputStream = new BufferedInputStream(new FileInputStream(lsFilepath));

        response.setHeader("Content-Disposition", "attachment; filename=" + lsFilepath.substring(lsFilepath.lastIndexOf("/") + 1,lsFilepath.length()));
        response.setContentType("application/x-download");

        OutputStream loOutputStream = response.getOutputStream();
        int li;
        while ((li = loBufferedInputStream.read()) != -1)
        {
            loOutputStream.write(li);
        }
        loBufferedInputStream.close();

        if (loOutputStream != null)
        {
            loOutputStream.flush();
            loOutputStream.close();
        }
    }
    catch (FileNotFoundException fofnf)
    {
        response.setContentType("text/html");
        out.println("File Not Found. File may be moved or not present at Server. Please Contact your Administrator.");
    }
    catch (Exception feException)
    {
        out.println(feException.toString());
    }
%>