<%@ tag import="jxcell.*"%>
<%@ attribute name="x" required="true" %>
<%@ attribute name="y" required="true" %>
<%
SpreadsheetManager manager = SpreadsheetManager.getInstance();
int intx = Integer.parseInt(x);
int inty = Integer.parseInt(y);
out.print(manager.getJxcell().getString(new Position(intx,inty)));
%>