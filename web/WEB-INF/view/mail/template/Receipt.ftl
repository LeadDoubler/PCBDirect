<#include "Header.ftl">

<h2>PCB-direct has confirmed your order</h2>

<br/>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">Dear <font style="color:red;"><b>${order.username}</b></font>. Please see below order
            information or log on to <a href="http://www.PCB-direct.dk">(Click to see)</a></td>
    </tr>
    <tr>
        <td height="16" colspan="3"></td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td><b>Date</b></td>
                    <td>:</td>
                    <td>${order.stringDate}</td>
                </tr>
                <tr>
                    <td><b>User</b></td>
                    <td>:</td>
                    <td>${order.username}</td>
                </tr>
                <tr>
                    <td><b>Specification</b></td>
                    <td>:</td>
                    <td>${order.reference}</td>
                </tr>
                <tr>
                    <td><b>Quantity</b></td>
                    <td>:</td>
                    <td>${order.resquantity}</td>
                </tr>
                <tr>
                    <td><b>Transport</b></td>
                    <td>:</td>
                    <td>${order.transport}</td>
                </tr>
                <tr>
                    <td><b>Days</b></td>
                    <td>:</td>
                    <td>${order.restotaldays}</td>
                </tr>
                <tr>
                    <td><b>Total Price</b></td>
                    <td>:</td>
                    <td>${order.restotal} ${order.rescurrency}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br/><br/>

<#include "Footer.ftl">

</body>
</html>