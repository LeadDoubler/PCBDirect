<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 11:06:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglibs.jsp" %>

<stripes:layout-render name="/layout/standard.jsp" title="Upload Gerber" home="Y">
    <stripes:layout-component name="contents">

        <stripes:form action="/qoute/Qoute.action" method="post" id="uploadForm" onsubmit="return false;">
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
                                                <li><a id="link_ct1"
                                                       onclick="window.location='${pageContext.request.contextPath}/specification/Specification.action?viewOnly&specification=${actionBean.specification.id}';"><span>PCB specification</span></a>
                                                </li>
                                                <li><a id="link_ct2"
                                                       onclick="window.location='${pageContext.request.contextPath}/specification/Specification.action?viewOnly&specification=${actionBean.specification.id}&tab=layout';"><span>Layout</span></a>
                                                </li>
                                                <li><a id="link_ct4" class="disabled"><span>Calculate Price</span></a></li>
                                                <li><a id="link_ct3" class="current"><span>Upload</span></a></li>
                                                <li><a id="link_ct5" class="disabled"><span>Verify PCB</span></a></li>
                                                <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tabcontainer">
                                            <div id="ct3" class="tabcontent">
                                                <table width="525" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td height="8"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <span class="title">Zip-file(1)</span><br/>
                                                                <c:choose>
                                                                    <c:when test="${actionBean.hasFile}">
                                                                        <a target="_blank"
                                                                           href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.specification.id}/${actionBean.specification.gerberdata}">${actionBean.specification.gerberdata}</a><br>
                                                                    </c:when>
                                                                    <c:otherwise><span
                                                                            class="content10px">File not uploaded!</span></c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="4"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div>
                                                                <span class="title">Zip-file(2)</span><br/>
                                                                <c:choose>
                                                                    <c:when test="${actionBean.hasFile1}">
                                                                        <a target="_blank"
                                                                           href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.specification.id}/${actionBean.specification.gerberdata1}">${actionBean.specification.gerberdata1}</a><br>
                                                                    </c:when>
                                                                    <c:otherwise><span
                                                                            class="content10px">File not uploaded!</span></c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td height="16"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table border="0" cellpadding="0">
                                                                <tr>
                                                                    <td><td class="login"><a onclick="javascript:window.location='${pageContext.request.contextPath}/specification/Specification.action?viewOnly&specification=${actionBean.specification.id}&tab=layout';">Back</a></td></td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="16"></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="8"></td>
                    </tr>
                </table>
            </div>
        </stripes:form>
    </stripes:layout-component>
</stripes:layout-render>