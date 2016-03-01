using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

namespace Banmypham.Manager
{
    public partial class Doanhthutheothang : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)//nút xem đó có tác dụng j hả c
        {
            //if (IsPostBack == false)
            //{
            //    //connect = new Connect1();
            //    TaoBaoCao();
            //}
       
            //report.SetDataSource(ds);
            //rptDoanhthutheothang.ReportSource = report;
            //rptDoanhthutheothang.DataBind();

           
        }

        public void TaoBaoCao()
        {
            Connect1 connect = new Connect1();
            string thang = drThang.SelectedValue;
            string nam = drNam.SelectedValue;
            ReportDocument report = new ReportDocument();
            string path = Server.MapPath("\\Manager\\rptDoanhthutheothang.rpt");
            report.Load(path);
            DataTable dt = connect.getDataTable("SELECT Ngayban, SoHDB, Tongtien FROM HDBan WHERE (MONTH(Ngayban) = " + thang + ") AND (YEAR(Ngayban) = " + nam + ")");

            if (dt.Rows.Count > 0)
            {
                dstDoanhthutheothang ds = new dstDoanhthutheothang();
                DataRow dr;
                foreach (DataRow drdt in dt.Rows)
                {
                    dr = ds.Tables[0].NewRow();
                    dr["Ngayban"] = drdt["Ngayban"];
                    dr["Tongtien"] = drdt["Tongtien"];
                    dr["SoHDB"] = drdt["SoHDB"];
                    ds.Tables[0].Rows.Add(dr);
                }
                report.SetDataSource(ds);
                rptDoanhthutheothang.ReportSource = report;
            }
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            TaoBaoCao();
        }
    }
}