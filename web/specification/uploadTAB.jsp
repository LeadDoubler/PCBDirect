<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 11:06:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" title="Upload Gerber" home="Y">
    <stripes:layout-component name="contents">

        <stripes:form action="/qoute/Qoute.action" focus="" method="post" id="uploadForm" >
            <stripes:hidden name="qoute" id="qouten" value=""/>
            <stripes:hidden name="specification" id="specific"/>
            <stripes:hidden name="specification.user"/>

            <div class="marginleft">
                <table width="85%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top" width="100%">
                            <table border="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" align="left" valign="top">
                                        <div id="ddtabs4" class="ddcolortabs">
                                            <ul>
                                                <c:if test="${!actionBean.goBack eq false}">
                                                    <li><a id="link_ct1" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.specification.id}';"><span>PCB specification</span></a></li>
                                                    <li><a id="link_ct2" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.specification.id}&tab=layout';"><span>Layout</span></a></li>
                                                    <li><a id="link_ct4" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?edit&specification=${actionBean.specification.id}';"><span>Calculate Price</span></a></li>
                                                    </c:if>
                                                <li><a id="link_ct3" class="current"><span>Upload</span></a></li>
                                                <li><a id="link_ct5" onclick="document.forms['uploadForm'].action = '${pageContext.request.contextPath}/qoute/Qoute.action?upload=';document.forms['uploadForm'].submit();"><span>Verify PCB</span></a></li>
                                                <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a></li>
                                            </ul>
                                        </div>
                                        <div class="panel panel-default">
                                            <div id="ct3" class="tabcontent">
                                                <table width="525" border="0" cellpadding="0" cellspacing="0">
                                                    <tr><td height="8"></td></tr>
                                                    <tr>
                                                        <td class="content10px" style="color:#58595B;">Please upload your zip file here.<br/>It must contain both gerber files and panel drawing.</td>
                                                    </tr>
                                                    <c:if test="${not empty actionBean.context.validationErrors['file']}">
                                                        <tr><td height="4"></td></tr>
                                                        <tr>
                                                            <td>
                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td class="contenterror">
                                                                            <stripes:errors field="file">
                                                                                <stripes:individual-error/>
                                                                            </stripes:errors>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                    <tr><td height="8"></td></tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <span class="title">Zip-file(1)</span><br/>
                                                                <span>
                                                                    <stripes:file name="file"></stripes:file>
                                                                        <img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Please press \'Browse\' and locate your .Zip file');" onmouseout="hideToolTip();"/>
                                                                    </span>
                                                                    <span class="content10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <c:choose>
                                                                        <c:when test="${actionBean.hasFile}">
                                                                            <a target="_blank" href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.specification.id}/${actionBean.specification.gerberdata}">${actionBean.specification.gerberdata}</a><br>
                                                                        </c:when>
                                                                        <c:otherwise><span class="content10px">File not uploaded!</span></c:otherwise>
                                                                    </c:choose></span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr><td height="4"></td></tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <span class="title">Zip-file(2)</span><br/>
                                                                <span>
                                                                    <stripes:file name="file1"></stripes:file>
                                                                        <img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Please upload your panel drawing here, by first pressing \'Browse\' and then select your panel drawing on your computer.');" onmouseout="hideToolTip();"/>
                                                                    </span>
                                                                    <span class="content10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <c:choose>
                                                                        <c:when test="${actionBean.hasFile1}">
                                                                            <a target="_blank" href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.specification.id}/${actionBean.specification.gerberdata1}">${actionBean.specification.gerberdata1}</a><br>
                                                                        </c:when>
                                                                        <c:otherwise><span class="content10px">File not uploaded!</span></c:otherwise>
                                                                    </c:choose></span>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr><td><div><cat:sheet x="63" y="18"/></div></td></tr>

                                                    <tr><td height="16"></td></tr>
                                                    <tr>
                                                        <td>
                                                            <table border="0" cellpadding="0">
                                                                <tr>
                                                                    <td><stripes:submit class="logininner" name="edit" value="Back"/></td>
                                                                    <td><stripes:submit class="logininner" name="upload" value="Upload"/></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr><td height="16"></td></tr>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td height="8"></td></tr>
                </table>
            </div>
        </stripes:form>

    </stripes:layout-component>
</stripes:layout-render>