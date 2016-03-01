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
    public partial class Timkiemhoadonban : System.Web.UI.Page
    {
        Connect1 connect = new Connect1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            string tk = txtTimkiem.Text;
            DataTable dt = connect.getDataTable("SELECT * FROM HDBan WHERE SoHDB like '%" + tk + "%'");
            dgTimkiem.DataSource = dt;
            dgTimkiem.DataBind();
            
            foreach (DataRow dr in dt.Rows)
            {
                DataTable tbl = new DataTable();
                tbl = connect.getDataTable("SELECT MaMP, Soluong, Dongiaban, Giamgia, Thanhtien FROM ChitietHDB WHERE SoHDB='" + dr["SoHDB"].ToString() +"'");
                Session["chitiethd"] = tbl;
            }
        }
    }
}