<#include "Header.ftl">

<h2>Your order has successfully been received.</h2>
<br/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td height="16"></td></tr>
	<tr>
        <td width="70px">Dear <font style="color:red"><b>${order.username}</b></font></td>
    </tr>
    <tr><td height="16"></td></tr>
    <tr><td>Thank you for your order, PCB-direct staff will review it and confirm the delivery date as soon as possible.</td></tr>
    <tr><td height="12"></td></tr>
    <tr><td>To view your order or keep track of the production and delivery process, please feel free visit this link: <a href="http://pcb-direct.dk/azitechorder/Order.action?viewReceipt&order=${order.id}">http://pcb-direct.dk/azitechorder/Order.action?viewReceipt&order=${order.id}</a></td></tr>
</table>
<br/><br/>

<#include "Footer.ftl">

</body>
</html>