<%--
  Created by IntelliJ IDEA.
  User: Gaurav Gharat
  Time: 5:44:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Sales & Delivery terms" home="Y">
    <stripes:layout-component name="contents">
        <div class="marginleft">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td style="padding-left:15px;">
                                    <embed width="100%" height="400px" src="${pageContext.request.contextPath}/azidocs/PCB%20Direct%20Basic%20Agreement.pdf"></embed>
                                </td>
                            </tr>
                            <tr><td height="16"></td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script type="text/javascript">
    document.getElementById('salesTermsDocLink').className = "current";
</script>