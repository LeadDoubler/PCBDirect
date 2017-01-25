package part;

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ include file="/taglibs.jsp"%>
  
<stripes:form action="/part/Part.action" focus="" method="post" >
<stripes:hidden name="part"/>
<stripes:hidden name="part.page"/>
<stripes:hidden name="part.name"/>
<stripes:hidden name="type" value="${param.type}"/>

    
            <c:choose>
                
            <c:when test="${param.type eq 'heading'}">
                <stripes:text name="part.content"/>
            </c:when>
            <c:when test="${param.type eq 'area'}">
                <stripes:textarea name="part.content" rows="5">${actionBean.part.content}</stripes:textarea>
            </c:when>
            <c:when test="${param.type eq 'file'}">
                <FCK:editor id="part.content"     
                                    width="100%"
                                    height="200"
                                    toolbarSet="File">${actionBean.part.content}</FCK:editor>
            </c:when>
            <c:when test="${param.type eq 'link'}">
                Text:<stripes:text name="part.content"/><br/>
                Link:<stripes:select name="part.linkTo">
                        <c:forEach items="${page.tree}" var="p">
                            <stripes:option value="/page/${p.id}" title="${p.id}">${p.treeTitle}</stripes:option>
                        </c:forEach>
                </stripes:select>
            </c:when>
            <c:otherwise>
                

                <c:choose>
                    <c:when test="${actionBean.part.content eq null}">
                        <%--Denne del er nedarvet fra en anden side. - Gå til den for at redigere for hele site:
                        <a href="${pageContext.request.contextPath}/page/Show.action?page=${page.viewParts[actionBean.part.name].page}">${page.viewParts[actionBean.part.name].page.title}</a> eller overskriv ved at gemme denne tekst.
                        --%>
                        <FCK:editor id="part.content"     
                                    width="95%"
                                    height="300"
                                    toolbarSet="Catalog">${page.viewParts[actionBean.part.name].content}</FCK:editor>
                    </c:when>
                    <c:otherwise>
                       
                        <FCK:editor id="part.content"     
                                    width="95%"
                                    height="300"
                                    toolbarSet="Catalog">${actionBean.part.content}</FCK:editor>
                                    
                 
                    </c:otherwise>
                </c:choose>
                
                  
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${param.type eq 'file' or param.type eq ''}">
                  <stripes:button class="login" name="inlineSave" value="Opdater"
                                onclick="inlineSavePart(this.form, this.name, 'part_${actionBean.part.name}');"/>
            </c:when>
            <c:otherwise>
                  <stripes:button class="login" name="inlineSave" value="Opdater"
                                onclick="vokePart(this.form, this.name, 'part_${actionBean.part.name}');"/>
       
            </c:otherwise>
        </c:choose>
        <stripes:button class="login" onclick="$('fckeditorWindow').innerHTML=''" value="Cancel" name="cancel"/>
            
         
        
       <%-- <c:choose>
            <c:when test="${actionBean.part.id == null}">
                
                <stripes:submit name="inlineAdd" value="Adder"/>
                
            </c:when>
            <c:otherwise>
           
            <stripes:submit name="inlineSave" value="Gem"/>
            --%> 
                   <%--
            
                <stripes:button name="inlineSave" value="Gem"
                                onclick="voke(this.form, this.name, 'part_${actionBean.part.name}');"/>
                                
                                --%>
       <%--    </c:otherwise>
        </c:choose>--%>
        
       
    </stripes:form>

