using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Banmypham.Manager
{
    public partial class Themmypham : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connect.OpenDB();   
                LoadCombobox("SELECT Maloai, Tenloai FROM LoaiMP", drMaloai);
                LoadCombobox("SELECT MaHSX, TenHSX FROM Hangsanxuat", drMaHSX);
                LoadCombobox("SELECT MaNCC, TenNCC FROM Nhacungcap", drMaNCC);
                LoadDG();
            }
            
        }

        protected void btnThemmoi_Click(object sender, EventArgs e)
        {
            
            connect.UpdateData("INSERT INTO DMMypham(TenMP, Maloai, MaHSX, MaNCC, Soluong, Dongiaban, Giamgia, Mota, Anh) VALUES(N'" + txtTenMP.Text + "'," + drMaloai.SelectedValue + ", "
                + drMaHSX.SelectedValue + ", " + drMaNCC.SelectedValue + ", " + txtSoluong.Text + ", " + txtDongiaban.Text + ", " + txtDongiaban.Text + ", N'" + txtMota.Text + "', N'/Images/" + 
                fuAnh.FileName + "')");
            fuAnh.SaveAs(Server.MapPath("~/Images/" + fuAnh.FileName));
            LoadDG();
            Response.Write("<script language='javascript'>alert('Thêm mới thành công !');</script>");
            Resetvalue();
        }
        public void LoadCombobox( String s, DropDownList dr)
        {
            DataTable dt = connect.getDataTable(s);
            dr.DataSource = dt;
            dr.DataValueField = dt.Columns[0].ToString();
            dr.DataTextField = dt.Columns[1].ToString();
            dr.DataBind();
        }
        public void Resetvalue()
        {
            txtTenMP.Text = "";
            txtSoluong.Text = "0";
            txtDongiaban.Text = "0";
            txtMota.Text = "";
        }

        public void LoadDG()
        {
            dgMypham.DataSource = connect.getDataTable("SELECT * FROM DMMypham");
            dgMypham.DataBind();
        }

        protected void dgMypham_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgMypham.CurrentPageIndex = e.NewPageIndex;
            LoadDG();
        }

        protected void OnEdit(object sender, DataGridCommandEventArgs e)
        {
            //thiet lap trang thai cua datagrid ma nguoi dung chon sang trang thai co the sua duoc
            dgMypham.EditItemIndex = e.Item.ItemIndex;

            //ket gan lai co so du lieu
            LoadDG();
        }

        protected void OnDelete(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            int ma = (int)dgMypham.DataKeys[id];

            connect.UpdateData("DELETE FROM DMMypham WHERE MaMP=" + ma.ToString());
            LoadDG();
        }

        protected void OnUpdate(object sender, DataGridCommandEventArgs e)
        {
            //lay ra ma ban ghi mà nguoi dung chon
            int id = e.Item.ItemIndex;
            int ma = (int)dgMypham.DataKeys[id];

            //lay du lieu moi tu cac o textbox
            int mamoi = int.Parse(((TextBox)(e.Item.Cells[0].Controls[0])).Text);
            string tenmp = ((TextBox)(e.Item.Cells[1].Controls[0])).Text.ToString();
            int maloai = int.Parse(((TextBox)(e.Item.Cells[2].Controls[0])).Text);
            int mahsx = int.Parse(((TextBox)(e.Item.Cells[3].Controls[0])).Text);
            int mancc = int.Parse(((TextBox)(e.Item.Cells[4].Controls[0])).Text);
            int soluong = int.Parse(((TextBox)(e.Item.Cells[5].Controls[0])).Text);
            double dongiaban = double.Parse(((TextBox)(e.Item.Cells[6].Controls[0])).Text);
            int giamgia = int.Parse(((TextBox)(e.Item.Cells[7].Controls[0])).Text);
            string mota = ((TextBox)(e.Item.Cells[8].Controls[0])).Text.ToString();
            string anh = ((TextBox)(e.Item.Cells[9].Controls[0])).Text.ToString();

            //cap nhat lai co so du lieu
            connect.UpdateData("UPDATE DMMypham SET TenMP=N'" + tenmp + "', Maloai=" + maloai + ", MaHSX=" + mahsx + ", MaNCC=" + mancc + ", Soluong=" + soluong + ", Dongiaban=" + dongiaban + ", Giamgia=" + giamgia + ", Mota=N'"
                + mota + "', Anh=N'" + anh  + "' WHERE MaMP=" + ma);
            dgMypham.EditItemIndex = -1;
            LoadDG();
        }

        protected void OnCancle(object sender, DataGridCommandEventArgs e)
        {
            dgMypham.EditItemIndex = -1;
            LoadDG();
        }
    }
}