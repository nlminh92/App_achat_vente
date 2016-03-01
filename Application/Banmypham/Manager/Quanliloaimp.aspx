<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Quanliloaimp.aspx.cs" Inherits="Banmypham.Manager.Quanliloaimp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tr>
            <td colspan="2" style=" font-weight:bold; color:#FF0080;"> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                THÊM, XÓA, SỬA MỸ PHẨM
            </td>
        </tr>
        <tr>
            <td style=" width: 30%;">
                <asp:Label ID="Lable1" Text="Tên loại mỹ phẩm:" runat="server" Font-Bold="true">
                </asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="txtTenloai" runat="server" Width="270px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnThemmoi" Text="Thêm mới" Width="80px" runat="server" ForeColor="White" BackColor="#FF0080" Font-Bold="true"
                    onclick="btnThemmoi_Click" />
            </td>
        </tr>
    </table>

    <asp:DataGrid runat="server" AllowPaging="True" AutoGenerateColumns="False" 
    ID="dgLoaimp" onpageindexchanged="dgLoaimp_PageIndexChanged" 
        OnEditCommand="OnEdit" OnUpdateCommand="OnUpdate" OnDeleteCommand="OnDelete" 
        OnCancelCommand="OnCancel" DataKeyField="Maloai" style="margin-top: 0px" 
        Width="990px">

        <Columns>
            <asp:BoundColumn DataField="Maloai" HeaderText="Mã loại mỹ phẩm" HeaderStyle-BackColor="#FF66FF" HeaderStyle-Font-Bold="true">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="Tenloai" HeaderText="Tên loại mỹ phẩm" HeaderStyle-BackColor="#FF66FF" HeaderStyle-Font-Bold="true">
            </asp:BoundColumn>
            <asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update" HeaderStyle-BackColor="#FF66FF" HeaderStyle-Font-Bold="true">
            </asp:EditCommandColumn>
            <asp:ButtonColumn CommandName="Delete" Text="Delete" HeaderStyle-BackColor="#FF66FF" HeaderStyle-Font-Bold="true"></asp:ButtonColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
        
    </asp:DataGrid>
</asp:Content>
