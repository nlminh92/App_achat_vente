<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Doanhthutheothang.aspx.cs" Inherits="Banmypham.Manager.Doanhthutheothang" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>BÁO CÁO DOANH THU THEO THÁNG
        </h1>
    </center>
    <table>
        <tr align="center">            
            <td>
                <b>Chọn tháng: </b>
            </td>
            <td>
                <asp:DropDownList ID="drThang" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <b>Chọn năm: </b>
            </td>
            <td>
                <asp:DropDownList ID="drNam" runat="server">
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button runat="server" ID="btnXem" Text="Xem" Width="70px" 
                    onclick="btnXem_Click"/>
            </td>
        </tr>
    </table>
    
    <CR:CrystalReportViewer ID="rptDoanhthutheothang" runat="server" 
        ReportSourceID="CrystalReportSource1" GroupTreeImagesFolderUrl="" Height="50px" 
        ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Manager\rptDoanhthutheothang.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
