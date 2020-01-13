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
        public long? p_selecteduser
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
            p_selecteduser = null;
            txtFnam.Text = "";
            txtLnam.Text = "";
            txtMnam.Text = "";
            txtBday.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";

            txtPreschool.Text = "";
            txtPreFrom.Text = "";
            txtPreTo.Text = "";

            txtElem.Text = "";
            txtElemStart.Text = "";
            txtElemEnd.Text = "";

            txtHS.Text = "";
            txtHSStart.Text = "";
            txtHSEnd.Text = "";

            txtCollege.Text = "";
            txtCollegeStart.Text = "";
            txtCollegeEnd.Text = "";
            txtCourse.Text = "";


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
                DataTable _dt = csql.UserCreateUpdate("SmartConcepcion", p_selecteduser, txtEmail.Text, txtFnam.Text, txtMnam.Text, txtLnam.Text, txtSuffix.Text,
                    txtNationality.Text, ddCivilStatus.SelectedValue, txtContact.Text, txtStbldgno.Text, p_BrgyID, Convert.ToInt64(ddZone.SelectedValue), txtVotersID.Text, ddGender.SelectedValue,
                        txtPreschool.Text, convert_date(txtPreFrom.Text), convert_date(txtPreTo.Text), txtElem.Text, convert_date(txtElemStart.Text), convert_date(txtElemEnd.Text),
                            txtHS.Text, convert_date(txtHSStart.Text), convert_date(txtHSStart.Text), txtCollege.Text, convert_date(txtCollegeStart.Text), convert_date(txtCollegeEnd.Text),
                                txtCourse.Text, Convert.ToDateTime(txtBday.Text), p_UserID, chkIndigent.Checked, chkSenir.Checked, chkPwd.Checked, chk4ps.Checked);

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

            //PERSONAL INFORMATION
            txtFnam.Text = _dttemp.Rows[0]["firstname"].ToString();
            txtLnam.Text = _dttemp.Rows[0]["lastname"].ToString();
            txtMnam.Text = _dttemp.Rows[0]["middlename"].ToString();
            txtSuffix.Text = _dttemp.Rows[0]["suffix"].ToString();

            txtBday.Text = Convert.ToDateTime(_dttemp.Rows[0]["birthday"].ToString()).ToString("yyyy-MM-dd");
            txtVotersID.Text = _dttemp.Rows[0]["votersID"].ToString();
            txtNationality.Text = _dttemp.Rows[0]["nationality"].ToString();
            ddCivilStatus.SelectedValue = _dttemp.Rows[0]["civil_status"].ToString();

            //Contact and Address
            txtContact.Text = _dttemp.Rows[0]["contactno"].ToString();
            txtEmail.Text = _dttemp.Rows[0]["email"].ToString();
            
            txtStbldgno.Text = _dttemp.Rows[0]["stbldgno"].ToString();
            ddGender.SelectedValue = _dttemp.Rows[0]["middlename"].ToString();
            ddZone.SelectedValue = _dttemp.Rows[0]["zoneID"].ToString();
            
            //Educational Background
            txtPreschool.Text = _dttemp.Rows[0]["preschool"].ToString();
            txtPreFrom.Text = convert_date(_dttemp.Rows[0]["preschool_start"].ToString(), "yyyy-MM-dd");
            txtPreTo.Text = convert_date(_dttemp.Rows[0]["preschool_end"].ToString(), "yyyy-MM-dd");

            txtElem.Text = _dttemp.Rows[0]["elementary"].ToString();
            txtElemStart.Text = convert_date(_dttemp.Rows[0]["elem_start"].ToString(), "yyyy-MM-dd");
            txtElemEnd.Text = convert_date(_dttemp.Rows[0]["elem_end"].ToString(), "yyyy-MM-dd");

            txtHS.Text = _dttemp.Rows[0]["highschool"].ToString();
            txtHSStart.Text = convert_date(_dttemp.Rows[0]["hs_start"].ToString(), "yyyy-MM-dd");
            txtHSEnd.Text = convert_date(_dttemp.Rows[0]["hs_end"].ToString(), "yyyy-MM-dd");

            txtCollege.Text = _dttemp.Rows[0]["college"].ToString();
            txtCollegeStart.Text = convert_date(_dttemp.Rows[0]["preschool_start"].ToString(), "yyyy-MM-dd");
            txtCollegeEnd.Text = convert_date(_dttemp.Rows[0]["preschool_end"].ToString(), "yyyy-MM-dd");
            txtCourse.Text = _dttemp.Rows[0]["course"].ToString();

            chk4ps.Checked = Convert.ToBoolean(_dttemp.Rows[0]["is4ps"].ToString());
            chkIndigent.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isIndigent"].ToString());
            chkPwd.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isPWD"].ToString());
            chkSenir.Checked = Convert.ToBoolean(_dttemp.Rows[0]["isSeniorCitizen"].ToString());
            lblAccountNo.Text = _dttemp.Rows[0]["ID"].ToString();
            p_selecteduser = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showTab(0);", true);
            upIncidentInfo.Update();
            
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadUserProfile();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            csql.postVerify("SmartConcepcion", p_selecteduser.Value);
            loadUserProfile();
        }

        protected void btnBrgyCert_Click(object sender, EventArgs e)
        {    
            Response.Redirect($"~/Portal/Reports/RptViewer?title=baranggaycert&type=1&id={p_selecteduser.ToString()}");
        }

        protected void brgyIndigency_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Portal/Reports/RptViewer?title=baranggaycert&type=2&id={p_selecteduser.ToString()}&reason={txtReason.Text}");
        }
    }
}