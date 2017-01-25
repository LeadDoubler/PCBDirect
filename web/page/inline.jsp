<%@ include file="/taglibs.jsp"%>
        <stripes:form action="/page/Page.action" method="post" >
            <stripes:hidden name="page"/>
            <stripes:hidden name="oldParent"/>
            <div>
                    <stripes:submit name="save" value="Gem" style="float:right"/>
                </div>
           
                <div>
                    <span class="form_left">Overskrift</span>
                    <span class="form_right"><stripes:text name="page.title" value="${actionBean.page.title}"/></span>
                </div>

               <%-- <div>
                    <span class="form_left">Banner</span>
                    <span class="form_right"><stripes:file name="photo"/></span>
                </div>
                --%>
                <div>
                    <span class="form_left">
                        Type
                    </span>
                    <span class="form_right">
                        <stripes:select name="page.pageType">
                            <stripes:option value="default">Normal</stripes:option>
                            <stripes:option value="front">Forside</stripes:option>
                         </stripes:select>
                    </span>
                </div>
                
                <c:if test="${not (actionBean.page.banner_type.value eq 0)}">
                    <div>
                        <span class="form_left">Bevar banner:</span>
                        <span class="form_right"><stripes:checkbox name="imageactive"/></span>
                    </div>
                </c:if>

                <div>
                    <span class="form_left">Placeres under</span>
                    <span class="form_right">
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
                    </span>
                </div>

                <div>
                    <span class="form_left">Indhold:</span>
                </div>
                <div>
                    <span>
                        <FCK:editor                           
                                id="page.content"
                                width="100%"
                                height="300"
                                toolbarSet="Page">${actionBean.page.content}
                        </FCK:editor>
                    </span>
                </div>
                <div>
                    <stripes:submit name="save" value="Gem" style="float:right"/>
                </div>
        </stripes:form>

