using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Officials
{
    public partial class Board : clsInherited
    {
        #region PROPERTIES
        public long? p_replaceID
        {
            get
            {
                if (ViewState["replaceID"] != null)
                {
                    return Convert.ToInt32(ViewState["replaceID"]);
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["replaceID"] = value;
            }
        }
        public long? p_OfficialID
        {
            get
            {
                if (ViewState["OfficialID"] != null)
                {
                    return Convert.ToInt32(ViewState["OfficialID"]);
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["OfficialID"] = value;
            }
        }
        public DataSet p_dsOfficial
        {
            get
            {
                return (DataSet)ViewState["dsOfficial"];
            }
            set
            {
                ViewState["dsOfficial"] = value;
            }
        }
        #endregion
        clsQuery csql = new clsQuery();
        DataTable dttemp;

        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            if (!isAdmin())
            {
                Response.Redirect("~/403");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                loadOfficial();
        }
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            dttemp = csql.getUserPaging("SmartConcepcion", 5, 0, txtUserSearch.Text, p_BrgyID, true);
            if (dttemp.Rows.Count > 0)
            {
                loadGridView(gvTemplateError, dttemp);
                upNameSuggestion.Update();
            }
        }
        protected void lnkSelectResident_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;

            long? replaceID = null;

            if (hfReplaceID.Value != "")
                replaceID = convert_long(hfReplaceID.Value,false);

            csql.setBrgyOfficial("SmartConcepcion",p_BrgyID, hfFrom.Value, Convert.ToInt64(_lnk.ToolTip), replaceID ,p_UserID.Value);
            loadOfficial();
        }

        protected void lnkNotAResident_Click(object sender, EventArgs e)
        {


            if (hfFrom.Value == "accsd")
            {
                //txtAccused.Text = txtUserSearch.Text;
                //p_AccusedID = null;
            }
            else
            {
                //txtComplainant.Text = txtUserSearch.Text;
                //p_ComplainantID = null;
            }
            upBoard.Update();
        }
        void loadOfficial()
        {
            p_dsOfficial = csql.getBrgyOfficial("SmartConcepcion", p_BrgyID);
            if(b_hasrow(p_dsOfficial.Tables["dtCapt"]))
                txtChairman.Text = p_dsOfficial.Tables["dtCapt"].Rows[0]["officialName"].ToString();
            if(b_hasrow(p_dsOfficial.Tables["dtEmployee"]))
                loadListview(lvCouncilor, p_dsOfficial.Tables["dtCouncilor"]);

            if (b_hasrow(p_dsOfficial.Tables["dtEmployee"]))
                loadGridView(gvSecretary, p_dsOfficial.Tables["dtEmployee"]);

            upBoard.Update();
        }

        protected void Remove_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            csql.setBrgyOfficialRemove("SmartConcepcion", p_BrgyID, _lnk.CommandName, convert_long(_lnk.ToolTip, false).Value);
            loadOfficial();
        }
    }
}