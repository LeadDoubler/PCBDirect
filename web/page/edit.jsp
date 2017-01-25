<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" method="editPage" title="Tilføj/Rediger side">
    <stripes:layout-component name="contents">
        <script>
            function setPageTitle(){
                if($('page.heading').value==''){
                    $('page.heading').value=$('page.title').value;
                }
            }
</script>
        <h2>
            <cat:part part="page.edit.title" site="yes">
                Rediger side
            </cat:part>
        </h2>
           
        <cat:part part="page.edit.intro" site="yes">
            Rediger siden ved at udfylde denne formular
        </cat:part>
        <stripes:form action="/page/Page.action" method="post" focus="page.title" >
            <stripes:hidden name="page"/>
            <stripes:hidden name="oldParent"/>
            
            <div><span class="title">Menu titel:</span>
                <span class="form_right">
                    <stripes:text name="page.title" size="40" value="${actionBean.page.title}" id="page.title"/>
                </span>
            </div>
            
            <div><span class="title">Overskrift:</span>
                <span class="form_right">
                    
                    <stripes:text name="page.heading" size="40" id="page.heading" 
                    onfocus="setPageTitle();"/>
                </span>
            </div>
            
            <div>
                <span class="title">
                    Skal siden vises i menuen?
                </span>
                <span class="form_right">
                    <stripes:radio name="page.hide" value="no" checked="checked"/> Ja, siden skal vises i menuen<br/>
                   <stripes:radio name="page.hide" value="yes"/> Nej, siden skal ikke vises i menuen
                    
                </span>
            </div>
                
                
            <%--
            <cat:in name="doShow" info="Vis i menuen" label="Vis i menu" type="checkbox"/>
            --%>
            
            <cat:in label="Keywords" name="page.keyword" type="text"/>
            <cat:in label="Description" name="page.description" type="textarea"/>
            
<%--
            <cat:userAccess role="5">
                <div><span class="title">Banner:</span>
                    <span class="form_right">
                    <stripes:file name="photo" size="40"/></span>
                </div>
                <c:if test="${not (page.banner_type.value eq 0)}">
                    <div>
                        <span class="title">Bevar banner:</span>
                        <span class="title"><stripes:checkbox name="imageactive"/></span>
                    </div>
                </c:if>
             </cat:userAccess>
             --%>
            <div class="marginleft">
             <cat:userAccess role="4">   
                <span class="title">Placeres under:</span>
                    <span class="form_right">
                        <c:choose>
                            <c:when test="${actionBean.page.id eq null}">                            
                                <c:set var="pages" value="${actionBean.page.parent.tree}" />
                            </c:when>
                            <c:otherwise>                           
                                <c:set var="pages" value="${actionBean.page.treeExcluded}" />                            
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${pages == null}">
                            <label>Ingen sider tilgængelige</label>
                        </c:if>
                        <stripes:select name="newParent">
                            <c:forEach items="${pages}" var="optPage">
                                <c:if test="${actionBean.page.id == null or optPage.id != actionBean.page.id and optPage.parent.id != actionBean.page.id and optPage.parent.parent.id != actionBean.page.id}">
                                    <option value="${optPage.id}" <c:if test="${optPage.id eq actionBean.page.parent.id}">selected="selected"</c:if>>${optPage.treeTitle}</option>
                                </c:if>
                            </c:forEach>
                        </stripes:select>
                    </span>
            </cat:userAccess>
            </div>
            <div><span class="title">Indhold:</span>
                <FCK:editor                           
                    id="page.content"
                    width="600"
                    height="400"
                    toolbarSet="Page">${actionBean.page.content}
                </FCK:editor>
            </div>
            
            <stripes:submit class="login" name="save" value="Gem" style="float:right"/>
            
            <%--
            <table width="100%">
                <tr>
                    <td>Overskrift</td><td>:</td>
                    <td><stripes:text name="page.title" value="${actionBean.page.title}"/></td>
                </tr>

                <tr>
                    <td>Banner</td><td>:</td>
                    <td><stripes:file name="photo"/></td>
                </tr>
                
                <c:if test="${not (actionBean.page.banner_type.value eq 0)}">
                    <tr>
                        <td>Bevar banner:</td><td>:</td>
                        <td><stripes:checkbox name="imageactive"/></td>
                    </tr>
                </c:if>

                <tr>
                    <td>Placeres under</td><td>:</td>
                    <td>
                        <c:choose>
                            <c:when test="${actionBean.page.id eq null}">                            
                                <c:set var="pages" value="${actionBean.page.parent.tree}" />
                            </c:when>
                            <c:otherwise>                           
                                <c:set var="pages" value="${actionBean.page.treeExcluded}" />                            
                            </c:otherwise>
                        </c:choose>
                        <stripes:select name="newParent">
                            <c:forEach items="${pages}" var="optPage">
                                <c:if test="${actionBean.page.id == null or optPage.id != actionBean.page.id and optPage.parent.id != actionBean.page.id and optPage.parent.parent.id != actionBean.page.id}">
                                    <option value="${optPage.id}" <c:if test="${optPage.id eq actionBean.page.parent.id}">selected="selected"</c:if>>${optPage.treeTitle}</option>
                                </c:if>
                            </c:forEach>
                        </stripes:select>
                    </td>
                </tr>

                <tr>
                    <td colspan="3">Indhold:</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <FCK:editor                           
                                id="page.content"
                                width="100%"
                                height="300"
                                toolbarSet="Page">${actionBean.page.content}
                        </FCK:editor>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><stripes:submit name="save" value="Gem" style="float:right"/></td>
                </tr>
            </table>--%>
        </stripes:form>
    </stripes:layout-component>
</stripes:layout-render>

