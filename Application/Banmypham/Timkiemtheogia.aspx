<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Timkiemtheogia.aspx.cs" Inherits="Banmypham.Timkiemtheogia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <style type="text/css">
    .style1
    {
        width: 97px;
    }
    .style2
    {
        height: 24px;
    }
</style>

<asp:Label ID="lblMessage" runat="server" Font-Bold="true" Font-Size="18px"></asp:Label>
<asp:DataList ID="dlTimkiemtheogia" runat="server" BackColor="#CCFFFF" 
    RepeatColumns = "2" Width="100%" Height="750px">
    <ItemTemplate>
        <table style="width: 100%;">
            <tr>
                <td align="center" class="style1">
                    <asp:Image ID="image1" runat="server" Height="120px" ImageUrl='<%# Eval("Anh") %>' Width="120px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<% "../Chitietmypham.apsx?MaMP="+Eval("MaMP") %>' Text='<%# Eval("TenMP") %>'>
                    </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="Hyperlink2" runat="server" NavigateUrl='<% "../Myphamcungloai.apsx?Maloai="+Eval("Maloai") %>' Text='<%# Eval("Tenloai") %>'>
                    </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    Đơn giá: &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red" Text='<%# Eval("Dongiaban")+"(VND)" %>'>
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="imgmua" runat="server" ImageUrl="~/Images/dathang.png" 
                        width="70px" CommandName='<%# Eval("MaMP") %>' Height="30px" 
                        OnCommand="imgmua_Command" />
                </td>
            </tr>       
        </table>
    </ItemTemplate>    
</asp:DataList>
</asp:Content>
