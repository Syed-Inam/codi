<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Main.Master" CodeBehind="Concomitant.aspx.cs" Inherits="BVaccine.Concomitant" Culture="en-GB" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .handle
        {
        width:10px;
        height:10px;
        background-color:#aaccee;
        }
        .resizing
        {
        padding:0px;
        border-style:solid;
        border-width:1px;
        border-color:#aaccee;
        cursor:se-resize;
        }
    </style>

    <script type="text/javascript">

        function OnlyNumeric(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }

        function input1(id) {
            var val = document.getElementById(id).value;
            if (val != "" && !(val == 0 || val == 1)) {
                alert('Invalid input value! \nThis field takes only 0 or 1 as input.');
                document.getElementById(id).value = "";
            }
        }

        function input2(id) {
            var val = document.getElementById(id).value;
            if (val != "" && !(val >= 1 && val <= 9)) {
                alert('Invalid input value! \nThis field takes between 1 to 9 as input.');
                document.getElementById(id).value = "";
            }
        }

        function isValidDate(id) {
            var dateString = document.getElementById(id).value;
            var date_regex = /^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-](201[6-9])$/;
            if (dateString != "__/__/____" && !(date_regex.test(dateString))) {
                alert("Enter valid date");
                document.getElementById(id).value = "";
                document.getElementById(id).focus();
            }
        }

        function ongoing(id) {
            if (document.getElementById(id) == cmsr1_f) {
                if (document.getElementById(id).value == 1)
                    document.getElementById('cmsr1_g').disabled = true;
                else
                    document.getElementById('cmsr1_g').disabled = false;
            }

            else if (document.getElementById(id) == cmsr2_f) {
                if (document.getElementById(id).value == 1)
                    document.getElementById('cmsr2_g').disabled = true;
                else
                    document.getElementById('cmsr2_g').disabled = false;
            }

            else if (document.getElementById(id) == cmsr3_f) {
                if (document.getElementById(id).value == 1)
                    document.getElementById('cmsr3_g').disabled = true;
                else
                    document.getElementById('cmsr3_g').disabled = false;
            }

            else if (document.getElementById(id) == cmsr4_f) {
                if (document.getElementById(id).value == 1)
                    document.getElementById('cmsr4_g').disabled = true;
                else
                    document.getElementById('cmsr4_g').disabled = false;
            }

            else if (document.getElementById(id) == cmsr5_f) {
                if (document.getElementById(id).value == 1)
                    document.getElementById('cmsr5_g').disabled = true;
                else
                    document.getElementById('cmsr5_g').disabled = false;
            }
        }

        function showmore(btn) {
            var el = document.getElementById(btn).parentElement.parentElement;
            el.nextElementSibling.style.display = "table-row";
            document.getElementById(btn).style.display = "none";
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div style="text-align: center; margin-top: 30px;">
        <h3 style="text-align: center; margin-top: 40px"><b>Comparison of duration of immunity following IPV and fIPV: <br />A community based randomized Controlled trial in Pakistan  </b></h3>

        <h1 style="margin-top: 40px; text-align:center">Concomitant Medications</h1>    

    <div class="section-title container" style="width: 50%; margin: 2% auto; border: 1px">
        <div style="background-color: #424a5d; height: 50px; border-top-left-radius:5px; border-top-right-radius:5px">
            <h2 style="color: white;text-align: center; margin-top: 10px; padding-top: 10px" class="auto-style5">Participant Data</h2>
            <br />
        </div>
        <div class="login-wrap form-horizontal" style="background-color: #d2d7d9; font-size:medium; padding-left:45px;padding-right:45px">

            <div id="Div1" runat="server">
                <br />
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Study site:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="cmss" runat="server" ClientIDMode="Static" class="form-control" MaxLength="15" Style="text-transform: uppercase;"  ></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Study ID:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="cmsid" runat="server" ClientIDMode="Static" MaxLength="15" class="form-control" Style="text-transform: uppercase;"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="codi99?-9999" MaskType="None" TargetControlID="cmsid" ClearMaskOnLostFocus="false" />
                    </div>
                </div>
                                
            </div>
             <br />           
        </div>
    </div>       


    <div id="divtb" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; border: solid 1px;">
        <div class="divTableBody">

            <div class="divTableRow" style="background-color: #424a5d; color: white;">
                <div class="divTableCell"><strong>Serial</strong></div>
                <div class="divTableCell"><strong>Medication Name</strong></div>
                <div class="divTableCell"><strong>Start Date</strong></div>
                <div class="divTableCell"><strong>Dose/Unit</strong></div>
                <div class="divTableCell"><strong>Frequency</strong></div>
                <div class="divTableCell"><strong>Reason, indication</strong></div>
                <div class="divTableCell"><strong>Ongoing</strong></div>   
                <div class="divTableCell"><strong>Stop Date</strong></div>
                <div class="divTableCell"><strong>Staff</strong></div>    
                <div class="divTableCell"></div>        
            </div>
            <div id="div2" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">1.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_a" CssClass="txtboxx" runat="server" placeholder="" size="15" MaxLength="30" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr1_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="Masked1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr1_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="2" onkeypress="return OnlyNumeric(event)" onkeyup="input2('cmsr1_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_e" CssClass="txtboxx" runat="server" placeholder="" size="15" ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="ongoing('cmsr1_f'); input1('cmsr1_f')" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr1_g')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr1_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <button type="button" id="Button1" onclick="showmore('Button1')">more</button>
                </div>  
            </div>
            
            <div id="div3" runat="server" clientidmode="Static" class="divTableRow" style="display:none">
                <div class="divTableCell">2.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_a" CssClass="txtboxx" runat="server" placeholder="" size="15" MaxLength="30" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr2_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr2_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="2" onkeypress="return OnlyNumeric(event)" onkeyup="input2('cmsr2_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_e" CssClass="txtboxx" runat="server" placeholder="" size="15" ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="ongoing('cmsr2_f'); input1('cmsr2_f')" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr2_g')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr2_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <button type="button" id="Button2" onclick="showmore('Button2')">more</button>
                </div>  
            </div>


            <div id="div4" runat="server" clientidmode="Static" class="divTableRow" style="display:none">
                <div class="divTableCell">3.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_a" CssClass="txtboxx" runat="server" placeholder="" size="15" MaxLength="30" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr3_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr3_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="2" onkeypress="return OnlyNumeric(event)" onkeyup="input2('cmsr3_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_e" CssClass="txtboxx" runat="server" placeholder="" size="15" ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="ongoing('cmsr3_f'); input1('cmsr3_f')" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr3_g')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr3_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="8" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <button type="button" id="Button3" onclick="showmore('Button3')">more</button>
                </div>  
            </div>


            <div id="div6" runat="server" clientidmode="Static" class="divTableRow" style="display:none" >
                <div class="divTableCell">4.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_a" CssClass="txtboxx" runat="server" placeholder="" size="15" MaxLength="30" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr4_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr4_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="2" onkeypress="return OnlyNumeric(event)" onkeyup="input2('cmsr4_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_e" CssClass="txtboxx" runat="server" placeholder="" size="15" ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="ongoing('cmsr4_f'); input1('cmsr4_f')" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr4_g')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender7" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr4_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="7" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <button type="button" id="Button4" onclick="showmore('Button4')">more</button>
                </div>  
            </div>

            <div id="div7" runat="server" clientidmode="Static" class="divTableRow" style="display:none">
                <div class="divTableCell">5.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_a" CssClass="txtboxx" runat="server" placeholder="" size="15" MaxLength="30" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr5_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender8" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr5_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="2" onkeypress="return OnlyNumeric(event)" onkeyup="input2('cmsr5_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_e" CssClass="txtboxx" runat="server" placeholder="" size="15" ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="ongoing('cmsr5_f'); input1('cmsr5_f')" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('cmsr5_g')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender11" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr5_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="7" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>

        </div>
    </div>
    <br />
    <br />
    

    <div id="div5" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #ededed; font-family: Tahoma; border: solid 1px;width:60%;">
            <div class="divTableBody">
                <div class="divTableRow" style="background-color: #424a5d; color: white;">
                    <div class="divTableCell">&nbsp;</div>
                    <div class="divTableCell"><strong>Name</strong></div>
                    <div class="divTableCell"><strong>Date</strong></div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Principal Investigator</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="inv_nm" CssClass="txtboxx" runat="server" placeholder="name" MaxLength="15" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="inv_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('inv_dt')" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender9" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="inv_dt" />
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Supervisor</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="sup_nm" CssClass="txtboxx" runat="server" placeholder="name" MaxLength="15" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="sup_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('sup_dt')" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender10" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="sup_dt" />
                    </div>
                </div>
            </div>
        </div>
        <br /><br />

    <asp:Button ID="btnSubmit" runat="server" class="btn btn-theme btn-block"  OnClientClick="return clicksubmit();" Text="Submit" Style="padding: 8px;width:20%; margin:auto 40%" OnClick="btnSubmit_Click" /><br />
    </div>       
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
     <!-- Footer -->
    <%--<div class="footer" style="position: fixed; bottom: 0px;left: 0px;right: 0px;">
        <div class="container">

      

            </div>
            <div class="row" >
                <div class="col-md-12">
                    <div class="footer-copyright">&copy; Copyright at <a href="https://www.aku.edu/Pages/home.aspx">The Aga Khan University (AKU)</a>, All rights reserved. 2017-18  &nbsp&nbsp  || &nbsp&nbsp  App. Developed by M.Kashif</div>
                </div>
            </div>
        </div>--%>
            
    <!-- Footer -->

</asp:Content>