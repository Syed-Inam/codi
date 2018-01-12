<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="protocol.aspx.cs" Inherits="BVaccine.protocol" Culture="en-GB" %>

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

        function isValidDate(id) {
            var dateString = document.getElementById(id).value;
            var date_regex = /^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-](201[6-9])$/;
            if (dateString != "__/__/____" && !(date_regex.test(dateString))) {
                alert("Enter valid date");
                document.getElementById(id).value = "";
                document.getElementById(id).focus();
            }
        }

        function isCheck(id) {
            var chkbx = document.getElementById(id);
            if (chkbx == "CheckBox1") {
                if (document.getElementById(id).checked == true)
                    document.getElementById("txtbxdt1").disabled = false;
                else
                    document.getElementById("txtbxdt1").disabled = true;
            }
            
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
                <h2 style="text-align: center; margin-top: 20px" class="auto-style5">PROTOCOL DEVIATION FORM</h2>
                <br />
                <div class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:80%">
                    <div class="divTableBody">
                        <div class="divTableRow">
                            <div class="divTableCell"><span class="auto-style2"> Study site</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx1" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="15" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><span class="auto-style2"> Participant ID:</span></div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx2" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="15" placeholder="name" onkeypress="return onlyAlphabets()"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="codi99?-9999" MaskType="None" TargetControlID="txtbx2" ClearMaskOnLostFocus="false" />
                                <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtq2nm"  Font-Size="Smaller" ForeColor="Red" CssClass="auto-style2"></asp:RegularExpressionValidator>--%>
                            </div>
                            
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">Participant Initials: </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx2cd" CssClass="txtboxx" ClientIDMode="Static" runat="server" Style="text-transform: uppercase;" MaxLength="3" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"> Date of Protocol Deviation</div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx3" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy" onblur="isValidDate(txtbx3)"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx3" />
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtbx3" ErrorMessage="*Date Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2020" MinimumValue="01/01/2014" Type="Date"></asp:RangeValidator>
                                <asp:CompareValidator ID="CompareDOV1" runat="server" ControlToValidate="txtbx3" Operator="LessThan" Type="Date" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"><span> Description of Deviation from Protocol: </span></div>
                        </div>
                        <div class="divTableRow">   
                            <div class="divTableCell"></div>                         
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx4" CssClass="txtboxx" ClientIDMode="Static" placeholder="description" runat="server" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                <cc1:ResizableControlExtender ID="ResizableControlExtender1" runat="server" HandleCssClass="handle" ResizableCssClass="resizing" MaximumHeight="400" MaximumWidth="800" MinimumHeight="100" MinimumWidth="300" TargetControlID="txtbx4" />
                            </div>
                        </div>
                        <div class="divTableRow">
                             <div class="divTableCell"> Reason for Deviation from Protocol</div>
                        </div>
                        <div class="divTableRow"> 
                            <div class="divTableCell"></div>                          
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx5" CssClass="txtboxx" ClientIDMode="Static" placeholder="reason" runat="server" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                <cc1:ResizableControlExtender ID="ResizableControlExtender2" runat="server" HandleCssClass="handle" ResizableCssClass="resizing" MaximumHeight="400" MaximumWidth="800" MinimumHeight="100" MinimumWidth="300" TargetControlID="txtbx5" />
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"> Did this Deviation result in an adverse event?</div>
                            <div class="divTableCell">
                                <asp:RadioButtonList ID="Rdbtn1" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"> Will the subject continue with the study?</div>
                            <div class="divTableCell">
                                <asp:RadioButtonList ID="Rdbtn2" runat="server">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">Based on your IRB/IEC reporting guidelines, <br />when does this Protocol Deviation need to be reported to your IRB/IEC?<br /></div>
                            <div class="divTableCell">
                                <%--<asp:CheckBox runat="server" id="irb1" Text="Should be reported promptly to the IRB."/>--%>
                                <asp:CheckBoxList ID="chkbx" runat="server">
                                    <asp:ListItem Value="1">	Should be reported promptly to the IRB.</asp:ListItem>
                                    <asp:ListItem Value="1">	Should be reported within 30 days of knowledge by the investigator.</asp:ListItem>
                                    <asp:ListItem Value="1">	Should be reported at the end of the trial.</asp:ListItem>
                                    <asp:ListItem Value="1">	Does not require reporting.</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="divTableRow">
                           <div class="divTableCell">What steps were taken to resolve this Deviation and prevent reoccurrence?</div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell"></div>                            
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx6" CssClass="txtboxx" placeholder="Steps" ClientIDMode="Static" runat="server" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                <cc1:ResizableControlExtender ID="ResizableControlExtender3" runat="server" HandleCssClass="handle" ResizableCssClass="resizing" MaximumHeight="400" MaximumWidth="800" MinimumHeight="100" MinimumWidth="300" TargetControlID="txtbx6" />
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">Completed by: </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx7" CssClass="txtboxx" placeholder="name" ClientIDMode="Static" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:TextBox ID="txtbx7dt" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx7dt" />                              
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">Site Investigator:  </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbx8" CssClass="txtboxx" placeholder="name" ClientIDMode="Static" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:TextBox ID="txtbx8dt" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbx8dt" />                              
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">Date Submitted/Faxed To: </div>                                                           
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Sponsor" ClientIDMode="Static" />
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxdt1" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy" Enabled="false" ></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbxdt1" />                              
                            </div>
                        </div>
                        <div class="divTableRow">
                            <div class="divTableCell">
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="IRB" ClientIDMode="Static"/>
                            </div>
                            <div class="divTableCell">
                                <asp:TextBox ID="txtbxdt2" CssClass="txtboxx" ClientIDMode="Static" runat="server" placeholder="dd/mm/yyyy" Format="dd/mm/yyyy" Enabled="false"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtbxdt2" />                              
                            </div>
                        </div>
                    </div>
                </div>
                <br />

                <asp:Button ID="submitbtn" class="btn-primary btn-lg btn" Style=" width: 200px; height: 50px; font-size: medium" runat="server" Text="submit" OnClick="btnSubmit_Click" />

            </div>
        </asp:Panel>
    </div>

</asp:Content>
