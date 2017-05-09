/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    console.log('ready running'+$('#singleorpanel').val());
   if ($('#singleorpanel').val() == 'Single'){
       $('#single').show();
   }
   else{
       $('#panel').show();
   }
   if ($('#standardorspecial').val() == 'special'){
       $('#special').show();
   }
   if ($('#panelchoice').val() == 'New panel'){
       $('#azitech').show();
   }
});

  var isSingleError = false;
            var iserror = false; //A boolean variable to make sure if required field in Azitech panel layout specification has been filled out properly otherwise it will prevent flow to move forward.
            var iserrorOwnpanel = false; //A boolean variable to make sure if required field in Own panel layout specification has been filled out otherwise it will prevent flow to move forward.
            var iserrorGeneralSpec = false; //A boolean variable to make sure if required field in General Specification has been filled out otherwise it will prevent flow to move forward.

//    $('notused').hide();


            function saveSpec() {
                updateGeneralspe();
                if (!iserror && !iserrorOwnpanel && !iserrorGeneralSpec && !isSingleError) {
                    document.forms['specForm'].action = '${pageContext.request.contextPath}/specification/Specification.action?saveandBack=';
                    document.forms['specForm'].submit();
                }
            }

            function saveAndCreateQuote() {
                updateGeneralspe();
                if (!iserror && !iserrorOwnpanel && !iserrorGeneralSpec && !isSingleError) {
                    document.forms['specForm'].action = 'Specification.action?next=';
                    document.forms['specForm'].submit();
                }
            }

            function updateSingleDim()
            {
                isSingleError = false;
                var psDimx = $('#spcbdimx').val();
                if (psDimx == 0 || psDimx == '0,0')
                {
                    isSingleError = true;
                    $('#xdimspcberror').text("Please fill out PCB dimension (X direction)");
                }
                else
                    $('#xdimspcberror').text("");
                 var psDimy = $('#spcbdimy').val();
                if (psDimy == 0 || psDimy == '0,0')
                {
                    isSingleError = true;
                    $('#ydimspcberror').text("Please fill out PCB dimension (Y direction)");
                }
                else
                    $('#ydimspcberror').text("");
            }

            function updateDim()
            {
                console.log('updateDim');
                iserror = false;
                //Panel dimension (X) = PCB dimension*(No of PCB's in x direction)+(No of PCB's in x direction - 1)*Distance between
                var pDimx = $('#pcbdimx').val().replace(',','.');

                var pDimy = $('#pcbdimy').val().replace(',','.');
                var pcbx = $('#pcbx').val();
                var pcby = $('#pcby').val();
                var dist = $('#distancepcb').val();
                if (dist.toString() == '2,4')
                    dist = 2.4;
                var border = $('#borderpcb').val().replace(',','.');
                var xtotal = (pDimx * pcbx + dist * (pcbx - 1) + 2 * border).toFixed(2);
                var ytotal = (pDimy * pcby + dist * (pcby - 1) + 2 * border).toFixed(2);
                var totalPCB = pcby * pcbx;
                console.log(xtotal);
                if (xtotal > 350)
                    $('#xtotal').html("<font style='color:red;'>" + xtotal + " mm (Maximum recommended dimension is 350 mm)" + "</font>");
                else
                    $('#xtotal').text(xtotal);
                if (ytotal > 350)
                    $('#ytotal').html("<font style='color:red;'>" + ytotal + "mm (Maximum recommended dimension is 350 mm)" + "</font>");
                else
                    $('#ytotal').text(ytotal);

                $('#totalPCB').text(totalPCB);

                if (pcbx == 0)
                {
                    iserror = true;
                    $('#xtotalerror').text("Please fill out numbers of PCBs (X direction)");
                }
                else
                    $('#xtotalerror').text("");
                if (pcby == 0)
                {
                    iserror = true;
                    $('#ytotalerror').text("Please fill out numbers of PCBs (Y direction)");
                }
                else
                    $('#ytotalerror').text("");

                if (pDimx == 0)
                {
                    iserror = true;
                    $('#xdimerror').text("Please fill out PCB dimension (X direction)");
                }
                else
                    $('#xdimerror').text("");
                if (pDimy == 0)
                {
                    iserror = true;
                    $('#ydimerror').text("Please fill out PCB dimension (Y direction)");
                }
                else
                    $('#ydimerror').text("");
                console.log('updateDim is finished');
            }

            function updateOwnPanel()
            {
                iserrorOwnpanel = false;
                var pcbperpanel = $('#pcbperpanel').val();
                if(!isInteger(pcbperpanel))
                {
                    iserrorOwnpanel = true;
                    setVisibility('pcbperpanelerror',1);
                }
                else
                setVisibility('pcbperpanelerror',0);
                updateOwnPaneldimx();
                updateOwnPaneldimy();
            }

            function updateOwnPaneldimx()
            {
                var panelDimx = $('#ownpaneldimx').val();
                if (panelDimx == 0 || panelDimx == '0,0')
                {
                    iserrorOwnpanel = true;
                    setVisibility('pnlxdimerror',1);
                }
                else
                    setVisibility('pnlxdimerror',0);
            }

            function updateOwnPaneldimy()
            {
                var panelDimy = $('#ownpaneldimy').val();
                if (panelDimy == 0 || panelDimy == '0,0')
                {
                    iserrorOwnpanel = true;
                    setVisibility('pnlydimerror',1);
                }
                else
                    setVisibility('pnlydimerror',0);
            }

            function updateGeneralspe()
            {
                console.log('updateGeneralspe');
                updateGenPersonalREF();
                updateGenPcbREF();
                console.log('updated Generalspe');
            }

            function updateGenPersonalREF()
            {
                iserrorGeneralSpec = false;
                var personalref = $('#reference').val();
                if (personalref.length == 0)
                {
                    iserrorGeneralSpec = true;
                    setVisibility('referror',1);
                }
                else
                    setVisibility('referror',0);
            }

            function updateGenPcbREF()
            {
                iserrorGeneralSpec = false;
                var pcbref = $('#pcbreference').val();
                if (pcbref.length == 0)
                {
                    iserrorGeneralSpec = true;
                    setVisibility('pcbreferror',1);
                }
                else
                    setVisibility('pcbreferror',0);
            }

            function setVisibility(id, mode)
            {
                if ($(id) && mode == 0)
                    $('#'+id).hide();
                    /*$(id).style.display = "none";*/
                else if ($(id) && mode == 1)
                    $('#'+id).show();/*.style.display = "block";*/
            }


