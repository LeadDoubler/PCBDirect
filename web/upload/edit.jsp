<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" title="Upload new xls" home="Y">
    <stripes:layout-component name="contents">
        <stripes:form action="/upload/Upload.action" focus="" method="post" >
            <div class="marginleft">
                <table border="0" cellpadding="0">
                    <tr><td colspan="2"><span style="color:red"><c:if test="${not empty actionBean.context.validationErrors}"><stripes:errors globalErrorsOnly="true"/></c:if></span></td></tr>
                    <tr>
                        <td colspan="2" class="title">Excell xls-file</td>
                    </tr>
                    <tr>
                        <td colspan="2"><stripes:file name="file"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${actionBean.filename != null && actionBean.error == null}">
                                <span style="color:green">
                                    ${actionBean.filename} uploaded with success!<br>
                                </span>
                            </c:if>
                            <c:if test="${actionBean.error != null}">
                                <span style="color:red">
                                    An error has happened: ${actionBean.error}<br>
                                </span>
                            </c:if>
                        </td>
                    </tr>
                    <tr><td height="8"></td></tr>
                    <tr><td colspan="2" class="title">Reset scheme version for all quotes?</td></tr>
                    <tr><td colspan="2"><stripes:checkbox name="check"/>&nbsp;<stripes:text style="text-align:right" name="schemeVer" class="textwidthadjust"/></td></tr>
                    <tr><td height="8"></td></tr>
                    <tr>
                        <td>
                            <stripes:submit class="login" name="upload" value="Upload"/>
                        </td>
                        <td>
                            <input class="login" type="button" style="cursor:pointer" value="Download Scheme" onclick="window.location='${pageContext.request.contextPath}/scheme.xls';"/>
                        </td>
                    </tr>
                </table>
            </div>
            </stripes:form>
    </stripes:layout-component>

</stripes:layout-render>