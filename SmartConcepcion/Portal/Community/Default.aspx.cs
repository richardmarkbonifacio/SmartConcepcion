using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Community
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        #region Properties
        public long? p_UserProfileID
        {
            get
            {
                if (ViewState["UserProfileID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["UserProfileID"].ToString());
                }
            }
            set
            {
                ViewState["UserProfileID"] = value;
            }
        }

        public long? p_ComplainantID
        {
            get
            {
                if (ViewState["ComplainantID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["ComplainantID"].ToString());
                }
            }
            set
            {
                ViewState["ComplainantID"] = value;
            }
        }
        public long? p_AccusedID
        {
            get
            {
                if (ViewState["AccusedID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["AccusedID"].ToString());
                }
            }
            set
            {
                ViewState["AccusedID"] = value;
            }
        }
        public int p_PageIndex
        {
            get
            {
                if (ViewState["PageIndex"] == null)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(ViewState["PageIndex"].ToString());
                }
            }
            set
            {
                ViewState["PageIndex"] = value;
            }
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin();
            if (!IsPostBack)
                loadUserProfile();
        }
        void loadUserProfile()
        {
            dttemp = csql.getUserPaging("SmartConcepcion", gvUserProfiles.PageSize, p_PageIndex,txtUserSearch.Text,p_BrgyID);
            gvUserProfiles.PageIndex = p_PageIndex;
            if(dttemp.Rows.Count > 0)
            {
                gvUserProfiles.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvUserProfiles, dttemp);
                upIncidentReport.Update();
            }
            
        }
        void clearUserInfo()
        {
            p_UserProfileID = null;
            p_UserProfileID = null;
            txtFnam.Text = "";
            txtLnam.Text = "";
            txtMnam.Text = "";
            txtBday.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            
            header.InnerText = "Create new Incident";
            upIncidentInfo.Update();
        }
        protected void gvUserProfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadUserProfile();
                clearUserInfo();

            }
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {
            clearUserInfo();
        }

        protected void btnPostIR_Click(object sender, EventArgs e)
        {
            //csql.setIncidentReport("SmartConcepcion", p_UserProfileID, txtTitle.Text, txtDetails.Text, "", p_ComplainantID, p_AccusedID, 
            //    txtComplainant.Text, txtAccused.Text,Convert.ToDateTime(txtIncidentDate.Text), Convert.ToDateTime(txtConfrontation.Text),txtLocation.Text,
            //    txtRemarks.Text,"ptd",p_UserID);

            loadUserProfile();
            clearUserInfo();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getUser_Details("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            header.InnerText = "Update Account";

            txtBday.Text = _dttemp.Rows[0]["birthday"].ToString();
            txtContact.Text = _dttemp.Rows[0]["contactno"].ToString();
            txtEmail.Text = _dttemp.Rows[0]["email"].ToString();
            txtFnam.Text = _dttemp.Rows[0]["firstname"].ToString();
            txtLnam.Text = _dttemp.Rows[0]["lastname"].ToString();
            txtMnam.Text = _dttemp.Rows[0]["middlename"].ToString();
            

            p_UserProfileID = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            upIncidentInfo.Update();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadUserProfile();
        }

    }
}