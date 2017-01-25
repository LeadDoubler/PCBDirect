<#include "Header.ftl">

<h2>Log in request by new PCB-direct user: <font style="color:red;"><b>'${user.username}'</b></font></h2>

<h3><font style="color:red;"><b>${user.username}</b></font> has requested access to PCB-direct.</h3>

<table border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td>First name</td>
        <td>:</td>
        <td>${user.firstName}</td>
    </tr>
    <tr>
        <td>Last name</td>
        <td>:</td>
        <td>${user.lastName}</td>
    </tr>
    <tr>
        <td>Username</td>
        <td>:</td>
        <td>${user.username}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>:</td>
        <td>${user.email}</td>
    </tr>
    <tr>
        <td>Company</td>
        <td>:</td>
        <td>${user.company!}</td>
    </tr>
    <tr>
        <td>Phone</td>
        <td>:</td>
        <td>${user.phone}</td>
    </tr>

    <tr>
        <td>Mobile</td>
        <td>:</td>
        <td>${user.mobile!}</td>
    </tr>

    <tr>
        <td>Street</td>
        <td>:</td>
        <td>${user.street}</td>
    </tr>
    <tr>
        <td>City</td>
        <td>:</td>
        <td>${user.city}</td>
    </tr>
    <tr>
        <td>Postal code</td>
        <td>:</td>
        <td>${user.postalCode}</td>
    </tr>
    <tr>
        <td>Country for delivery</td>
        <td>:</td>
        <td>${user.country}</td>
    </tr>
    <tr>
        <td>Currency</td>
        <td>:</td>
        <td>${user.currency}</td>
    </tr>
    <tr>
        <td>Sent invoice to</td>
        <td>:</td>
        <td>${user.sentinvoiceto!}</td>
    </tr>
</table>

<#include "Footer.ftl">

</body>
</html>