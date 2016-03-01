using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace Banmypham.Control
{
    class Giohang
    {
        DataTable tb = new DataTable();
        Connect1 connect = new Connect1();

        public Giohang()
        {
            tb.Columns.Add("MaMP");
            tb.Columns.Add("TenMP");
            tb.Columns.Add("Dongiaban");
            tb.Columns.Add("Soluong");
            tb.Columns.Add("Giamgia");
            tb.Columns.Add("Thanhtien");
        }

        public DataTable getDataTable()
        {
            return this.tb;
        }

        public void setTable(DataTable tb)
        {
            this.tb = tb;
        }

        public bool ktSoluong(string mamp, int soluong)
        {
            int sl = int.Parse(connect.getDataTable("SELECT Soluong FROM DMMypham WHERE MaMP=" + mamp).Rows[0][0].ToString());
            if (soluong > sl) return false;
            else return true;
        }

        //phuong thuc tinh tong tien
        public float Tongtien() //cai ham nay vo dung ha c?thế thì c dùng đi t ko để ý
        {
            float tongtien = 0;
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                tongtien += float.Parse(tb.Rows[i]["Thanhtien"].ToString());
            }
            return tongtien;
        }

        //phuong thuc tinh tong so san pham trong gio hang
        public int Tongsp()
        {
            int tongsp = 0;
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                tongsp += int.Parse(tb.Rows[i]["Soluong"].ToString());
            }
            return tongsp;
        }

        //phuong thuc them mot san pham moi vao gio hang
        public bool themGiohang(string mamp, string tenmp, float dongiaban, int giamgia)//string anh
        {
            bool kiemtra = false;
            if (tb.Rows.Count != 0)
            {
                foreach (DataRow dr in tb.Rows)
                {
                    if(dr[0].ToString().Equals(mamp.ToString()))
                    {
                        if (!ktSoluong(mamp, int.Parse(dr[3].ToString()) + 1))
                        {
                            return false;
                        }
                        dr[3] = int.Parse(dr[3].ToString()) + 1;
                        dr[5] = ((double.Parse(dr[3].ToString()) * double.Parse(dr[2].ToString())) - (double.Parse(dr[3].ToString()) * double.Parse(dr[2].ToString()) * int.Parse(dr[4].ToString()))/100).ToString();
                        kiemtra = true;
                    }
                }
                if(!kiemtra)
                {
                    if(!ktSoluong(mamp, 1))
                    {
                        return false;
                    }
                    DataRow row = tb.NewRow();
                    row[0] = mamp;
                    row[1] = tenmp;
                    row[2] = dongiaban.ToString();
                    row[3] = '1';
                    row[4] = giamgia;
                    row[5] = (dongiaban - dongiaban * giamgia / 100).ToString();
                    tb.Rows.Add(row);
                }
            }
            else
            {
                if (!ktSoluong(mamp, 1))
                {
                    return false;
                }
                DataRow row = tb.NewRow();
                row[0] = mamp;
                row[1] = tenmp;
                row[2] = dongiaban.ToString();
                row[3] = '1';
                row[4] = giamgia;
                row[5] = (dongiaban - dongiaban * giamgia / 100).ToString();
                tb.Rows.Add(row);
            }
            return true;
        }

        public bool delete(string mamp)
        {
            foreach(DataRow row in tb.Rows)
            {
                if(mamp.Equals(row[0].ToString()))
                {
                    tb.Rows.Remove(row);
                    break;
                }
            }
            return true;
        }

        public bool update(string mamp, int soluong)
        {
            if(!ktSoluong(mamp, soluong))
            {
                return false;
            }
            foreach (DataRow row in tb.Rows)
            {
                if (mamp.Equals(row[0].ToString()))
                {
                    row[3] = soluong;
                    row[5] = (double.Parse(row[2].ToString()) * soluong - double.Parse(row[2].ToString()) * soluong * int.Parse(row[4].ToString())/100).ToString();
                    break;
                }
            }
            return true;
        }
        public void deleteAll()
        {
            tb.Clear();
        }
    }
}
