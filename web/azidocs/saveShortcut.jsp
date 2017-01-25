<%@ page import="java.io.OutputStream" %>
<%--
  User: Gaurav Gharat
  Date: Mar 27, 2009
  Time: 12:08:15 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try
    {
        out.clearBuffer();out.close();
        response.setHeader("Content-Disposition", "attachment; filename=PCB_direct_Login.url");
        response.setContentType("application/x-download");
        String content = "[DEFAULT]\n" +
                        "BASEURL=http://www.pcb-direct.dk/\n" +
                        "[InternetShortcut]\n" +
                        "URL=http://www.pcb-direct.dk/\n" +
                        "IDList=\n" +
                        "IconFile=http://www.pcb-direct.dk/images/icon.ico\n" +       //todo:change URL
                        "IconIndex=1";
        ServletOutputStream loOutputStream = response.getOutputStream();
        loOutputStream.write(content.getBytes(), 0, content.length());
        loOutputStream.flush();
        loOutputStream.close();
    }
    catch (Exception feException)
    {
    }
%>