using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Banmypham
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbltendangnhap.Visible = false;
            lbtLogout.Visible = false;
            if (Session["tendangnhap"] == null) Session["tendangnhap"] = "";
            if (Session["tendangnhap"].ToString().Equals(""))
            {
                lbltendangnhap.Visible = false;
                lbtLogout.Visible = false;
                lblMessage.Visible = true;
                txtPassword.Visible = true;
                txtUser.Visible = true;
                Signin.Visible = true;
            }
            else
            {
                Signin.Visible = false;
                txtPassword.Visible = false;
                txtUser.Visible = false;
                btnLogin.Visible = false;
                lbtLogout.Visible = true;
                lbltendangnhap.Visible = true;
                lbltendangnhap.Text = "Hello " + Session["tendangnhap"] + " !";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string name = txtUser.Text;
            string password = txtPassword.Text;
            if (name.Equals(""))
            {
                lblMessage.Text = "(*) Bạn chưa nhập username.";
                txtUser.Focus();
            }
            if (password.Equals(""))
            {
                lblMessage.Text = "(*) Bạn chưa nhập password.";
                txtPassword.Focus();
            }
            Connect1 connect = new Connect1();
            DataTable dt = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + name + "' AND Password='" + password + "'");
            if (dt.Rows.Count > 0)
            {
                Session["tendangnhap"] = dt.Rows[0]["Tendangnhap"].ToString();
                foreach (DataRow dr in dt.Rows)
                {
                    if(dr["Maquyenhan"].ToString().ToLower() == "1")
                    {
                        Response.Redirect("~/Manager/Default.aspx");
                        lbtAdmin.Visible = true;
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                
            }
            else
                lblMessage.Text = "Sai mật khẩu hoặc tên đăng nhập, xin hãy thử lại!";
        }

        protected void lbtLogout_Click(object sender, EventArgs e)
        {
            Session["tendangnhap"] = "";
            Response.Redirect("~/Default.aspx");
        }

        protected void imagebtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://socnhi.com/");
        }

        protected void imagebtn2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.trochoiviet.com/games/");
        }

        protected void imagebtn3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://www.nhatnghe.com/");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Timkiem.aspx?TenMP=" + txtsearch.Text + "");
        }

        protected void btnTimtheogia_Click(object sender, EventArgs e)
        {
            //DataTable dt = connect.getDataTable("SELECT DMMypham.MaMP, DMMypham.TenMP, LoaiMP.Tenloai, DMMypham.Maloai, DMMypham.Dongiaban, DMMypham.Anh FROM DMMypham, LoaiMP WHERE LoaiMP.Maloai = DMMypham.Maloai AND DMMypham.Dongiaban BETWEEN "
            //    + double.Parse(drTu.Text) + " AND " + double.Parse(drDen.Text));
            if (Session["timkiemtheogia"] == null)
            {
                Session["timkiemtheogia"] = new DataTable();
            }
            Session["timkiemtheogia"] = connect.getDataTable("SELECT a.MaMP, a.TenMP, b.Tenloai, a.Maloai, a.Dongiaban, a.Anh FROM DMMypham AS a, LoaiMP AS b WHERE b.Maloai = a.Maloai AND a.Dongiaban BETWEEN "
                + double.Parse(drTu.SelectedValue) + " AND " + double.Parse(drDen.SelectedValue));
            Response.Redirect("~/Timkiemtheogia.aspx");
        }

        protected void lbtAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Manager/Default.aspx");
        }
    }
}