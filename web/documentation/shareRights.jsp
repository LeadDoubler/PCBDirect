<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 5:44:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Share Rights" home="Y">
    <stripes:layout-component name="contents">
         <div class="table-responsive">
                                        <table class="table table-striped">
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td valign="top" colspan="2" id="qualityREF">
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr><td class="title" align="left" style="font-weight: bold;">Quotations:</td></tr>
                                        <tr><td height="8"></td></tr>
                                        
                                        <tr>
                                            <td valign="top" class="rounded_leftrightborder">
                                                <table style="width:388px;" class="round-table" border="0" cellpadding="0" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <td style="border-left:none;" class="title">&nbsp;</td>
                                                            <td style="border-left:none;" class="title">Edit & Order</td>
                                                            <td class="title">View & Order</td>
                                                            <td class="title">View Only</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gray0">
                                                            <td>View specifications</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                        </tr>
                                                        <tr class="gray1">
                                                            <td>Edit specifications</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray0">
                                                            <td>Calculate price</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray1">
                                                            <td>Upload Gerber</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray0">
                                                            <td>Place order</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray1">
                                                            <td>Share quotation</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray0">
                                                            <td>See all users</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                        <tr><td height="16px"></td></tr>
                                        <tr><td class="title" align="left" style="font-weight: bold;">Orders:</td></tr>
                                        <tr><td height="8"></td></tr>
                   
                                        <tr>
                                            <td valign="top" class="rounded_leftrightborder">
                                                <table style="width:388px;" class="round-table" border="0" cellpadding="0" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <td style="border-left:none;" class="title">&nbsp;</td>
                                                            <td style="border-left:none;" class="title" width="25%">Repeat order</td>
                                                            <td class="title" width="20%">View order</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="gray0">
                                                            <td>View order</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                        </tr>
                                                        <tr class="gray1">
                                                            <td>Calculate price</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr class="gray0">
                                                            <td>Place order</td>
                                                            <td align="center"><img src="${pageContext.request.contextPath}/images/valid.png"/></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
