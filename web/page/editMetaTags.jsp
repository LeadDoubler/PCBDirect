<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" method="editMetaTags" title="Rediger side">
    <stripes:layout-component name="contents">
        <stripes:form action="/page/Page.action" focus="" method="post" >
            <stripes:hidden name="page"/>
            <stripes:hidden name="newParent"/>
            <stripes:hidden name="oldParent"/>
            
            
            <div><span class="form_left">Type:</span>
                <span class="form_right">
                    <stripes:select name="page.pageType">
                        <stripes:option value="default">Normal</stripes:option>
                        <stripes:option value="front">Forside</stripes:option>
                     </stripes:select>
                </span>
            </div>
            <%--<div>
                <span class="form_left">Url:</span>
                <span class="form_right"><stripes:text name="page.url" size="40" /></span>
            </div>--%>
            <div>
                <span class="form_left">Alias:</span>
                <span class="form_right"><stripes:text name="page.urlMap" size="40" /></span>
            </div>
            <div>
                <span class="form_left">Forward til:</span>
                <span class="form_right"><stripes:text name="page.forward" size="40" /></span>
            </div>
            <div>
                <span class="form_left">Indsæt indhold fra:</span>
                <span class="form_right"><stripes:text name="page.contentforward" size="40" /></span>
            </div>
           <%-- <div>
                <span class="form_left">Keywords:</span>
                <span class="form_right"><stripes:text name="page.keywords" size="40" /></span>
            </div>
            <div>
                <span class="form_left">Beskrivelse:</span>
                <span class="form_right"><stripes:text name="page.description" size="40" /></span>
            </div>
            --%>
            <div>
                <span class="form_right"><stripes:submit name="save" value="Gem"/></span>
                <br/><br/>
            </div>
            
            
            <%--<stripes:submit name="save" value="Gem" style="float:right"/> 
         
             <div><span class="form_left">Title:</span>
                <span class="form_right">

                    <stripes:text name="page.title" size="40" />
            </span></div>
            <div><span class="form_left">Url:</span>
                <span class="form_right">

                    <stripes:text name="page.url" size="40" />
            </span></div>

            <div><span class="form_left">UrlMap:</span>
                <span class="form_right">

                    <stripes:text name="page.urlMap" size="40" />
            </span></div>
        <div><span class="form_left">Forward til:</span>
                <span class="form_right">
                    <stripes:text name="page.forward" size="40" />
            </span></div>
            <div><span class="form_left">Keywords:</span>
                <span class="form_right">

                    <stripes:text name="page.keywords" size="40" />
            </span></div>

            <div><span class="form_left">Description:</span>
                <span class="form_right">

                    <stripes:textarea name="page.description" />
            </span></div>--%>

       

        </stripes:form>
    </stripes:layout-component>
</stripes:layout-render>

