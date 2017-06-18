using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExploreGame_AddEditGame : BgwPage
{
    private string Action = "";
    private string PK = "";
    private DbLibrary DbLibraryControl = new DbLibrary();

    protected void Page_Load(object sender, EventArgs e)
    {
        Action = Request.QueryString["Action"];
        PK = Request.QueryString["PK"];

        //縮圖            
        if (Session["FileUploadControl"] == null && GamePhotoFile.HasFile)
        {
            //This condition occurs for first time you upload a file
            Session["FileUploadControl"] = GamePhotoFile;
            lblPhotoName.Text = GamePhotoFile.FileName;
        }
        else if (Session["FileUploadControl"] != null && (!GamePhotoFile.HasFile))
        {
            //This condition will occur on next postbacks    
            GamePhotoFile = (FileUpload)Session["FileUploadControl"];
            lblPhotoName.Text = GamePhotoFile.FileName;
        }
        else if (GamePhotoFile.HasFile)
        {
            //when Session will have File but user want to change the file 
            Session["FileUploadControl"] = GamePhotoFile;
            lblPhotoName.Text = GamePhotoFile.FileName;
        }

        //桌遊類型
        string[] DelPKs = hfDelTypePKs.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        DataSet DsGameTypes = DbLibraryControl.QueryDataSet("select TI.* from Tree as T inner join TreeItem as TI on TI.TreePK = T.PK where T.Name = 'GameType'", "GameTypesResult");
        if (DsGameTypes.Tables["GameTypesResult"].Rows.Count != 0)
        {
            foreach (DataRow row in DsGameTypes.Tables["GameTypesResult"].Rows)
            {
                //刪除的PK不能加入
                if (DelPKs.Count() == 0 || !DelPKs.Contains(row["PK"].ToString()))
                {
                    Label lblType = new Label()
                    {
                        CssClass = "checkbox-inline"
                    };
                    CheckBox cblType = new CheckBox
                    {
                        Text = row["Name"].ToString() + "&nbsp;&nbsp;",
                        Checked = false
                    };
                    cblType.InputAttributes["value"] = row["PK"].ToString();
                    lblType.Controls.Add(cblType);
                    divType.Controls.Add(lblType);
                }
            }
        }

        if (Action == "Add")
        {
            divAdd.Visible = true;
        }
        else
        {
            divAdd.Visible = false;
        }
    }

    protected void btnSubmitClick(object sender, EventArgs e)
    {
        GameBasicInfoStorage GBIS = new GameBasicInfoStorage();
        GBIS.GameName = txtGameName.Value.Trim();
        GBIS.Time = Convert.ToUInt16(ddlGameTime.SelectedValue);
        GBIS.MinPlayer = Convert.ToUInt16(ddlMinPlayer.SelectedValue);
        GBIS.MaxPlayer = Convert.ToUInt16(ddlMaxPlayer.SelectedValue);
        GBIS.GameCategory = hfSelectedTypePKs.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        GBIS.RentalStartDate = iptRentalStartDate.Value;
        GBIS.Difficulty = Convert.ToUInt16(hfDifficulty.Value);
        GBIS.Luck = Convert.ToUInt16(hfLuck.Value);
        GBIS.Strategy = Convert.ToUInt16(hfStrategy.Value);
        GBIS.Interaction = Convert.ToUInt16(hfInteraction.Value);
        GBIS.IsOpen = (hfIsOpen.Value == "0") ? false : true;
        GBIS.Rent = (string.IsNullOrEmpty(txtRent.Value)) ? -1 : Convert.ToUInt16(txtRent.Value);
        GBIS.Deposit = (string.IsNullOrEmpty(txtDeposit.Value)) ? -1 : Convert.ToUInt16(txtDeposit.Value);
        GBIS.TeachingUrl = txtTeachingUrl.Value;
        GBIS.Description = taDescription.Value.Trim();       
         if (Session["FileUploadControl"] != null)
         {
             FileUpload FileUploadControl = (FileUpload)Session["FileUploadControl"];
             FileUploadControl.SaveAs(Server.MapPath("Images/" + FileUploadControl.FileName));
             GBIS.ImgName = FileUploadControl.FileName;
         }
         else
         {
             GBIS.ImgName = "";
         }

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

    protected void btnCancelClick(object sender, EventArgs e)
    {
        Session["FileUploadControl"] = null;
        Response.Redirect("~/ExploreGame/Index.aspx");
    }

    protected void btnAddTypeClick(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtType.Value.Trim()))
        {
            //新增桌遊類型
            DataSet DsTreeItemPK = DbLibraryControl.QueryDataSet("insert into TreeItem (TreePK, Name) values (1, '" + txtType.Value.Trim() + "'); select SCOPE_IDENTITY() as TreeItemPK;", "TreeItemPKResult");
            Label lblType = new Label()
            {
                CssClass = "checkbox-inline"
            };
            CheckBox cblType = new CheckBox
            {
                Text = txtType.Value + "&nbsp;&nbsp;",
                Checked = true
            };
            cblType.InputAttributes["value"] = DsTreeItemPK.Tables["TreeItemPKResult"].Rows[0]["TreeItemPK"].ToString();
            lblType.Controls.Add(cblType);
            divType.Controls.Add(lblType);
            txtType.Value = "";
        }
    }

    protected void btnDelTypeClick(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(hfDelTypePKs.Value))
        {
            DbLibraryControl.Query("delete from TreeItem where PK in (" + hfDelTypePKs.Value + ")");
            hfDelTypePKs.Value = "";
        }
    }
   
}