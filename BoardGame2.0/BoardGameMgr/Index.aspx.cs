using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using testaspnetwebform.DataBase;

namespace testaspnetwebform.BoardGameMgr
{
    public partial class Index : System.Web.UI.Page
    {
        private DbLibrary dl = new DbLibrary();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet myBoardGameData = dl.QueryDataSet("select * from BoardGame");
                rptBoardGame.DataSource = myBoardGameData;
                rptBoardGame.DataBind();
            }
        }

        protected string GetResStr(string ResourceName)
        {
            return this.GetLocalResourceObject(ResourceName).ToString();
        }

        protected void rptBoardGame_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                Literal ltlRentalDateValue = e.Item.FindControl("ltlRentalDateValue") as Literal;
                Literal ltlPlayerValue = e.Item.FindControl("ltlPlayerValue") as Literal;

                ltlRentalDateValue.Text = Convert.ToDateTime(drv["RentalDate"].ToString()).ToString("yyyy-MM-dd");
                ltlPlayerValue.Text = drv["PlayerMin"].ToString() + "-" + drv["PlayerMax"].ToString();
            }
        }

        protected void btnSearchClick(object sender, EventArgs e)
        {
        }

        protected void btnAddGameClick(object sender, EventArgs e)
        {
            Response.Redirect("AddEditGame.aspx?Action=Add");
        }

        protected void btnExportExcelClick(object sender, EventArgs e)
        {
            
        }
    }
}