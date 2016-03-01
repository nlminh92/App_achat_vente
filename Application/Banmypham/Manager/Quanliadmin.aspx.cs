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
    public partial class Quanliadmin : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDownlist("SELECT Maquyenhan, Quyenhan FROM Quyenhan", drMaquyenhan);
                LoadDG();
            }            
        }

        protected void LoadDG()
        {            
           dgNguoidung.DataSource = connect.getDataTable("SELECT * FROM Nguoidung");
           dgNguoidung.DataBind();
        }

        public void LoadDropDownlist(String s, DropDownList dr)
        {
            DataTable dt = connect.getDataTable(s);
            dr.DataSource = dt;
            dr.DataValueField = dt.Columns[0].ToString();
            dr.DataTextField = dt.Columns[1].ToString();
            dr.DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string tendangnhap = txtTendangnhap.Text;
            DataTable dt = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + tendangnhap + "'");
            if (dt.Rows.Count == 0)
            {
                string gioitinh = rdoNam.Checked ? "Nam" : "Nữ";
                string ngaysinh = string.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(txtNgaysinh.Text));
                connect.UpdateData("INSERT INTO Nguoidung(Hoten, Ngaysinh, Diachi, SoDT, Maquyenhan, Gioitinh, Email, Tendangnhap, Password) VALUES(N'" + txtHoten.Text.ToString() +
                    "', '" + ngaysinh + "', N'" + txtDiachi.Text + "', " + txtSoDT.Text + ", " + drMaquyenhan.SelectedValue + ", N'" + gioitinh + "', '" + txtEmail.Text + "', '" +
                    txtTendangnhap.Text + "', '" + txtPassword.Text + "')");
                drMaquyenhan.SelectedIndex = -1;
                LoadDG();
            }
            else
            {
                lblThongbao.Text = "Tên đăng nhập này đã tồn tại";
            }
        }

        protected void OnEdit(object sender, DataGridCommandEventArgs e)
        {
            dgNguoidung.EditItemIndex = e.Item.ItemIndex;
            LoadDG();
        }

        protected void dgNguoidung_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgNguoidung.CurrentPageIndex = e.NewPageIndex;
            LoadDG();
        }

        protected void OnDelete(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            int ma = (int)dgNguoidung.DataKeys[id];

            connect.UpdateData("DELETE FROM Nguoidung WHERE ID=" + ma);
            LoadDG();
        }

        protected void OnUpdate(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            int ma = (int)dgNguoidung.DataKeys[id];

            int idmoi = int.Parse(((TextBox)(e.Item.Cells[0].Controls[0])).Text);
            string name = ((TextBox)(e.Item.Cells[1].Controls[0])).Text.ToString();
            string ngaysinh = ((TextBox)(e.Item.Cells[2].Controls[0])).Text;
            string ns = string.Format("{0:MM/dd/yyyy}", Convert.ToDateTime(ngaysinh));
            string diachi = ((TextBox)(e.Item.Cells[3].Controls[0])).Text.ToString();
            int sodt = int.Parse(((TextBox)(e.Item.Cells[4].Controls[0])).Text);
            int maqh = int.Parse(((TextBox)(e.Item.Cells[5].Controls[0])).Text);
            string gt = ((TextBox)(e.Item.Cells[6].Controls[0])).Text;
            string email = ((TextBox)(e.Item.Cells[7].Controls[0])).Text;
            string tendangnhap = ((TextBox)(e.Item.Cells[8].Controls[0])).Text;
            string pass = ((TextBox)(e.Item.Cells[9].Controls[0])).Text.ToString();

            connect.UpdateData("UPDATE Nguoidung SET Hoten=N'" + name + "', Ngaysinh='" + ns + "', Diachi=N'" + diachi + "', SoDT=" + sodt + ", Maquyenhan=" + maqh
                + ", Gioitinh=N'" + gt + "', Email='" + email + "', Tendangnhap='" + tendangnhap + "', Password='" + pass + "' WHERE ID=" + ma);
            dgNguoidung.SelectedIndex = -1;
            LoadDG();
        }

        protected void OnCancel(object sender, DataGridCommandEventArgs e)
        {
            dgNguoidung.SelectedIndex = -1;
            LoadDG();
        }
    }
}