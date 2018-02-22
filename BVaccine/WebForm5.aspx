<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master"  CodeBehind="WebForm5.aspx.cs" Inherits="BVaccine.WebForm5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function GetSelectedItem(id) {
            var rb = document.getElementById(id);
            var el = document.getElementById(id).parentElement.parentElement;
            var radio = rb.getElementsByTagName("input");
            var label = rb.getElementsByTagName("label");

            for (var i = 0; i < radio.length; i++) {
                if (radio[0].checked) {
                    el.nextElementSibling.style.display = "table-row";
                }
                else {
                    el.nextElementSibling.style.display = "none";
                }
            }

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
    <div style="text-align: center; margin-top: 30px;">
        <h2 style="text-align: center; margin-top: 40px"><b>Typbar TCV Mass Immunization Enrollment form</b></h2>

    <div style="text-align: center; margin-top: 30px; margin-bottom: 30px">
        
        <div class="section-title container">           

            <asp:Panel ID="formPanel" runat="server" Visible="true">

                <h4 style="text-align: right; margin-top: 20px;margin-right:60px;"><b>ڈیموگرافک ڈیٹا</b></h4>

                <table  style="text-align: right; width: 100%; margin-top: 20px;margin:auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:90%">

                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq1dt" runat="server" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>                        
                        </td>
                        <td class="tdStyle"> <span>انرولمنٹ آئی ڈی </span> </td>                        
                    </tr>
                    <tr class="thStyle">                        
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq2dt" runat="server" MaxLength="6" placeholder="" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox>                             
                        </td>
                        <td class="tdStyle"> <span> بچے کا نام </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">                           
                            <asp:TextBox ID="txtq3" runat="server" MaxLength="3" placeholder="" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span>والد کا نام </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">                            
                            <asp:TextBox ID="txtq4" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="address" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> ماں کا نام </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq5" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> بچے کی جنس کیا ہے؟</span></td>
                    </tr>
                    <tr class="thStyle" id="row6">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq6" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> بچے کی تاریخ پیدائش</span></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq7" runat="server" MaxLength="3" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> عمر</span></td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq8" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> انرولنمٹ کی تاریخ </span></td>
                    </tr>
                    <tr class="thStyle" id="rdo9">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq9" runat="server" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="dd-mm-yyyy" Width="150px"></asp:TextBox>                           
                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtq9" />                              
                        </td>
                        <td class="tdStyle"> <span> والد کا موبائل نمبر</span></td>
                    </tr>
                    <tr class="thStyle"> 
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq10" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 / 2" Width="150px"></asp:TextBox>
                        </td>                                               
                        <td class="tdStyle"> <span>ماں کا موبائل نمبر </span> </td>
                    </tr>
                   
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="txtq11" runat="server" MaxLength="1" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="1 / 2" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span>متبادل رابطہ </span> </td>
                    </tr>                   
                   
                </table>


                <h4 style="text-align: right; margin-top: 20px;margin-right:60px;"><b> ویکسینشن کی تفصیلات Tybar</b></h4>

                <table  style="text-align: right; width: 100%; margin-top: 20px;margin:auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; width:90%">

                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>                        
                        </td>
                        <td class="tdStyle"> <span>ویکسین لگانے کی تاریخ </span> </td>                        
                    </tr>
                    <tr class="thStyle">                        
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="TextBox9" runat="server" MaxLength="6" placeholder="" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox>                             
                        </td>
                        <td class="tdStyle"> <span> ویکسین کی بوتل کا شناختی نمبر </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">                           
                            <asp:TextBox ID="TextBox10" runat="server" MaxLength="3" placeholder="" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span>ویکسین جسم کے کس  حصہ پر لگائی گئی </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">                            
                            <asp:TextBox ID="TextBox11" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> ویکسین میعاد کی تاریخ  </span> </td>
                    </tr>
                    <tr class="thStyle">
                        <td colspan="3" class="tdStyle tdText">
                            <asp:TextBox ID="TextBox12" runat="server" MaxLength="10" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static" CssClass="txtbxRd" placeholder="" Width="150px"></asp:TextBox>
                        </td>
                        <td class="tdStyle"> <span> کا کوئی فوری علامت کا ظاہر ہونا؟ Adverse event </span></td>
                    </tr>
                </table>

                <br />
                <br />
                <asp:Button ID="next" class="btn-primary btn-lg btn"  Style="width: 200px" runat="server" Text="Submit" BackColor="#2574A9"  />

            </asp:Panel>

        </div>
    </div>
    </div>
</asp:Content>
