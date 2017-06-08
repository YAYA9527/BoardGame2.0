using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace testaspnetwebform.DataBase
{
    public class DbLibrary
    {
        SqlConnection connect = new SqlConnection();
        DataSet dsResult = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand sqlCmd = new SqlCommand();

        public DbLibrary()
        {
            //取得Web.config連線字串
            connect = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            connect.Open();
        }

        public DataSet QueryDataSet(string sql, string resultTable)
        {
            da = new SqlDataAdapter(sql, connect);
            da.Fill(dsResult, resultTable);
            return dsResult;
        }

        public void Query(string sql)
        {
            sqlCmd = new SqlCommand(sql, connect);
            sqlCmd.ExecuteNonQuery();
        }
    }
}