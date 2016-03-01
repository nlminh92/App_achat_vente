using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Data.OleDb;

namespace Banmypham
{
    /// <summary>
    /// Summary description for Connect1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Connect1 : System.Web.Services.WebService
    {
        SqlConnection conn;
        [WebMethod]
         public void OpenDB()
        {
            conn = new SqlConnection("Data Source=127.0.0.1; user id=sa; password=123456; database=Shopmypham");
            try
            {
                conn.Open();
            }
            catch
            {
                return;
            }
        }

        [WebMethod]
        public void Close()
        {
            conn.Close();
        }
        [WebMethod]
        public DataTable getDataTable(String s)
        {
            OpenDB();
            DataTable table = new DataTable();
            SqlDataAdapter sqlDA = new SqlDataAdapter(s, conn);
            sqlDA.Fill(table);
            return table;
        }
        [WebMethod]
        public  DataSet getDataSet(String s)
        {
            
            DataSet dts = new DataSet();
            DataTable table = new DataTable();

            SqlDataAdapter sqlDA = new SqlDataAdapter(s, conn);
            sqlDA.Fill(table);
            dts.Tables.Add(table);
            return dts;
        }
        [WebMethod]
        public int UpdateData(String s)
        {
            OpenDB();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = s;
            return cmd.ExecuteNonQuery();
        }
    }    
}
