<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="withdrawal.aspx.cs" Inherits="BVaccine.withdrawal" Culture="en-GB" %> 

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function getCheckedRadio(id) {

            var list = document.getElementById(id); //Client ID of the radiolist
            var inputs = list.getElementsByTagName("input");
            var selected;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked) {
                    selected = inputs[i];
                    break;
                }
            }
            if (selected.value == 4) {
                document.getElementById("other").style.display = "table-row";
            }
            else
                document.getElementById("other").style.display = "none";
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div style="text-align: center; margin-top: 30px;">
        <h3 style="text-align: center; margin-top: 40px"><b>Comparison of duration of immunity following IPV and fIPV: <br />A community based randomized Controlled trial in Pakistan  </b></h3>
        <br />

        <asp:Panel ID="formPanel" runat="server" DefaultButton="submitbtn">
            <div class="section-title container" style="width: auto;">
                <h2 style="text-align: center; margin-top: 20px" class="auto-style5">WITHDRAWAL FORM</h2>
                <br />
                <div class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:80%">
                    <div class="divTableBody">
                        <div class="divTableRow">
                            <div class="divTableCell"><span class="auto-style2"> Study ID</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxid" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" ></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="codi99?-9999" MaskType="None" TargetControlID="txtbxid" ClearMaskOnLostFocus="false" />
                            </div>
                            <div class="divTableCell"><span class="auto-style2"> Study Site:</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxst" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="12" placeholder="site" onkeypress="return onlyAlphabets()"></asp:TextBox>
                                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtq2nm"  Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:RegularExpressionValidator>--%>
                            </div>                            
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>1. </b> Date of withdrawal</div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx1" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx1" />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtbx1" ErrorMessage="*Date Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01-01-2030" MinimumValue="01-01-2000" Type="Date"></asp:RangeValidator>
                                
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><span><b>2. </b> Initials of Child </span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx2" CssClass="txtboxx" ClientIDMode="Static" placeholder="Initials" runat="server" Style="text-transform: uppercase;"  ></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>3. </b> Initials of Mother</div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx3" CssClass="txtboxx" ClientIDMode="Static" placeholder="Initials" runat="server" Style="text-transform: uppercase;" ></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>4. </b>Date of Birth </div> 
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx4" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx4" /> 
                                <asp:CompareValidator ID="CompareDOV1" runat="server" ControlToValidate="txtbx4" ControlToCompare="txtbx1" Operator="LessThan" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>                             
                            </div>
                        </div>
                        <div class="divTableRow">
                                <div class="divTableCell"><b>5. </b>Date of last study visit completed </div> 
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx5" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx5" />  
                                <asp:CompareValidator ID="Compare" runat="server" ControlToValidate="txtbx5" ControlToCompare="txtbx1" Operator="LessThan" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>                            
                            </div>                                                      
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>6. </b>Name of the last visit completed </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx6" CssClass="txtboxx" placeholder="" runat="server" ClientIDMode="Static" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>7. </b> Did the designated trial supervisor talk to the mother or family<br />&nbsp&nbsp&nbsp&nbsp before the decision to withdraw from the study was taken?</div>
                            <div class="divTableCell">
                                <asp:RadioButtonList ID="Rdbtn1" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>8. </b>What was the reason given to withdraw from the study?</div>
                            <div class="divTableCell">
                                <asp:RadioButtonList ID="rdbtn2" runat="server" onclick="getCheckedRadio('rdbtn2')" ClientIDMode="Static">
                                    <asp:ListItem Value="1">	Refusal to continue.</asp:ListItem>
                                    <asp:ListItem Value="2">	Moved out of study area</asp:ListItem>
                                    <asp:ListItem Value="3">	Lack of compliance</asp:ListItem>
                                    <asp:ListItem Value="4">	Others (Please specify)</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>                            
                        </div>
                        <div id="other" class="divTableRow" style="display:none"> 
                            <div class="divTableCell"></div>
                            <asp:TextBox ID="txtbx8" CssClass="txtboxx" placeholder="specify" runat="server" ClientIDMode="Static"></asp:TextBox>
                        </div>
                                                                    
                    </div>
                </div><br />
                
        <div id="div5" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #ededed; font-family: Tahoma; border: solid 1px;width:80%;">
            <div class="divTableBody">
                <div class="divTableRow" style="background-color: gray; color: white;">
                    <div class="divTableCell">&nbsp;</div>
                    <div class="divTableCell"><strong>Code</strong></div>
                    <div class="divTableCell"><strong>Date</strong></div>
                </div>                
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Supervisor</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="sup_nm" CssClass="txtboxx" runat="server" placeholder="cade" MaxLength="8" ClientIDMsode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="sup_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender10" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="sup_dt" />
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Investigator</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="inv_nm" CssClass="txtboxx" runat="server" placeholder="code" MaxLength="8" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="inv_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy"  ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender9" runat="server" Mask="99/99/9999" MaskType="Date" CultureName="en-nz" TargetControlID="inv_dt" />
                    </div>
                </div>
            </div>
        </div>
        <br />

            <asp:Button ID="submitbtn"  class="btn-primary btn-lg btn" Style=" width: 200px; height: 50px; font-size: medium" runat="server" Text="submit" OnClick="btnSubmit_Click" />

            </div>
        </asp:Panel>
    </div>

</asp:Content>

