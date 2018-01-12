<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="BVaccine.WebForm2" Culture="en-GB" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function codename1(id) {
            var val = document.getElementById(id).value;

            if (id == 'txtq9') {
                if (val == 3) {
                    document.getElementById("txtq9x").disabled = false;
                }
                else {
                    document.getElementById("txtq9x").disabled = true;
                    document.getElementById("txtq9x").value = '';
                }
            }
            else if (id == 'txtq5') {
                if (val == 2) {
                    document.getElementById("txtq6").disabled = true;
                    document.getElementById("txtq6").value = '';
                }
                else {
                    document.getElementById("txtq6").disabled = false;
                }
            }
            else if (id == 'txtq8') {
                if (val == 3) {
                    document.getElementById("txtq9").disabled = true;
                    document.getElementById("txtq9").value = '';
                    document.getElementById("txtq9x").disabled = true;
                    document.getElementById("txtq9x").value = '';
                }
                else {
                    document.getElementById("txtq9").disabled = false;
                }
            }

        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>


    <div style="text-align: center; margin-top: 50px; margin-bottom: 50px">
        <h2><b>IPV and fIPV</b></h2>

        <div class="section-title container">
            <table border="1" style="text-align: center; width: 100%; margin-top: 20px; background-color: #2574A9; border: 1px solid #BFBFBF; color: #2C3E50; font-family: Tahoma;">

                <tr style="height: 60px; font-family: Calibri; font-size: 19px; color: white;">
                    <td style="font-weight: 600">Study ID</td>
                    <td style="text-align: left; padding-left: 15px">
                        <asp:TextBox ID="txtStudyID" Width="150px"  Style="text-transform: uppercase;" placeholder="study id" Height="31px" runat="server" MaxLength="7" ForeColor="Black"></asp:TextBox></td>

                    <td style="font-weight: 600;">DSSID</td>
                    <td style="text-align: left; padding-left: 15px">
                        <asp:TextBox ID="txtDSSID" runat="server"  Style="text-transform: uppercase;" MaxLength="12" Height="31px" placeholder="dssid" ForeColor="Black"></asp:TextBox></td>
                    <td style="font-weight: 600;">Visit:</td>
                    <td>
                        <select id="m1" class="styledselect-month" style="color: black; width: 150px" runat="server">
                            <option value="0" style="background:#eeeeee">Select Visit</option>
                            <option value="v2" style="background:#eeeeee">&nbsp;Second</option>
                            <option value="v3" style="background:#eeeeee">&nbsp;Third</option>
                            <option value="v4" style="background:#eeeeee">&nbsp;Fourth</option>
                            <option value="v5" style="background:#eeeeee">&nbsp;Fifth</option>
                        </select>
                    </td>
                    <td>
                        <asp:Button ID="btnchk" class="btn-primary btn-sm" Height="37px" Width="80px" BackColor="#C5EFF7" ForeColor="#013243" Font-Size="Medium" Font-Bold="true" runat="server" Text="Check"  />

                    </td>
                </tr>
            </table>


            <asp:Panel ID="formPanel" runat="server" Visible="false">

                <h4 style="text-align: left; margin-top: 60px"><b>Comparison of duration of immunity following IPV and fIPV: A community based randomized Controlled trial in Pakistan  </b></h4>

                <table border="1" style="text-align: left; width: 100%; margin-top: 20px; font-size: 16px; background-color: #E4F1FE; border: 3px solid gray; font-family: Tahoma;">


                    <tr class="thStyle">
                        <td class="tdStyle"><b>1.</b> EXPECTED DATE OF VISIT:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq1dt" runat="server" CssClass="txtbxRd" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtq1dt" />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtq1dt" ErrorMessage="*Invalid Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2000" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>2.</b> ACTUAL DATE OF VISIT:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq2dt" runat="server" CssClass="txtbxRd" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtq2dt" />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtq2dt" ErrorMessage="*Invalid Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2000" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>3.</b> STUDY RANDOMIZATION ARM:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq3" runat="server" MaxLength="5" placeholder="0000" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>4.</b> IS THE CHILD HEALTHY?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq4" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>5.</b> WAS THIS CHILD HOSPITALIZED SINCE LAST VISIT?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq5" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="codename1('txtq5')" ClientIDMode="Static" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>6.</b> IF YES IN QUESTION ABOVE, HAS A COPY OF THE DISCHARGE SUMMARY ATTACHED HEREWITH? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq6" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>7.</b> FROM BIRTH UNTIL NOW, IS THE CHILD BREAST FED AT ALL?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq7" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>8.</b> IS THE CHILD CURRENTLY BREASTFED?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq8" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" onkeyup="codename1('txtq8')" ClientIDMode="Static" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>9.</b> IF PARTIAL BREAST FEEDING, WHAT TYPE OF MILK OR OTHER THINGS IS CHILD RECEIVING? </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq9" runat="server" MaxLength="1" onkeyup="codename1('txtq9')" ClientIDMode="Static" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"></td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq9x" Enabled="false" runat="server"  Style="text-transform: uppercase;" MaxLength="20" ClientIDMode="Static" CssClass="txtbxRd" placeholder="code" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle" style="text-align: center">
                        <td colspan="4" class="tdStyle"><b>BLOOD SAMPLING</b></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>10.</b> SUCESSFULLY COLLECTED THE BLOOD?    </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq10" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>11.</b> QUANTITY OF BLOOD COLLECTED SUFFICIENT?  </td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq11" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 to 3" Width="150px"></asp:TextBox></td>
                    </tr>

                    <tr class="thStyle">
                        <td class="tdStyle"><b>12.</b> DATE OF BLOOD COLLECTION:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq12dt" runat="server" CssClass="txtbxRd" placeholder="dd/mm/yyyy" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtq12dt" />
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtq12dt" ErrorMessage="*Invalid Error" Font-Size="Smaller" ForeColor="Red" MaximumValue="01/01/2030" MinimumValue="01/01/2000" Type="Date"></asp:RangeValidator>

                        </td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>13.</b>  TIME OF COLLECTION:</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq13t" runat="server" CssClass="txtbxRd" onkeypress="return OnlyNumeric(event)" placeholder="00:00" Width="150px"></asp:TextBox>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99:99" MaskType="Time" TargetControlID="txtq13t" />

                        </td>
                    </tr>

                    <tr class="thStyle">
                        <td class="tdStyle"><b>14.</b> SERUM SEPARATION DONE?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq14" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>15.</b> QUANTITY OF SERUM SUFFICIENT (Minimum 0.5 ml)?</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq15" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 or 2" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr class="thStyle">
                        <td class="tdStyle"><b>16.</b> NUMBER OF SERUM SAMPLE ON CRYOTUBE: (Sample Number - S1)</td>
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq16" runat="server" MaxLength="15" CssClass="txtbxRd" Width="150px"></asp:TextBox></td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Button ID="s01next" Height="42px" class="btn-primary btn-lg btn" Style="width: 100px" runat="server" Text="Submit" BackColor="#2574A9"  />

            </asp:Panel>

        </div>
    </div>

</asp:Content>
