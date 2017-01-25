<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" language="${page.language.value}" title="Dashboard">
    <stripes:layout-component name="contents">
        <div id="fckeditorWindow"> </div>
             <div id="ToolTip" class="ToolTip"><table border="0" cellpadding="0" cellspacing="0"><tr><td class='ToolTipTD' id="ToolTipContent">&nbsp;</li></table></div>
                <div class="container">
                    <jsp:include page="admin/${user.role}.jsp"/>
                </div><!-- container -->
    </stripes:layout-component>

                <stripes:layout-component name="menu">
                    <li><a class="xn-text" href="${pageContext.request.contextPath}/specification/Specification.action">Start quotation</a></li>
                        <li><a class="xn-text" href="${pageContext.request.contextPath}/share/Sharing.action?act=q">Share quotations</a></li>
                        <li><a class="xn-text" href="${pageContext.request.contextPath}/share/Sharing.action?act=o">Share orders</a></li>
                        <li><a class="xn-text " href="${pageContext.request.contextPath}/documentation/pcbdirectdocs.jsp">Documentation</a></li>
                        <li><a class="xn-text" href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${user}">Personal settings</a></li>
                        <li><a class="xn-text" onclick="javascript:contactPCB(this,'${user.username}','${user.firstName}','${user.lastName}','${user.company}','${user.street}','${user.city}','${user.postalCode}','${user.phone}');">Contact PCB-direct</a></li>
                        <li><a class="xn-text" href="${pageContext.request.contextPath}/user/Logout.action">Logout</a></li>

                </stripes:layout-component>
</stripes:layout-render>