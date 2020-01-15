using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Projects
{
    public partial class Projects : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;

        #region Properties
        public long? p_ProjectID
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


        protected void Page_Load(object sender, EventArgs e)
        {
            isAdmin();
            if (!IsPostBack)
                loadProjects();
        }
        void loadProjects()
        {
            DateTime? dtFrom = null, dtTo = null;

            if (txtdtFrom.Text != "")
                dtFrom = Convert.ToDateTime(txtdtFrom.Text);
            if (txtdtTo.Text != "")
                dtTo = Convert.ToDateTime(txtdtTo.Text);

            dttemp = csql.getProjectPaging("SmartConcepcion", gvProjects.PageSize, gvProjects.PageIndex, dtFrom, dtTo, txtProjectname.Text, p_BrgyID);
            gvProjects.PageIndex = p_PageIndex;
            if (dttemp.Rows.Count > 0)
            {
                norecord.Visible = false;
                gvProjects.Visible = true;

                gvProjects.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvProjects, dttemp);
            }
            else
            {
                norecord.Visible = true;
                gvProjects.Visible = false;
            }
            upProject.Update();
            p_dtLeader = initLeaderDatatable();
        }

        void clearProjectInfo()
        {
            p_ProjectID = null;
            txtTitle.Text = "";
            txtDesc.Text = "";
            txtStart.Text = "";
            txtEnd.Text = "";
            
            header.InnerText = "New Project";
            upProjectInfo.Update();
        }
        DataTable initLeaderDatatable()
        {
            dttemp = new DataTable("Leader");
            dttemp.Columns.Add("ID");
            dttemp.Columns.Add("Fullname");
            return dttemp;
        }

        protected void gvProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadProjects();
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
                DataTable _dt = csql.setProject("SmartConcepcion", p_ProjectID, p_BrgyID, txtTitle.Text,txtDesc.Text, "ptd", Convert.ToDecimal(txtBudget.Text),
                    Convert.ToDateTime(txtStart.Text),Convert.ToDateTime(txtEnd.Text),  p_dtLeader, p_UserID.Value);

                loadProjects();
                clearProjectInfo();
            }
            catch (Exception)
            {
                throw;
            }

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getProjectDetails("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            header.InnerText = "Update Project Info";
            txtTitle.Text = _dttemp.Rows[0]["title"].ToString();
            txtDesc.Text = _dttemp.Rows[0]["description"].ToString();
            txtBudget.Text = _dttemp.Rows[0]["title"].ToString();
            p_ProjectID = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            upProjectInfo.Update();
        }

        protected void btnProject_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadProjects();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            csql.postVerify("SmartConcepcion", p_ProjectID.Value);
            loadProjects();
        }

        protected void gvProjectLeader_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

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
            DataRow _dr = p_dtLeader.NewRow();
            _dr["ID"] = _lnk.ToolTip;
            _dr["Fullname"] = _lnk.Text;

            p_dtLeader.Rows.Add(_dr);
            loadGridView(gvProjectLeader, p_dtLeader);
            upProjectInfo.Update();
        }
    }
}