<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="withdrawal.aspx.cs" Inherits="BVaccine.withdrawal" Culture="en-GB" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div style="text-align: center; margin-top: 30px;">
        <h3 style="text-align: center; margin-top: 60px"><b>Comparison of duration of immunity following IPV and fIPV: <br />A community based randomized Controlled trial in Pakistan  </b></h3>
        <br />

        <asp:Panel ID="formPanel" runat="server" DefaultButton="submitbtn">
            <div class="section-title container" style="width: auto;">
                <h2 style="text-align: center; margin-top: 30px" class="auto-style5">WITHDRAWAL FORM</h2>
                <br>
                <div class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:80%">
                    <div class="divTableBody">
                        <div class="divTableRow">
                            <div class="divTableCell"><span class="auto-style2"> Study ID</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxid" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="11" placeholder=""></asp:TextBox>
                            </div>
                            <div class="divTableCell"><span class="auto-style2"> Study Site:</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxst" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="10" placeholder="site" onkeypress="return onlyAlphabets()"></asp:TextBox>
                                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtq2nm"  Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:RegularExpressionValidator>--%>
                            </div>                            
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>1. </b> Date of withdrawal</div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx1" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx1" />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtbx1" ErrorMessage="*Date Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2014" Type="Date"></asp:RangeValidator>
                                <asp:CompareValidator ID="CompareDOV1" runat="server" ControlToValidate="txtbx1" Operator="LessThan" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><span><b>2. </b> Initials of Child </span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx2" CssClass="txtboxx" ClientIDMode="Static" placeholder="Initials" runat="server" ></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>3. </b> Initials of Mother</div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx3" CssClass="txtboxx" ClientIDMode="Static" placeholder="Initials" runat="server"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><b>4. </b>Date of Birth </div> 
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx4" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx4" />                              
                            </div>
                        </div>
                        <div class="divTableRow">
                                <div class="divTableCell"><b>5. </b>Date of last study visit completed </div> 
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx5" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx5" />                              
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
                                <asp:RadioButtonList runat="server">
                                    <asp:ListItem Value="1">	Refusal to continue.</asp:ListItem>
                                    <asp:ListItem Value="2">	Moved out of study area</asp:ListItem>
                                    <asp:ListItem Value="3">	Lack of compliance</asp:ListItem>
                                    <asp:ListItem Value="4">	Others (Please specify)</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx8" CssClass="txtboxx" placeholder="specify" runat="server" ClientIDMode="Static" ></asp:TextBox>
                            </div>
                        </div>
                                                                    
                    </div>
                </div>
                <br />

                <asp:Button ID="submitbtn"  class="btn-primary btn-lg btn" Style=" width: 200px; height: 50px; font-size: medium" runat="server" Text="submit" />

            </div>
        </asp:Panel>
    </div>

</asp:Content>

