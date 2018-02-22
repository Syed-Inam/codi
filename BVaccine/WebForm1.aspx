<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BVaccine.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .container-fluid {
            margin: auto;
            min-height: 100%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManger1" runat="Server"></asp:ScriptManager>

    <div class="jumbotron text-center" style="margin-top: 1%;padding:70px;" >
        <h2 style="color: black; margin:auto; text-align:center">Comparison Of Duration of Immunity following IPV and fIPV</h2>
        <h3 style="color: #c0d42f; text-align: center">A community based randomized controlled trial in Pakistan</h3>
    </div>


    <div class="container-fluid text-center" style="position: relative; margin-top: -25px;">
        <div style="margin: 5% auto; width: 20%;">
            <div class="form-group" style="margin: auto;">
                <asp:TextBox ID="txtStudyID" runat="server" ClientIDMode="Static" placeholder="DSSID" class="form-control" Width="100%" MaxLength="13" Style="text-transform: uppercase;" required="required" /><br />
                <%--<asp:RequiredFieldValidator ID="Required1" runat="server" class="align" ControlToValidate="txtStudyID" ErrorMessage="*Required field is empty" Font-Size="Smaller" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> --%>                                              
                <cc1:MaskedEditExtender ID="MaskedEditExtender12" runat="server" Mask="codi99?-9999" MaskType="None" TargetControlID="txtStudyID" ClearMaskOnLostFocus="false" />
                <asp:TextBox ID="datepicker" runat="server" ClientIDMode="Static" placeholder="" class="form-control" Width="100%" MaxLength="10" Visible="false"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="datepicker" Format="yyyy-MM-dd" runat="server" />
                <asp:RangeValidator runat="server" MinimumValue="2017-01-01" MaximumValue="2020-12-31" ControlToValidate="datepicker" ErrorMessage="*Invalid date range" Font-Size="Smaller" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                <%--<cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="99-99-9999" MaskType="Date" TargetControlID="txtdt" />--%>                       
            </div>
            <br />
            <asp:Button ID="findbtn" CssClass="btn" Style="padding: 10px;" runat="server" Text="find" OnClick="findbtn_Click" Width="100%" OnClientClick="return clicknext();" /><br />
            <asp:Button ID="submitbtn" CssClass="btn" Style="padding: 10px;" runat="server" Text="Submit" OnClick="submitbtn_Click" Width="100%" OnClientClick="return clicknext();" Visible="false"/>
                    
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
     <!-- Footer -->
    <div class="footer" style="position: fixed; bottom: 0px;left: 0px;right: 0px;">
        <div class="container">

        </div>
        <div class="row" >
            <div class="col-md-12">
                <div class="footer-copyright">&copy; Copyright at <a href="https://www.aku.edu/Pages/home.aspx">The Aga Khan University (AKU)</a>, All rights reserved. 2017-18  </div>
            </div>
        </div>
    </div>
            
    <!-- Footer -->

</asp:Content>
