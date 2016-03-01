<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Banmypham._Default" %>

    <%@ Register Src="Control/San pham.ascx" TagName="sanpham" TagPrefix="mp" %>

    <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="main">
        <table style="width:590px; height:450px">
            <tr>
                <td style=" height:35px; font-weight:bold; white-space:590px; width: 590px; color: #FF0080; font-size: 20px;" align="center">MỸ PHẨM
                </td>
            </tr>
            <tr>
                <td style="width: 590px">
                    <mp:sanpham ID="sanpham1" runat="server">
                    </mp:sanpham>
                </td>
            </tr>
        </table>
    </asp:Content>