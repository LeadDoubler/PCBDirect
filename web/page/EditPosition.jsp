<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Rediger side">
    <stripes:layout-component name="contents">
        <stripes:form action="/page/Page.action" method="post" >
            <stripes:hidden name="leftPage" id="leftPage"/>
            <h2>
                <c:choose>
                    <c:when test="${actionBean.page.id == null}">                            
                        Ny side
                    </c:when>
                    <c:otherwise>                           
                        Rediger side
                        <stripes:hidden name="page"/>            
                    </c:otherwise>
                </c:choose>
            </h2>
            
            <div><span class="form_left">Placering af side</span>
                <span class="form_right">
                    <a href="#" onclick="$('leftPage').value='';alert($('leftPage').value)">Placer her</a><br/>
                    <c:forEach items="${actionBean.page.parent.sortedChildList}" var="otherPage">
                        <c:choose>
                            <c:when test="${otherPage eq actionBean.page}">                            
                            </c:when>
                            <c:otherwise>
                                ${otherPage.title}<br/>
                                <a href="#" onclick="$('leftPage').value=${otherPage};alert($('leftPage').value)">Placer her</a><br/>                                
                            </c:otherwise>
                        </c:choose>
                        
                       
                    </c:forEach>
                </span>
            </div>
             
            <stripes:submit name="saveNewPosition" value="Gem" style="float:right"/>
        </stripes:form>
    </stripes:layout-component>
</stripes:layout-render>

