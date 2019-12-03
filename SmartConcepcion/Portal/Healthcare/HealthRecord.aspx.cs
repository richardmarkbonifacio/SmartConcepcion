using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Healthcare
{
    public partial class HealthRecord : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        #region Properties
        public long? p_selectedUser
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
                Response.Redirect("~/403");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin();
            if (!IsPostBack)
                loadUserProfile();
        }
        void loadUserProfile()
        {
            dttemp = csql.getUserPaging("SmartConcepcion", gvUserProfiles.PageSize, p_PageIndex, txtUserSearch.Text, p_BrgyID);
            gvUserProfiles.PageIndex = p_PageIndex;
            if (dttemp.Rows.Count > 0)
            {
                gvUserProfiles.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvUserProfiles, dttemp);
                upIncidentReport.Update();
            }
        }
        void loadHealthRecord()
        {
            dttemp = csql.getHealth_record("SmartConcepcion", p_selectedUser.Value);
            //gvUserProfiles.PageIndex = p_PageIndex;
            if (dttemp.Rows.Count > 0)
            {
                
                loadGridView(gvMedicalRecord, dttemp);
                upHealtRecord.Update();
                upHealthInfo.Update();
            }
        }
        void clearUserInfo()
        {
            p_selectedUser = null;
            p_selectedUser = null;
            txtHeight.Text = "";
            txtWeight.Text = "";
            
            header.InnerText = "Create new Incident";
            upHealthInfo.Update();
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
                //DataTable _dt = csql.setHealth_record("SmartConcepcion", p_UserProfileID, ;

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

            txtHeight.Text = _dttemp.Rows[0]["height"].ToString();
            txtWeight.Text = _dttemp.Rows[0]["weight"].ToString();
            

            p_selectedUser = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            loadHealthRecord();
            upHealthInfo.Update();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadUserProfile();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            csql.postVerify("SmartConcepcion", p_selectedUser.Value);
            loadUserProfile();
        }

        protected void btnSaveHealthReocrd_Click(object sender, EventArgs e)
        {
            DateTime? _dtfrom = null, _dtto = null;
            if (txtFrom.Text != "")
                _dtfrom = Convert.ToDateTime(txtFrom.Text);
            if (txtTo.Text != "")
                _dtto =  Convert.ToDateTime(txtTo.Text);

            csql.setHealth_record("SmartConcepcion", p_selectedUser.Value, txtFindings.Text, txtRemarks.Text, _dtfrom, _dtto, p_UserID.Value);
            loadHealthRecord();
        }

        protected void gvMedicalRecord_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}