<%@ include file="/taglibs.jsp" %> 
<stripes:layout-render name="/layout/start.jsp" title="">
    <fmt:setBundle basename="StripesResources"/>

    <stripes:layout-component name="complete">

        <stripes:form beanclass="Expression actionBean is undefined on line 7, column 36 in Templates/JSP_Servlet/JSP.jsp.">
            <stripes:hidden name="Expression actionBean is undefined on line 8, column 37 in Templates/JSP_Servlet/JSP.jsp."/>
            <ul>
                <cat:in name="email" label="Email"/>
                <cat:in name="zip" label="postnummer"/>
                <cat:in name="city" label="By"/>
                <cat:in name="phone" label="Tlf"/>

            <li>
            <stripes:submit name="save" value="save"/>
            </li>
</ul>
        </stripes:form>

</stripes:layout-component>
</stripes:layout-render>
