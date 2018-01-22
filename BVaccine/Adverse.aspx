<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Adverse.aspx.cs" Inherits="BVaccine.Adverse" Culture="en-GB" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
            if (val != "" && !(val >= 0 && val <= 3)) {
                alert('Invalid input value! \nThis field takes between 1 to 3 as input.');
                document.getElementById(id).value = "";
            }
        }
        function input3(id) {
            var val = document.getElementById(id).value;
            if (val != "" && !(val >= 1 && val <= 4)) {
                alert('Invalid input value! \nThis field takes between 1 to 4 as input.');
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

        function comment1(id) {
            
            var el = document.getElementById(id).nextElementSibling;
            if (document.getElementById(id).value == 3) {
                el.style.display = 'block';
            }
            else {
                el.value = "";
                el.style.display = 'none';
            }                
        }

        function comment2(id) {

            var el = document.getElementById(id).nextElementSibling;
            if (document.getElementById(id).value == 4) {
                el.style.display = 'block';
            }
            else {
                el.value = "";
                el.style.display = 'none';
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <h1 style="margin-top: 60px; text-align:center">Adverse Event Report</h1>    

    <div class="section-title container" style="width: 50%; margin: 2% auto; border: 1px">
        <div style="background-color: #b8b8b8; height: 50px; border-top-left-radius:5px; border-top-right-radius:5px">
            <h2 style="text-align: center; margin-top: 10px; padding-top: 10px" class="auto-style5">Participant Data</h2>
            <br />
        </div>
        <div class="login-wrap form-horizontal" style="background-color: #d2d7d9; font-size:medium; padding-left:45px;padding-right:45px">

            <div id="Div1" runat="server">
                <br />
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Study site:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="aess"  runat="server" ClientIDMode="Static" class="form-control" MaxLength="15" Style="text-transform: uppercase;"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Participant ID:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="aepid" runat="server" ClientIDMode="Static" MaxLength="15" class="form-control" Style="text-transform: uppercase;"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="codi99?-9999" MaskType="None" TargetControlID="aepid" ClearMaskOnLostFocus="false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Participant Initials:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="aepin" runat="server" ClientIDMode="Static" MaxLength="5" class="form-control" Style="text-transform: uppercase;"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Date of birth   </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="aedob" runat="server" ClientIDMode="Static" class="form-control" placeholder="dd/MM/yyyy" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aedob')"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aedob" />
                       <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="aedob" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2020" MinimumValue="01/01/2010" Type="Date"></asp:RangeValidator>
                    </div>
                </div>
            </div>
             <br />           
        </div>
    </div>


    <div id="div5" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #ededed; font-family: Tahoma; border: solid 1px;width:70%;">
            <div class="divTableBody">
                <div class="divTableRow" style="background-color: gray; color: white;">
                    <div class="divTableCell">&nbsp;</div>
                    <div class="divTableCell"><strong>Name</strong></div>
                    <div class="divTableCell"><strong>Date</strong></div>
                    <div class="divTableCell"><strong>Notes</strong></div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Investigator</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="aes_inv_cd" CssClass="txtboxx" runat="server" placeholder="name" MaxLength="5" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="aes_inv_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes_inv_dt')" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender9" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes_inv_dt" />                        
                        <%--<asp:RegularExpressionValidator ID="RegEx1" runat="server" ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-](201[6-9])$" ErrorMessage="*Invalid Date" ControlToValidate="aes_inv_dt" ForeColor="Red" Font-Size="X-Small" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                    </div>
                    <div class="divTableCell">
                    <asp:TextBox ID="aes_inv_nt" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Supervisor</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="aec_inv_cd" CssClass="txtboxx" runat="server" placeholder="name" MaxLength="5" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="aec_inv_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy"  onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aec_inv_dt')" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender10" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aec_inv_dt" />                        
                    </div>
                    <div class="divTableCell">
                    <asp:TextBox ID="aec_inv_nt" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div><br /><br />


    <div id="divtb" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; border: solid 1px;">
        <div class="divTableBody">

            <div class="divTableRow" style="background-color: gray; color: white;">
                <div class="divTableCell"><strong>Serial</strong></div>
                <div class="divTableCell"><strong>Description of<br /> Adverse Event</strong></div>
                <div class="divTableCell"><strong>Start Date</strong></div>
                <div class="divTableCell"><strong>Stop Date</strong></div>
                <div class="divTableCell"><strong>Ongoing</strong></div>
                <div class="divTableCell"><strong>Does it Meet<br />SAE# Definition</strong></div>
                <div class="divTableCell"><strong>Intensity</strong></div>
                <div class="divTableCell"><strong>Frequency</strong></div>
                <div class="divTableCell"><strong>Action Taken</strong></div>
                <div class="divTableCell"><strong>Outcome</strong></div>
                <div class="divTableCell"><strong>Causality to<br /> Study Vaccine</strong></div>
            </div>
            <div id="div01" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">1.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_a" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes1_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="Masked1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes1_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_c" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes1_c')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes1_c" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_d" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes1_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_e" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes1_e')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_f" CssClass="txtboxx" runat="server" placeholder=" 1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes1_f')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_g" CssClass="txtboxx" runat="server" placeholder="1/2/3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes1_g')"  ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_h" CssClass="txtboxx" runat="server" placeholder="0 to 3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes1_h');comment1('aes1_h')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes1_ho" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>             
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_i" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes1_i');comment2('aes1_i')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes1_io" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes1_j" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes1_j')" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>

            <div id="div2" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">2.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_a" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes2_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes2_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_c" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes2_c')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes2_c" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_d" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes2_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_e" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes2_e')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_f" CssClass="txtboxx" runat="server" placeholder=" 1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes2_f')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_g" CssClass="txtboxx" runat="server" placeholder="1/2/3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes2_g')"  ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_h" CssClass="txtboxx" runat="server" placeholder="0 to 3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes2_h');comment1('aes2_h')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes2_ho" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>             
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_i" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes2_i');comment2('aes2_i')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes2_io" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes2_j" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes2_j')" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>


            <div id="div3" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">3.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_a" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes3_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes3_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_c" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes3_c')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes3_c" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_d" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes3_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_e" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes3_e')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_f" CssClass="txtboxx" runat="server" placeholder=" 1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes3_f')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_g" CssClass="txtboxx" runat="server" placeholder="1/2/3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes3_g')"  ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_h" CssClass="txtboxx" runat="server" placeholder="0 to 3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes3_h');comment1('aes3_h')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes3_ho" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>             
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_i" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes3_i');comment2('aes3_i')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes3_io" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes3_j" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes3_j')" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>


            <div id="div4" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">4.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_a" CssClass="txtboxx" runat="server" placeholder="" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes4_b')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender7" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes4_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_c" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" onblur="isValidDate('aes4_c')" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender8" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="aes4_c" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_d" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes4_d')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_e" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input1('aes4_e')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_f" CssClass="txtboxx" runat="server" placeholder=" 1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes4_f')" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_g" CssClass="txtboxx" runat="server" placeholder="1/2/3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes4_g')"  ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_h" CssClass="txtboxx" runat="server" placeholder="0 to 3" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input2('aes4_h');comment1('aes4_h')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes4_ho" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>             
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_i" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes4_i');comment2('aes4_i')" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="aes4_io" class="comment" CssClass="txtboxx" runat="server" placeholder="comment" size="12" MaxLength="20" ClientIDMode="Static" style="display:none;margin-top:4px" ></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="aes4_j" CssClass="txtboxx" runat="server" placeholder="1 to 4" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="input3('aes4_j')" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>


        </div>
    </div>
    <br />
    <br />

    <asp:Button ID="btnSubmit" runat="server" class="btn btn-theme btn-block" OnClick="btnSubmit_Click" OnClientClick="return validations();" Text="Submit" Style="padding: 8px;width:20%; margin:auto 40%" /><br />
            
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