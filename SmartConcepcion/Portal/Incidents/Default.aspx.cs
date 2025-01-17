﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Incidents
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        
        #region Properties
        public long? p_IncidentID
        {
            get
            {
                if (ViewState["IncidentID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["IncidentID"].ToString());
                }
            }
            set
            {
                ViewState["IncidentID"] = value;
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
            if (!(isAdmin() || isBlotterOfficer() ))
                Response.Redirect("~/403");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadDropDown(ddStatus, csql.GetStatusList("SmartConcepcion"), true);
                loadIncidentReport();
            }
        }
        void loadIncidentReport()
        {
            DateTime? _dtfrom = null, _dtto = null;
            string status_code = "";

            if (ddStatus.SelectedValue != "-1")
                status_code = ddStatus.SelectedValue;

            if (txtFrom.Text != "")
                _dtfrom = Convert.ToDateTime(txtFrom.Text);

            if (txtFrom.Text != "")
                _dtto = Convert.ToDateTime(txtTo.Text);

            dttemp = csql.getIncidentReport("SmartConcepcion", gvIncidentReport.PageSize, p_PageIndex, _dtfrom, _dtto, txtName.Text, status_code);
            
            if(dttemp.Rows.Count > 0)
            {
                norecord.Visible = false;
                gvIncidentReport.Visible = true;

                gvIncidentReport.PageIndex = p_PageIndex;
                gvIncidentReport.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvIncidentReport, dttemp);
            }
            else
            {
                norecord.Visible = true;
                gvIncidentReport.Visible = false;
            }
            upIncidentReport.Update();

        }
        void clearIncidentInfo()
        {
            p_IncidentID = null;
            p_AccusedID = null;
            p_ComplainantID = null;
            txtTitle.Text = "";
            txtIncidentDate.Text = "";
            txtAccused.Text = "";
            txtComplainant.Text = "";
            txtDetails.Text = "";
            txtConfrontation.Text = "";
            txtRemarks.Text = "";
            txtLocation.Text = "";
            lblPrevDate.Text = "";
            header.InnerText = "Create new Incident";
            upIncidentInfo.Update();
        }
        protected void gvIncidentReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadIncidentReport();
                clearIncidentInfo();
            }
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {
            p_IncidentID = null;
            txtTitle.Text = "";
            txtIncidentDate.Text = "";
            txtAccused.Text = "";
            txtDetails.Text = "";
            header.InnerText = "Create new Incident";
            upIncidentInfo.Update();
        }

        protected void btnPostIR_Click(object sender, EventArgs e)
        {
            DataTable _dttemp = csql.setIncidentReport("SmartConcepcion", p_IncidentID, p_BrgyID,  txtTitle.Text, txtDetails.Text, "", p_ComplainantID, p_AccusedID, 
                txtComplainant.Text, txtAccused.Text,Convert.ToDateTime(txtIncidentDate.Text), Convert.ToDateTime(txtConfrontation.Text),txtLocation.Text,
                txtRemarks.Text,"ptd",p_UserID.Value);

            if(p_IncidentID == null)
                Response.Redirect($"~/Portal/Reports/RptViewer?title=SummonLetter&type=3&id={_dttemp.Rows[0]["ID"].ToString()}");

            loadIncidentReport();
            clearIncidentInfo();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getIncidentReport_Details("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            header.InnerText = "Update Incident";
            txtTitle.Text = _dttemp.Rows[0]["title"].ToString();
            txtLocation.Text = _dttemp.Rows[0]["incident_location"].ToString();
            txtIncidentDate.Text = Convert.ToDateTime(_dttemp.Rows[0]["incidentdate"].ToString()).ToString("yyyy-MM-ddTHH:mm:ss");//.ToLocalTime().ToString("yyyy-MM-ddTHH:mm:ss");
            txtConfrontation.Text = Convert.ToDateTime(_dttemp.Rows[0]["confrontation_date"].ToString()).ToString("yyyy-MM-ddTHH:mm:ss"); //ToLocalTime().ToString("yyyy-MM-ddTHH:mm:ss");
            txtAccused.Text = _dttemp.Rows[0]["accusedName"].ToString();
            txtComplainant.Text = _dttemp.Rows[0]["complainantName"].ToString();
            txtDetails.Text = _dttemp.Rows[0]["incident_details"].ToString();
            txtRemarks.Text = _dttemp.Rows[0]["remarks"].ToString();
            lblPrevDate.Text = "Previous dates: " + _dttemp.Rows[0]["prevdate"].ToString();
            if (_dttemp.Rows[0]["complainantID"].ToString() != "")
                p_ComplainantID = Convert.ToInt64(_dttemp.Rows[0]["complainantID"].ToString());
            else
                p_ComplainantID = null;

            if (_dttemp.Rows[0]["accusedID"].ToString() != "")
                p_AccusedID = Convert.ToInt64(_dttemp.Rows[0]["accusedID"].ToString());
            else
                p_AccusedID = null;

            p_IncidentID = Convert.ToInt64(_dttemp.Rows[0]["ID"].ToString());
            upIncidentInfo.Update();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            dttemp = csql.getUserPaging("SmartConcepcion", 5, 0, txtUserSearch.Text, p_BrgyID,true);
            if(dttemp.Rows.Count >0)
            {
                loadGridView(gvTemplateError, dttemp);
                upNameSuggestion.Update();
            }
        }

        protected void lnkSelectResident_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            
            if(hfFrom.Value == "accsd")
            {
                txtAccused.Text = _lnk.Text;
                p_AccusedID = Convert.ToInt64(_lnk.ToolTip);
            }
            else
            {
                txtComplainant.Text = _lnk.Text;
                p_ComplainantID = Convert.ToInt64(_lnk.ToolTip);
            }
            upIncidentInfo.Update();
        }

        protected void lnkNotAResident_Click(object sender, EventArgs e)
        {
            if (hfFrom.Value == "accsd")
            {
                txtAccused.Text = txtUserSearch.Text;
                p_AccusedID = null;
            }
            else
            {
                txtComplainant.Text = txtUserSearch.Text;
                p_ComplainantID = null;
            }
            upIncidentInfo.Update();
        }

        protected void Filter_Text(object sender, EventArgs e)
        {
            loadIncidentReport();
        }

        protected void btnCaseClose_Click(object sender, EventArgs e)
        {
            csql.SetIncidentClosed("SmartConcepcion", p_IncidentID.Value, p_UserID.Value);

            loadIncidentReport();
            clearIncidentInfo();
        }
    }
}