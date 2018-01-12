<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="visit3a.aspx.cs" Inherits="BVaccine.visit3a" Culture="en-GB" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function GetSelectedItem(id) {
            var rb = document.getElementById(id);
            var radio = rb.getElementsByTagName("input");
            var label = rb.getElementsByTagName("label");

            if (id == "Q5") {
                for (var i = 0; i < radio.length; i++) {
                    if (radio[1].checked) {
                        //alert("SelectedText: " + label[i].innerHTML
                        //    + "\nSelectedValue: " + radio[i].value);
                        document.getElementById("row6").style.display = 'none';
                        UncheckedRadio("Q6");
                        break;
                    }
                    else {
                        document.getElementById("row6").style.display = 'table-row';
                    }

                }
            }

            else if (id == "Q8") {
                for (var i = 0; i < radio.length; i++) {
                    if (radio[1].checked) {
                        document.getElementById("rdo9").style.display = 'table-row';
                        break;
                    }
                    else {
                        document.getElementById("rdo9").style.display = 'none';
                        UncheckedRadio("Q9");
                        break;
                    }
                }
            }


            else if (id == "Q9") {
                for (var i = 0; i < radio.length; i++) {
                    if (radio[2].checked) {
                        document.getElementById("Q9x").style.display = 'table-row';
                        break;
                    }
                    else {
                        document.getElementById("Q9x").style.display = 'none';
                        document.getElementById("txtq9x").value = "";
                    }
                }
            }

            else if (id == "Q10") {
                for (var i = 0; i < radio.length; i++) {
                    if (radio[1].checked) {
                        document.getElementById("row11").style.display = 'none';
                        document.getElementById("row12").style.display = 'none';
                        document.getElementById("row13").style.display = 'none';
                        document.getElementById("row14").style.display = 'none';
                        document.getElementById("row15").style.display = 'none';
                        document.getElementById("txtq12dt").value = "";
                        document.getElementById("txtq13t").value = "";
                        UncheckedRadio("Q11");
                        UncheckedRadio("Q14");
                        UncheckedRadio("Q15");
                        break;
                    }
                    else {
                        document.getElementById("row11").style.display = 'table-row';
                        document.getElementById("row12").style.display = 'table-row';
                        document.getElementById("row13").style.display = 'table-row';
                        document.getElementById("row14").style.display = 'table-row';
                        document.getElementById("row15").style.display = 'table-row';
                    }

                }
            }

            return false;
        }

        function UncheckedRadio(id) {
            var rb = document.getElementById(id);
            var radio = rb.getElementsByTagName("input");
            var label = rb.getElementsByTagName("label");
            for (var i = 0; i < radio.length; i++)
                radio[i].checked = false;
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div style="text-align: center; margin-top: 50px; margin-bottom: 50px">
        <h2><b>IPV and fIPV</b></h2>

        <div class="section-title container">
            <table border="1" style="text-align: center; width: 90%; margin-top: 20px;margin:auto; background-color: gray; border: 1px solid #BFBFBF; color: #2C3E50; font-family: Tahoma; font-size: small;">

                <tr style="height: 60px; font-family: Calibri; font-size: 19px; color: white;">
                    <td style="font-weight: 400">Study ID</td>
                    <td style="text-align: left; padding-left: 15px">
                        <asp:TextBox ID="txtStudyID" Width="150px"  Style="text-transform: uppercase;" placeholder="study id" Height="31px" runat="server" MaxLength="7" ForeColor="Black"></asp:TextBox></td>

                    <td style="font-weight: 400;">DSSID</td>
                    <td style="text-align: left; padding-left: 15px">
                        <asp:TextBox ID="txtDSSID" runat="server"  Style="text-transform: uppercase;" MaxLength="12" Height="31px" placeholder="dssid" ForeColor="Black"></asp:TextBox></td>
                    
                    <td>
                        <asp:Button ID="btnchk" class="btn-primary btn-sm" Height="37px" Width="80px" BackColor="#C5EFF7" ForeColor="#013243" Font-Size="Medium" Font-Bold="true" runat="server" Text="Check" />

                    </td>
                </tr>
            </table>


            <asp:Panel ID="formPanel" runat="server" Visible="true">

                <h4 style="text-align: left; margin-top: 60px;margin-left:60px;"><b>Comparison of duration of immunity following IPV and fIPV: A community based randomized Controlled trial in Pakistan  </b></h4>

                <table  style="text-align: left; width: 100%; margin-top: 20px;margin:auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:90%">

                    <tr class="thStyle">
                        <td class="tdStyle"><b>1.</b> EXPECTED DATE OF VISIT:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq1dt" runat="server" CssClass="txtbxRd" placeholder="dd-mm-yyyy" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtq1dt" />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtq1dt" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2020" MinimumValue="01/01/2010" Type="Date"></asp:RangeValidator>                            
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>2.</b> ACTUAL DATE OF VISIT:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq2dt" runat="server" CssClass="txtbxRd" placeholder="dd-mm-yyyy" Width="150px"></asp:TextBox> 
                            <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtq2dt" />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtq2dt" ErrorMessage="*Invalid Date" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2020" MinimumValue="01/01/2010" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>3.</b> STUDY RANDOMIZATION ARM:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="rdobtn">
                                <asp:ListItem Value="A" Text="A"></asp:ListItem>
                                <asp:ListItem Value="B" Text="B"></asp:ListItem>
                                <asp:ListItem Value="C" Text="C"></asp:ListItem>
                                <asp:ListItem Value="D" Text="D"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq3" runat="server" MaxLength="5" placeholder="0000" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>4.</b> IS THE CHILD HEALTHY?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q4" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq4" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>5.</b> WAS THIS CHILD HOSPITALIZED SINCE LAST VISIT?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q5" RepeatDirection="Horizontal" onclick="GetSelectedItem('Q5')" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq5" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="codename1('txtq5')" ClientIDMode="Static" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle" id="row6">
                        <td class="tdStyle"><b>6.</b> IF YES IN QUESTION ABOVE, HAS A COPY OF THE<br /> DISCHARGE SUMMARY ATTACHED HEREWITH? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q6" RepeatDirection="Horizontal" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO" ></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq6" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>7.</b> FROM BIRTH UNTIL NOW, IS THE CHILD BREAST FED AT ALL?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q7" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq7" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>8.</b> IS THE CHILD CURRENTLY BREASTFED?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q8" onclick="GetSelectedItem('Q8')" ClientIDMode="Static">
                                <asp:ListItem Text="NO" Value="1"></asp:ListItem>
                                <asp:ListItem Text="PARTAIL BREASTFEEDING" Value="2"></asp:ListItem>
                                <asp:ListItem Text="EXCLUSIVE BREASTFEEDING" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>                            
                        </td>
                    </tr>
                    <tr class="thStyle" id="rdo9" style="display:none">
                        <td class="tdStyle"><b>9.</b> IF PARTIAL BREAST FEEDING, WHAT TYPE OF MILK OR<br /> OTHER THINGS IS CHILD RECEIVING? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" onclick="GetSelectedItem('Q9')" ClientIDMode="Static" id="Q9">
                                <asp:ListItem Text="FORMULA MILK" Value="1"></asp:ListItem>
                                <asp:ListItem Text="COW MILK" Value="2"></asp:ListItem>
                                <asp:ListItem Text="OTHER" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>                           
                        </td>
                    </tr>
                    <tr class="thStyle" id="Q9x" style="display:none">
                        <td class="tdStyle"></td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq9x" runat="server"  Style="text-transform: uppercase;" MaxLength="20" ClientIDMode="Static" CssClass="txtbxRd" placeholder="code" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle" style="text-align: left">
                        <td colspan="4" class="tdStyle"><b>VACCINE ADMINISTRATIONS</b></td>
                    </tr>
                    <tr class="thStyle">                                                
                        <td class="tdStyle"><b>10.</b>THE CHILD RECEIVED VACCINE ACCORDING TO RANDOMIZATION? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q10" RepeatDirection="Horizontal" onclick="GetSelectedItem('Q10')" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq10" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle" id="row11">
                        <td class="tdStyle"><b>11.</b> WHICH VACCINE DOES CHILD THE RECEIVED? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q11" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="IPV (0.5ml)"></asp:ListItem>
                                <asp:ListItem Value="2" Text="fIPV (0.1ml)"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq11" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>

                    <tr class="thStyle" id="row12">
                        <td class="tdStyle"><b>12.</b> DATE OF VACCINATION RECEIVED:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq12dt" runat="server" CssClass="txtbxRd" placeholder="dd-mm-yyyy" Width="150px" ClientIDMode="Static"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtq12dt" />
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtq12dt" ErrorMessage="*Invalid Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2000" Type="Date"></asp:RangeValidator>

                        </td>
                    </tr>
                    <tr class="thStyle" id="row13">
                        <td class="tdStyle"><b>13.</b>  TIME OF VACCINATION RECEIVED:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq13t" runat="server" CssClass="txtbxRd" onkeypress="return OnlyNumeric(event)" placeholder="00:00" Width="150px" ClientIDMode="Static"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtq13t" />

                        </td>
                    </tr>

                    <tr class="thStyle" id="row14">
                        <td class="tdStyle"><b>14.</b> CHILD OBSERVED FOR ATLEAST 30 MINS POST VACCINATION</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" ID="Q14" RepeatDirection="Horizontal" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq14" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr class="thStyle" id="row15">
                        <td class="tdStyle"><b>15.</b> QUANTITY OF SERUM SUFFICIENT (Minimum 0.5 ml)?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:RadioButtonList runat="server" id="Q15" RepeatDirection="Horizontal" ClientIDMode="Static">
                                <asp:ListItem Value="1" Text="YES&emsp;&emsp;"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NO"></asp:ListItem>
                            </asp:RadioButtonList>
                            <%--<asp:TextBox ID="txtq15" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox>--%>
                        </td>
                    </tr>

                    <tr class="thStyle">
                        <td class="tdStyle"> DATE OF NEXT APPOINTMENT</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtnxtdt" runat="server" CssClass="txtbxRd" placeholder="dd-mm-yyyy" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtnxtdt" />
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtnxtdt" ErrorMessage="*Invalid Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2000" Type="Date"></asp:RangeValidator>

                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle">  TIME OF NEXT APPOINTMENT</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtnxttm" runat="server" CssClass="txtbxRd" onkeypress="return OnlyNumeric(event)" placeholder="00:00" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtnxttm" />

                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="s01next" class="btn-primary btn-lg btn"  Style="width: 100px" runat="server" Text="Submit" BackColor="#2574A9"  />

            </asp:Panel>

        </div>
    </div>

</asp:Content>
