using System;
using System.Collections.Generic;
using System.Data;
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
                //if (FileUpload1.HasFile)
                //{
                //    FileUpload1.SaveAs(Server.MapPath("images/" + FileName));
                //}
                //else
                //{
                //    //Code for default
                //}
                //foreach (var control in Page.Form.Controls)
                //{
                //    if (control is HtmlInputControl)
                //    {
                //        var htmlInputControl = control as HtmlInputControl;
                //        string controlName = htmlInputControl.Name;
                //        string controlId = htmlInputControl.ID;
                //    }
                //}
            }
            else
            {

            }
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            Response.Redirect("~/BoardGameMgr/Index.aspx");
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
}