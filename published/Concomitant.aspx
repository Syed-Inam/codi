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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <h1 style="margin-top: 100px; text-align:center">Concomitant Medications</h1>    

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
                        <asp:TextBox ID="cmss" runat="server" ClientIDMode="Static" class="form-control"  Style="text-transform: uppercase;"  ></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4"><b>Study ID:  </b></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="cmsid" runat="server" ClientIDMode="Static" class="form-control"   onkeypress="return OnlyNumeric(event)"></asp:TextBox>
                    </div>
                </div>
                                
            </div>
             <br />           
        </div>
    </div>

        <div id="div5" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #ededed; font-family: Tahoma; border: solid 1px;width:60%;">
            <div class="divTableBody">
                <div class="divTableRow" style="background-color: gray; color: white;">
                    <div class="divTableCell">&nbsp;</div>
                    <div class="divTableCell"><strong>Name</strong></div>
                    <div class="divTableCell"><strong>Date</strong></div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Principal Investigator</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="inv_cd" CssClass="txtboxx" runat="server" placeholder="code" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="inv_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender9" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="inv_dt" />
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell"><strong>Site Supervisor</strong></div>
                    <div class="divTableCell">
                    <asp:TextBox ID="sup_cd" CssClass="txtboxx" runat="server" placeholder="code" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>                        
                    </div>
                    <div class="divTableCell">
                        <asp:TextBox ID="sup_dt" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                        <cc1:MaskedEditExtender ID="MaskedEditExtender10" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="sup_dt" />
                    </div>
                </div>
            </div>
        </div>
        <br /><br />


    <div id="divtb" class="divTable" style="text-align: left; margin: auto; font-size: small; background-color: #EDEDED; font-family: Tahoma; border: solid 1px;">
        <div class="divTableBody">

            <div class="divTableRow" style="background-color: gray; color: white;">
                <div class="divTableCell"><strong>Serial</strong></div>
                <div class="divTableCell"><strong>Medication Name</strong></div>
                <div class="divTableCell"><strong>Start Date</strong></div>
                <div class="divTableCell"><strong>Dose/Unit</strong></div>
                <div class="divTableCell"><strong>Frequency</strong></div>
                <div class="divTableCell"><strong>Reason, indication</strong></div>
                <div class="divTableCell"><strong>Ongoing</strong></div>   
                <div class="divTableCell"><strong>Stop Date</strong></div>
                <div class="divTableCell"><strong>Staff</strong></div>            
            </div>
            <div id="div2" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">1.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_a" CssClass="txtboxx" runat="server" placeholder="" size="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="Masked1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr1_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_e" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)"  ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr1_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr1_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>
            
            <div id="div3" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">2.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_a" CssClass="txtboxx" runat="server" placeholder="" size="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr2_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_e" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)"  ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr2_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr2_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>


            <div id="div4" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">3.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_a" CssClass="txtboxx" runat="server" placeholder="" size="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender4" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr3_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_e" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)"  ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender5" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr3_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr3_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>


            <div id="div6" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">4.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_a" CssClass="txtboxx" runat="server" placeholder="" size="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender6" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr4_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_e" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)"  ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender7" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr4_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr4_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>

            <div id="div7" runat="server" clientidmode="Static" class="divTableRow" >
                <div class="divTableCell">5.</div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_a" CssClass="txtboxx" runat="server" placeholder="" size="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_b" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender8" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr5_b" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_c" CssClass="txtboxx" runat="server" placeholder="mg, tab" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_d" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_e" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)"  ClientIDMode="Static"></asp:TextBox>
                </div>                  
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_f" CssClass="txtboxx" runat="server" placeholder="0 / 1" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>              
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_g" CssClass="txtboxx" runat="server" placeholder="dd/mm/yyyy" size="12" MaxLength="15" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                    <cc1:MaskedEditExtender ID="MaskedEditExtender11" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="cmsr5_g" />
                </div>
                <div class="divTableCell">
                    <asp:TextBox ID="cmsr5_h" CssClass="txtboxx" runat="server" placeholder="" size="12" MaxLength="1" onkeypress="return OnlyNumeric(event)" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>

        </div>
    </div>
    <br />
    <br />
    <%--<asp:Button ID="btnlog" runat="server" class="btn btn-theme btn-block" OnClientClick="return clicklog();" Text="Log Form" Style="padding: 8px;" /><br />--%>
    <asp:Button ID="btnSubmit" runat="server" class="btn btn-theme btn-block"  OnClientClick="return clicksubmit();" Text="Submit" Style="padding: 8px;width:20%; margin:auto 40%" /><br />
            
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