<%@ include file="/taglibs.jsp" %>
<stripes:layout-render name="/layout/standard.jsp" title="Reset password">
    <fmt:setBundle basename="StripesResources"/>

    <stripes:layout-component name="contents">

        <stripes:form beanclass="${actionBean.class}">
            <stripes:hidden name="key"/>
           <div class="row">

                                        <div class="col-md-12">
                <cat:in name="username" label="Username"/>
                                        </div></div>
                                        <div class="row">

                                        <div class="col-md-12">
                <cat:in name="password1" label="Password"/>
                </div></div>
                                        <div class="row">

                                        <div class="col-md-12">
                <cat:in name="password2" label="Repeat Password"/>

           </div></div>
                                        <div class="row">

                                        <div class="col-md-12">
            <stripes:submit name="reset" value="Reset password"/>
                                        </div></div>
        </stripes:form>

</stripes:layout-component>
</stripes:layout-render>
