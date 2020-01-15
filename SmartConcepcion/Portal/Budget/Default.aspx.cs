using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Budget
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;

        #region Properties
        public long? p_BudgetID
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
        public DataTable p_dtLeader
        {
            get
            {
                if (ViewState["dtLeader"] == null)
                {
                    return null;
                }
                else
                {
                    return ViewState["dtLeader"] as DataTable;
                }
            }
            set
            {
                ViewState["dtLeader"] = value;
            }
        }

        #endregion

        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            if (!isAdmin() || !isTreasurer() )
                Response.Redirect("~/403");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
                loadBudget();
        }
        void loadBudget()
        {
            DateTime? dtFrom = null, dtTo = null;

            if (txtdtFrom.Text != "")
                dtFrom = Convert.ToDateTime(txtdtFrom.Text);
            if (txtdtTo.Text != "")
                dtTo = Convert.ToDateTime(txtdtTo.Text);

            dttemp = csql.getBudgetPaging("SmartConcepcion", gvBudget.PageSize, gvBudget.PageIndex, dtFrom, dtTo, txtProjectname.Text, p_BrgyID);
            gvBudget.PageIndex = p_PageIndex;
            if (dttemp.Rows.Count > 0)
            {
                norecord.Visible = false;
                gvBudget.Visible = true;

                gvBudget.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvBudget, dttemp);
                
            }
            else
            {
                norecord.Visible = true;
                gvBudget.Visible = false;
            }
            upProject.Update();
            //p_dtLeader = initLeaderDatatable();
        }

        void clearProjectInfo()
        {
            p_BudgetID = null;
            txtBudget.Text = "";
            txtDesc.Text = "";
            txtRefNo.Text = "";
            //header.InnerText = "Add budget entry";
            
        }
        DataTable initLeaderDatatable()
        {
            dttemp = new DataTable("Leader");
            dttemp.Columns.Add("ID");
            dttemp.Columns.Add("Fullname");
            return dttemp;
        }

        protected void gvBudget_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadBudget();
                clearProjectInfo();
            }
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {
            clearProjectInfo();
        }

        protected void btnPostProject_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable _dt = csql.setBudget("SmartConcepcion", p_BrgyID, txtDesc.Text, chkFlow.Checked, convert_long(txtBudget.Text,true).Value, txtRefNo.Text, p_UserID.Value);

                loadBudget();
                clearProjectInfo();
            }
            catch (Exception)
            {
                throw;
            }

        }
        
        protected void btnBudget_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadBudget();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            csql.postVerify("SmartConcepcion", p_BudgetID.Value);
            loadBudget();
        }

        protected void gvProjectLeader_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        
    }
}