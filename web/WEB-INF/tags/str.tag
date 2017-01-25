<%@tag description="String Utility Functions" pageEncoding="UTF-8" %>

<%@attribute name="length" required="false" description="String Length" %>
<%@attribute name="value" required="true" description="String Value" %>
<%
    int len = Integer.valueOf(length);

    if (len < value.length()) out.print(value.substring(0, len - 3).concat("..."));
    else  {
        len = value.length();
        out.print(value.substring(0, len));
    }

%>

                
                    
           
    
    
    
    
   
