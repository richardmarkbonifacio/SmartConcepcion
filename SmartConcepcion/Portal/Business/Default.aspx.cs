using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Business
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
            
            if (!IsPostBack)
                loadBusinessProfile();
        }
        void loadBusinessProfile()
        {
            dttemp = csql.getBusinessPaging("SmartConcepcion", gvBusinessProfiles.PageSize, p_PageIndex,txtUserSearch.Text,p_BrgyID);
            gvBusinessProfiles.PageIndex = p_PageIndex;
            if(dttemp.Rows.Count > 0)
            {
                gvBusinessProfiles.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvBusinessProfiles, dttemp);
                upBusiness.Update();
            }
            
        }
        void clearUserInfo()
        {
            p_UserProfileID = null;
            //txtFnam.Text = "";
            //txtLnam.Text = "";
            //txtMnam.Text = "";
            //txtBday.Text = "";
            //txtContact.Text = "";
            //txtEmail.Text = "";
            
            header.InnerText = "Create new Incident";
            upIncidentInfo.Update();
        }
        protected void gvBusinessProfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadBusinessProfile();
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
                DataTable _dt = csql.setBusiness("SmartConcepcion", p_UserProfileID, txtEmail.Text, txtBusiness.Text, 0, txtDescription.Text, txtOwner.Text,
                txtPermit.Text, txtContact.Text,txtStbldgno.Text, p_BrgyID, p_UserID);

                loadBusinessProfile();
                clearUserInfo();
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getBusiness_Details("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            header.InnerText = "Update Account";

            txtBusiness.Text = _dttemp.Rows[0]["businessname"].ToString();
            txtOwner.Text = _dttemp.Rows[0]["owner"].ToString();
            txtDescription.Text = _dttemp.Rows[0]["description"].ToString();
            txtPermit.Text = _dttemp.Rows[0]["permitno"].ToString();
            txtStbldgno.Text = _dttemp.Rows[0]["stnobldg"].ToString();
            txtContact.Text = _dttemp.Rows[0]["contactno"].ToString();
            txtEmail.Text = _dttemp.Rows[0]["email"].ToString();


            p_UserProfileID = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            upIncidentInfo.Update();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadBusinessProfile();
        }

    }
}