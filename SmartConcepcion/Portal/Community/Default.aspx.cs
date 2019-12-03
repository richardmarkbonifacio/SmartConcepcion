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

        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            if (!isAdmin())
            {
                Response.Redirect("~/Portal/");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadUserProfile();
                loadDropDown(ddZone, csql.getBrgyZone("SmartConcepcion", p_BrgyID), false);
            }
                
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
            try
            {
                DataTable _dt = csql.UserCreateUpdate("SmartConcepcion", p_UserProfileID, txtEmail.Text, txtFnam.Text, txtMnam.Text, txtLnam.Text,
                txtSuffix.Text, txtNationality.Text, ddCivilStatus.SelectedValue, txtContact.Text, txtStbldgno.Text, p_BrgyID, Convert.ToInt64(ddZone.SelectedValue), txtVotersID.Text,
                Convert.ToDateTime(txtBday.Text), p_UserID, chkIndigent.Checked, chkSenir.Checked, chkPwd.Checked, chk4ps.Checked);

                loadUserProfile();
                clearUserInfo();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getUser_Details("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            header.InnerText = "Update Account";

            txtBday.Text = Convert.ToDateTime(_dttemp.Rows[0]["birthday"].ToString()).ToString("yyyy-MM-dd");
            txtContact.Text = _dttemp.Rows[0]["contactno"].ToString();
            txtEmail.Text = _dttemp.Rows[0]["email"].ToString();
            txtFnam.Text = _dttemp.Rows[0]["firstname"].ToString();
            txtLnam.Text = _dttemp.Rows[0]["lastname"].ToString();
            txtMnam.Text = _dttemp.Rows[0]["middlename"].ToString();
            txtStbldgno.Text = _dttemp.Rows[0]["stbldgno"].ToString();
            txtVotersID.Text =  _dttemp.Rows[0]["votersID"].ToString();
            txtSuffix.Text = _dttemp.Rows[0]["suffix"].ToString();
            //ddGender.SelectedValue = _dttemp.Rows[0]["middlename"].ToString();
            ddCivilStatus.SelectedValue = _dttemp.Rows[0]["civil_status"].ToString();
            ddZone.SelectedValue = _dttemp.Rows[0]["zoneID"].ToString();
            txtNationality.Text = _dttemp.Rows[0]["nationality"].ToString();

            chk4ps.Checked = Convert.ToBoolean(_dttemp.Rows[0]["is4ps"].ToString());
            chkIndigent.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isIndigent"].ToString());
            chkPwd.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isPWD"].ToString());
            chkSenir.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isSeniorCitizen"].ToString());
            lblAccountNo.Text = _dttemp.Rows[0]["ID"].ToString();
            p_UserProfileID = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            upIncidentInfo.Update();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadUserProfile();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            csql.postVerify("SmartConcepcion", p_UserProfileID.Value);
            loadUserProfile();
        }
    }
}