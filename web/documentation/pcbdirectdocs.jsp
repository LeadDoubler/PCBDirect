<%--
  User: Gaurav Gharat
  Date: Mar 20, 2009
  Time: 6:56:31 PM
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="PCB-direct - Download" home="Y">
    <stripes:layout-component name="contents">
        <div class="marginleft">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                <%--<tr><td >--%>
                    <%--<table border="0" cellpadding="0" cellspacing="0" class="content12px">--%>
                        <%--<tr><td style="font-weight: bold;">Guided Tour</td></tr>--%>
                        <%--<tr><td>The guided tour "From registration to ordering"</td></tr>--%>
                        <%--<tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="http://www.azitech.dk/PCB-direct/PCB-direct%20Guided%20Tour.pdf">View/Download</a></td></tr>--%>
                    <%--</table>--%>
                <%--</td></tr>--%>
                <%--<tr><td height="16px"></td></tr>--%>
                <tr><td>
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">PCB-direct Presentation</td></tr>
                        <tr><td>Brief presentation of PCB-direct and its benefits</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="http://www.azitech.dk/PCB-direct/PCB-direct%20presentation%202010.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">Azitech Presentation</td></tr>
                        <tr><td>Brief presentation of Azitech ApS</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="http://www.azitech.dk/PCB-direct/Azitech%20Presentation%202010.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>

                <tr><td height="16px"></td></tr>
                <tr><td ><table style="border-bottom: 1px dashed #000;" width="170px;" height="5px"><tr><td></td></tr></table></td></tr>
                <tr><td height="16px"></td></tr>

                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">User Agreement</td></tr>
                        <tr><td>The user agreement all users must comply</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="http://www.azitech.dk/PCB-direct/PCB%20Direct%20Basic%20Agreement.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">CoC-document</td></tr>
                        <tr><td>"The certificate of compliance document"</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="http://www.azitech.dk/PCB-direct/Azitech%20CoC.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script type="text/javascript">
    document.getElementById('downloadDocLink').className = "current";
</script>