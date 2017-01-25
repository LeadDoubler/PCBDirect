<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>


  
<stripes:form action="/page/Page.action" focus="page.title" method="post" >
    <stripes:hidden name="page.parent"/>

    
    <label>Titel:</label>
            <stripes:text name="page.title" />
        <c:choose>
            <c:when test="${actionBean.page.id == null}">
                
                <stripes:submit name="inlineAdd" value="Adder"/>
                
            </c:when>
            <c:otherwise>
                <stripes:button name="inlineSave" value="Gem"
                                onclick="submitAndReplace(this.form, this.name, '${actionBean.page}');"/>
                
            </c:otherwise>
        </c:choose>
    </stripes:form>
   

