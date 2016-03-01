using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Banmypham.Control;

namespace Banmypham
{
    public partial class GioHang : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        Giohang gh = new Giohang();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Session["giohang"] == null)
                {
                    GioHang gioHang = (GioHang)Session["giohang"];
                }
                else
                {
                    LoadDG();
                }
            }
        }

        protected void OnDelete(object sender, DataGridCommandEventArgs e)
        {
            int id = e.Item.ItemIndex;
            string ma = (dgGiohang.DataKeys[id]).ToString();
            gh = (Giohang)Session["giohang"];
            gh.delete(ma);
            LoadDG();
        }

        private void LoadDG()
        {
            gh = (Giohang)Session["giohang"];
            DataTable dt = gh.getDataTable();
            lblTongtien.Text = "Tổng tiền: " + gh.Tongtien().ToString();
            dgGiohang.DataSource = dt;
            dgGiohang.DataBind();
        }

        protected void btnXoagiohang_Click(object sender, EventArgs e)
        {
            gh = (Giohang)Session["giohang"];
            if (gh != null)
            {
                gh.deleteAll();
                LoadDG();
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnMuatiep_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void btnDatmua_Click(object sender, EventArgs e)
        {
            string name = "";
            name = (string)Session["tendangnhap"];
            if (name.Equals(""))
            {
                lblMesage.Text = "Bạn phải đăng nhập để đặt hàng!";
                //Response.Redirect("~/GioHang.aspx");
            }
            else
            {
                gh = (Giohang)Session["giohang"];
                int slmua = 0;
                int slmoi = 0;
                float dongiaban = 0;
                string mamp = "";
                string id = "";
                float thanhtien = 0;
                float tongtien = 0;
                int giamgia = 0;
                string mahd = creatHD();
                string iduser = getiduser();
                string hoten = getname();
                string diachi = getdiachi();
                string sodt = getsodt();

                DateTime ngaymua = DateTime.Now;
                int n = gh.getDataTable().Rows.Count;
                for (int i = 0; i < n; i++)
                {
                    id = gh.getDataTable().Rows[i]["MaMP"].ToString();
                    slmua = int.Parse(gh.getDataTable().Rows[i]["Soluong"].ToString());
                    thanhtien = float.Parse(gh.getDataTable().Rows[i]["Thanhtien"].ToString());
                    dongiaban = float.Parse(gh.getDataTable().Rows[i]["Dongiaban"].ToString());
                    giamgia = int.Parse(gh.getDataTable().Rows[i]["Giamgia"].ToString());
                    tongtien = gh.Tongtien();
                    //connect.UpdateData("INSERT INTO HDBan(SoHDB, Ngayban, TenKH, Diachi, SoDT, Tongtien) VALUES('" + mahd + "', '" + ngaymua + "', N'" +
                    //        hoten + "', N'" + diachi + "', " + int.Parse(sodt) + ", " + tongtien + ")");

                    connect.UpdateData("INSERT INTO ChitietHDB(SoHDB, MaMP, Soluong, Dongiaban, Giamgia, Thanhtien) VALUES('" + mahd + "', " + int.Parse(id) + ", " + slmua + ", " + dongiaban + ", " + giamgia + ", " + thanhtien + ")");
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    lblSuccess.Text = "Cảm ơn bạn đã chọn mỹ phẩm của chúng tôi! ";
                }
                connect.UpdateData("INSERT INTO HDBan(SoHDB, Ngayban, TenKH, Diachi, SoDT, Tongtien) VALUES('" + mahd + "', '" + ngaymua + "', N'" +
                        hoten + "', N'" + diachi + "', " + int.Parse(sodt) + ", " + tongtien + ")");

                    //cập nhật lại số lượng mỹ phẩm còn lại
                    int slcu = getslcu(id);
                    slmoi = slcu - slmua;
                    connect.UpdateData("UPDATE DMMypham SET Soluong=" + slmoi + " WHERE MaMP=" + int.Parse(id));
            }
        }

        private int getslcu(string id)
        {
            int sl = 0;
            DataTable tbl = connect.getDataTable("SELECT * FROM DMMypham WHERE MaMP=" + int.Parse(id));
            foreach (DataRow dr in tbl.Rows)
            {
                sl = Convert.ToInt32(dr["Soluong"].ToString());
            }
            return sl;
        }

        public string getsodt()
        {
            string sdt = "";
            DataTable tbl = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + Session["tendangnhap"] + "' ");
            foreach (DataRow dr in tbl.Rows)
            {
                sdt = dr["SoDT"].ToString();
            }
            return sdt;
        }

        public string getdiachi()
        {
            string diachi = "";
            DataTable tbl = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + Session["tendangnhap"] + "' ");
            foreach (DataRow dr in tbl.Rows)
            {
                diachi = dr["Diachi"].ToString();
            }
            return diachi;
        }

        public string getname()
        {
            string name = "";
            DataTable tbl = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + Session["tendangnhap"] + "' ");
            foreach (DataRow dr in tbl.Rows)
            {
                name = dr["Hoten"].ToString();
            }
            return name;
        }

        public string getiduser()
        {
            string id = "";
            DataTable tbl = connect.getDataTable("SELECT * FROM Nguoidung WHERE Tendangnhap='" + Session["tendangnhap"] + "' ");
            foreach (DataRow dr in tbl.Rows)
            {
                id = dr["ID"].ToString();
            }
            return id;
        }

        public string creatHD()
        {
            string mahd = "";
            mahd = DateTime.Now.ToLongDateString().ToString() + "" + DateTime.Now.ToLongTimeString();
            return mahd;
        }
    }
}