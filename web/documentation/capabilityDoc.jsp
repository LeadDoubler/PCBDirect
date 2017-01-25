<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 5:44:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Capability" home="Y">
    <stripes:layout-component name="contents">
        <div class="table-responsive">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <td style="border-left:none;" class="title"></td>
                        <td class="title">Azitech</td>
                        <td class="title">PCB-direct</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="gray0">
                        <td>Max Layer Count</td>
                        <td>50</td>
                        <td>8</td>
                    </tr>
                    <tr class="gray1">
                        <td>Min Board Thickness</td>
                        <td>0.3mm</td>
                        <td>0.3mm</td>
                    </tr>
                    <tr class="gray0">
                        <td>Max Board Thickness</td>
                        <td>3mm</td>
                        <td>3mm</td>
                    </tr>
                    <tr class="gray1">
                        <td>Max. Finished Copper Thickness (O/L)</td>
                        <td>200um</td>
                        <td>200um</td>
                    </tr>
                    <tr class="gray0">
                        <td>Max. Finished Copper Thickness (I/L)</td>
                        <td>18um</td>
                        <td>18um</td>
                    </tr>
                    <tr class="gray1">
                        <td>Maximum Panel Size</td>
                        <td>540x610</td>
                        <td>540x610</td>
                    </tr>
                    <tr class="gray0">
                        <td>Smallest Mech Drill Diameter</td>
                        <td>0.1mm</td>
                        <td>0.2mm</td>
                    </tr>
                    <tr class="gray1">
                        <td>Smallest Laser Drill Diameter</td>
                        <td>0.004mm</td>
                        <td>No</td>
                    </tr>
                    <tr class="gray0">
                        <td>Min Finished Hole Size</td>
                        <td>0.075mm</td>
                        <td>0.2mm</td>
                    </tr>
                    <tr class="gray1">
                        <td>Max Thru Hole Aspect Ratio</td>
                        <td>30:1</td>
                        <td>8:1</td>
                    </tr>
                    <tr class="gray0">
                        <td>Max Blind Via Aspect Ratio</td>
                        <td>0.75:1</td>
                        <td>No</td>
                    </tr>
                    <tr class="gray1">
                        <td>Min LW/LS</td>
                        <td>0.05mm</td>
                        <td>0.1mm</td>
                    </tr>
                    <tr class="gray0">
                        <td>Min Pad Size</td>
                        <td>0.19mm</td>
                        <td>0,4mm</td>
                    </tr>
                    <tr class="gray1">
                        <td>Controlled Impedance Tolerance</td>
                        <td>5%</td>
                        <td>10%</td>
                    </tr>
                    <tr class="gray0">
                        <td>Heatsinks</td>
                        <td>Yes</td>
                        <td>No</td>
                    </tr>
                </tbody>

                <thead>
                    <tr>
                        <td style="border-left:none;" colspan="3">Available Reports</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="gray0">
                        <td width="231px">Microsection</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="gray1">
                        <td>Solderability</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="gray0">
                        <td>X-ray Fluorescence</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="gray1">
                        <td>Ionic Contamination</td>
                        <td>Yes</td>
                        <td>No</td>
                    </tr>
                    <tr class="gray0">
                        <td>Time Domain Reflectometry test (TDR)</td>
                        <td>Yes</td>
                        <td>No</td>
                    </tr>
                    <tr class="gray1">
                        <td>FAI</td>
                        <td>Yes</td>
                        <td>No</td>
                    </tr>
                    <tr class="gray0">
                        <td>Certificate of Compliance (C of C)</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                </tbody>
                <thead>
                    <tr>
                        <td style="border-left:none;" colspan="3">UL</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="gray0">
                        <td width="231px">94VO</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                </tbody>

                <thead>
                    <tr>
                        <td style="border-left:none;" colspan="3">PCB Classifications</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="gray0">
                        <td width="231px">IPC 6012, Class 1, 2 & 3</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="gray1">
                        <td>ISO 9001:2000</td>
                        <td>Yes</td>
                        <td>Yes</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script type="text/javascript">
    document.getElementById('capabilityDocLink').className = "current";
</script>
