using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testaspnetwebform.DataBase;

namespace testaspnetwebform.BoardGameMgr
{
    public partial class AddEditGame : System.Web.UI.Page
    {
        private string Action = "";
        private string PK = "";
        private DbLibrary dl = new DbLibrary();

        protected void Page_Load(object sender, EventArgs e)
        {
            Action = Request.QueryString["Action"];
            PK = Request.QueryString["PK"];
            if (Action == "Add")
            {
                divAdd.Visible = true;
            }
            else
            {
                divAdd.Visible = false;
            }
        }

        protected string GetResStr(string ResourceName)
        {
            return this.GetLocalResourceObject(ResourceName).ToString();
        }

        protected void btnSubmitClick(object sender, EventArgs e)
        {
            if (Action == "Add")
            {
                //string sql = string.Format("insert into BoardGame values('{0}',{1},{2},{3},'{4}',{5})", tbGameName.Text, tbGamePrice.Text,
                //    ddlPlayerMax.SelectedValue, ddlPlayerMin.SelectedValue, iptRentalDate.Value, rblTimeType.SelectedValue);
                //dl.Query(sql);
            }
            else
            {

            }
        }

        protected void btnAddTypeClick(object sender, EventArgs e)
        {
            
        }
    }
}