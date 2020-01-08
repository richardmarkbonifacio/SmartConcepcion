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
    public partial class Directory : clsInherited
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
            {
                dttemp = csql.getBusinessType("SmartConcepcion");
                
                loadDropDown(ddFilterBusinessType, dttemp, true);

                loadBusinessProfile();
            }
                
        }
        void loadBusinessProfile()
        {
            long? selected_business_type = null;

            if (ddFilterBusinessType.SelectedValue != "-1")
                selected_business_type = convert_long(ddFilterBusinessType.SelectedValue, false);

            dttemp = csql.getBusinessPaging("SmartConcepcion", gvBusinessProfiles.PageSize, p_PageIndex, txtUserSearch.Text, p_BrgyID, selected_business_type);
            gvBusinessProfiles.PageIndex = p_PageIndex;
            if(dttemp.Rows.Count > 0)
            {
                gvBusinessProfiles.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvBusinessProfiles, dttemp);
                norecord.Visible = false;
                gvBusinessProfiles.Visible = true;
                upBusiness.Update();
            }
            else
            {
                norecord.Visible = true;
                gvBusinessProfiles.Visible = false;
                upBusiness.Update();
            }
            
        }
        
        protected void gvBusinessProfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadBusinessProfile();
                
            }
        }
        
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadBusinessProfile();
        }

    }
}