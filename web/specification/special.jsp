<%@ include file="/taglibs.jsp"%>
<div class="row" id="referencepart">

    <div class="col-md-6">

                                    <div class="form-group">
                                                <label class="col-md-3 control-label">Other type of mask:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                        <stripes:select class="form-control" name="specification.othermask">
                        <stripes:option value="None" label="None"/>
                        <stripes:option value="Bluemask" label="Bluemask"/>
                        <stripes:option value="Carbon" label="Carbon"/>
                    </stripes:select>
                                                                        </div>

        <span class="help-block">Choose mask type</span>

                                                                   </div>
                                            </div>

      <div class="form-group">
                                                <label class="col-md-3 control-label">Impedance:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                   <stripes:select class="form-control" name="specification.impedance">
                       <stripes:option value="No" label="No"/>
                       <stripes:option value="Yes" label="Yes"/>
                    </stripes:select>
                                                                        </div>

        <span class="help-block">Choose impedance</span>

                                                                   </div>
                                            </div>

<div class="form-group">
                                                <label class="col-md-3 control-label">Gold finger:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                                   <stripes:select class="form-control" name="specification.goldfinger">
                        <stripes:option value="No" label="No"/>
                        <stripes:option value="Yes" label="Yes"/>
                    </stripes:select>
                                                                        </div>

        <span class="help-block">Choose gold finger</span>

                                                                   </div>
                                            </div>



        </div>
    <div class="col-md-6">
        <div class="form-group">
    <label class="col-md-3 control-label">Edge plating:</label>
    <div class="col-md-9">
        <div class="input-group">
            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                       <stripes:select class="form-control" name="specification.edgplating">
<stripes:option selected="selected" value="No" label="No"/>
<stripes:option value="Yes" label="Yes"/>
</stripes:select>
                            </div>

        <span class="help-block">Choose edge plating</span>

                       </div>
</div>

<div class="form-group">
    <label class="col-md-3 control-label">Pressfit requirements:</label>
    <div class="col-md-9">
        <div class="input-group">
            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                       <stripes:select class="form-control" name="specification.pressfitreq">
                       <stripes:option value="No" label="No" selected="selected"/>
                       <stripes:option value="Yes" label="Yes"/>
                    </stripes:select>
                            </div>
        <span class="help-block">Choose pressfit</span>

                       </div>
    
</div>

<div class="form-group">
    <label class="col-md-3 control-label">Choice of Build-up:</label>
    <div class="col-md-9">
        <div class="input-group">
            <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
            <stripes:select class="form-control" name="specification.buildupchoice">
           <stripes:option selected="selected" value="None-specified build-up" label="None-specified build-up"/>
           <stripes:option value="Customized build-up" label="Customized build-up"/>
        </stripes:select>
                </div>

        <span class="help-block">Choose build-up</span>

    </div>

</div>
    </div>
</div>



