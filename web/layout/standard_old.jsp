<%@ include file="/taglibs.jsp" %>

<stripes:layout-definition>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <c:choose>
        <c:when test="${ requestScope['page'] eq null}">
            <fmt:setLocale value="${pageContext.request.locale}"/>
        </c:when>
        <c:otherwise>
            <fmt:setLocale value="${requestScope['page'].locale}"/>
        </c:otherwise>
    </c:choose>
    <fmt:setBundle basename="StripesResources"/>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="google-site-verification" content="oquf9WZgCfIHaD0GdOep8jL_DeAnptqR7fZCry5cN0Q" />
    <meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
    <title>Azitech</title>

    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/images/icon.ico"/>
    <!--[if IE]>
                <style type="text/css">
                    @import url(${pageContext.request.contextPath}/css/IEbugs.css);
                </style>
            <![endif]-->

    <%--<script type='text/javascript' src='${pageContext.request.contextPath}/micoxWordWrap.js'></script>--%>
    <%--<script src="${pageContext.request.contextPath}/FCKeditor/fckeditor.js" type="text/javascript"></script>--%>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/prototype-1.6.0.3.js"></script>
        <%--<script type="text/javascript"--%>
        <%--src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.0.2/prototype.js"></script>--%>

    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/scripts.js"></script>

    <stripes:layout-component name="html-head"/>
    </head>
    <body id="ff-helvetica" class="f-default bc-blue iehandle">
    <div id="maskDIV" style="z-index:5;display:none;position:fixed;width:100%;height:100%;background-color:#fff;filter: alpha(opacity=85);-moz-opacity: 0.85;opacity:0.85;"></div>
        <div id="page-bg">
            <!-- Begin Wrapper -->
            <div class="wrapper">
                <div class="shadow-left">
                    <div class="shadow-right">
                        <div class="main-page">
                            <div class="main-page2">
                                <div class="main-page3">
                                    <div class="main-page4">
                                        <!-- Begin Header -->
                                        <div id="header">
                                          <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td><div><a style="padding-left: 15px;" class="nounder" href="http://www.PCB-direct.dk"><img width="170" height="60" style="margin-top: 12px;" src="${pageContext.request.contextPath}/images/logo-trans.png"/><img width="48" height="34" style="margin-top: 12px;" src="../images/beta.png"/></a></div></td>
                                                    <td rowspan="2" align="right" width="145px">
                                                        <!-- Begin Volusion Live Chat -->
                                                        <%--<div id="VolusionLiveChat"><a href="http://www.volusion.com/livechat_software.asp">Free Live Chat Software</a></div>--%>
                                                        <!-- End Volusion Live Chat -->
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="suckerfish" id="horiz-menu">
                                            <ul class="menutop">
                                                <li class="parent blue item1"><a href="${pageContext.request.contextPath}/startup/Startup.action?home" id="frontpageLink"><span>Frontpage</span></a></li>
                                                <li class="parent blue item1"><a onclick="setDocTag(this.id, 'pcbdirectDoc');" id="pcbdirectDocLink"><span>About PCB-direct</span></a></li>
                                                <li class="parent blue item3"><a onclick="setDocTag(this.id,'capabilityDoc');" id="capabilityDocLink"><span>Capability</span></a></li>
                                                <li class="parent blue item4"><a onclick="setDocTag(this.id,'qualityDoc');" id="qualityDocLink"><span>Quality</span></a></li>
                                                <li class="parent blue item6"><a onclick="setDocTag(this.id,'pcbdirectdocs');" id="downloadDocLink"><span>Download</span></a></li>
                                            </ul>
                                        </div>
                                        <div class="showcase-div"></div>
                                        <%--<script defer type="text/javascript" src="https://livechat.volusion.com/script.aspx?id=281810"></script>--%>
                                        <!-- End Header -->

                                        <!-- Begin Main Content Area -->
                                        <div id="main-section">
                                            <div class="padding">
                                            <div class="main-content block" style="min-height:470px;overflow-y:auto;">
                                                <div id="center-column">
                                                    <div class="padding">
                                                        <stripes:layout-component name="body">
                                                            <div id="fckeditorWindow"><a name="top" id="top"></a></div>
                                                            <div id="ToolTip" class="ToolTip"
                                                                 style="filter: alpha(opacity = 0);-moz-opacity: 0.00;opacity: 0.00;">
                                                                <table border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td class='ToolTipTD' id="ToolTipContent">&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="container">
                                                                    <%--<span style="width:100%;float: right;text-align: right"><cat:part part="header" site="yes"/></span>--%>
                                                                <c:choose>
                                                                    <c:when test="${title !=null}">
                                                                        <div class="header" style="padding-bottom: 0pt; margin-bottom: 10px;">
                                                                            <c:choose>
                                                                                <c:when test="${home !=null && home eq 'Y' && homelinkinfo!=null && homelinkinfo eq 'Y'}">
                                                                                    <div style="float:right;"><a class="bulink"
                                                                                                                 href="${pageContext.request.contextPath}/startup/Startup.action?home"
                                                                                                                 onmouseover="showToolTip(this,'When pressing this button, the quotation will be automatically saved');"
                                                                                                                 onmouseout="hideToolTip();">Back
                                                                                        To Home</a></div>
                                                                                </c:when>
                                                                                <c:when test="${home !=null && home eq 'Y'}">
                                                                                    <c:choose>
                                                                                        <c:when test="${homelinkAction!=null}">
                                                                                            <div style="float:right;"><a class="bulink" onclick="${homelinkAction}">Back To Home</a></div>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <div style="float:right;"><a class="bulink" href="${pageContext.request.contextPath}/startup/Startup.action?home">Back To Home</a></div>
                                                                                        </c:otherwise>
                                                                                    </c:choose>

                                                                                </c:when>
                                                                                <c:otherwise></c:otherwise>
                                                                            </c:choose>

                                                                                ${title}
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise></c:otherwise>
                                                                </c:choose>
                                                                <stripes:layout-component name="contents"/>
                                                                    <%--<cat:part part="footer" site="yes" />--%>
                                                            </div>
                                                            <!-- container -->
                                                        </stripes:layout-component>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>

                                        <!-- Begin Footer -->
                                        <div id="footer">
                                            <div class="footer-left">
                                                <div class="footer-right">
                                                    <div class="footer-mod">
                                                        <div class="moduletable">
                                                            <div style="text-align: center;"><span
                                                                    style="font-family: arial,helvetica,sans-serif; color: rgb(136, 136, 136); font-size: 8pt;">Azitech ApS - Diplomvej 372, 1. Sal - 2800 Kgs. Lyngby - Tlf. +45 6613 0768 - Fax. +45&nbsp;6613 0769 - Email. </span><a
                                                                    href="mailto:Sales@azitech.dk"><span
                                                                    style="font-family: arial,helvetica,sans-serif; color: rgb(136, 136, 136); font-size: 8pt;">PCB-direct@azitech.dk</span></a>
                                                            </div>
                                                            <div style="text-align: center;"><span
                                                                    style="font-family: arial,helvetica,sans-serif; color: rgb(136, 136, 136); font-size: 8pt;">Copyright by Azitech ApS 2008</span>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Footer -->
                                    </div>
                                    <!-- End Main Content Area -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="debug">

            </div>
        </div>
    <!-- End Wrapper -->
    <%-- Google Analytics script START--%>
        <script type="text/javascript">
            var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
            document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
            </script>
            <script type="text/javascript">
            try {
            var pageTracker = _gat._getTracker("UA-11335071-1");
            pageTracker._trackPageview();
            } catch(err) {}
        </script>
    <%-- Google Analytics script END --%>
    </body>
</html>
</stripes:layout-definition>