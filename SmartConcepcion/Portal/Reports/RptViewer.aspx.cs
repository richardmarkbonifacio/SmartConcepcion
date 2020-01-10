using SmartConcepcion.Class;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Report
{
    public partial class RptViewer : clsInherited
    {

        clsQuery csql = new clsQuery();
        DataSet ds = null;
        DataTable dt = null;
        ReportDocument rpt;

        #region "Variables"
        public string startdate { get; set; }
        public string enddate { get; set; }
        public string transdate { get; set; }
        public DataTable dtarea { get; set; }
        public DataTable dtdept {
            get; set;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int type = Convert.ToInt32(Request.QueryString["type"].ToString());
                initialize_report(type);                         
            }
        }

        void initialize_report(int type) {
            string[] rptCred = null;
            System.Data.SqlClient.SqlConnection cn = new System.Data.SqlClient.SqlConnection(
                        ConfigurationManager.ConnectionStrings["SmartConcepcion"].ConnectionString);

            rptCred = GetConfigSetting("rptbackoffice").Split('$');
            long? recid;
            string _title;
            string _reason = "";
            switch (type) {
                
                case 1:
                    #region Barangay Cert
                    recid = convert_long(Request.QueryString["id"], false);
                    _title = Request.QueryString["title"];
                    this.Title = _title;
                    rpt = new ReportDocument();
                    rpt.Load(Server.MapPath("~/portal/Reports/barangayclearance.rpt"));
                    rpt.SetParameterValue("@id", recid);

                    rptCred = GetConfigSetting("rptbackoffice").Split('$');
                    rpt.DataSourceConnections.Clear();
                    rpt.DataSourceConnections[0].SetConnection(cn.DataSource, cn.Database, rptCred[0], rptCred[1]);
                    rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, this.Title + " (" + DateTime.Now.ToString("MM/dd/yy hh:mm tt") + ")");
                    rpt.Close();
                    rpt.Dispose();
                    #endregion

                    break;
                case 2:
                    #region Barangay Indigency
                    recid = convert_long(Request.QueryString["id"], false);

                    _title = Request.QueryString["title"];
                    _reason = Request.QueryString["reason"];
                    this.Title = _title;
                    rpt = new ReportDocument();
                    rpt.Load(Server.MapPath("~/portal/Reports/indigency.rpt"));
                    rpt.SetParameterValue("@id", recid);
                    rpt.SetParameterValue("Reason", _reason);

                    rptCred = GetConfigSetting("rptbackoffice").Split('$');
                    rpt.DataSourceConnections.Clear();
                    rpt.DataSourceConnections[0].SetConnection(cn.DataSource, cn.Database, rptCred[0], rptCred[1]);
                    rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, this.Title + " (" + DateTime.Now.ToString("MM/dd/yy hh:mm tt") + ")");
                    rpt.Close();
                    rpt.Dispose();
                    #endregion

                    break;
                case 3:
                    #region Summon Letter
                    recid = convert_long(Request.QueryString["id"], false);
                    _title = Request.QueryString["title"];
                    this.Title = _title;
                    rpt = new ReportDocument();
                    rpt.Load(Server.MapPath("~/portal/Reports/IRLetterOfInvitation.rpt"));
                    rpt.SetParameterValue("@id", recid);

                    rptCred = GetConfigSetting("rptbackoffice").Split('$');
                    rpt.DataSourceConnections.Clear();
                    rpt.DataSourceConnections[0].SetConnection(cn.DataSource, cn.Database, rptCred[0], rptCred[1]);
                    rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, this.Title + " (" + DateTime.Now.ToString("MM/dd/yy hh:mm tt") + ")");
                    rpt.Close();
                    rpt.Dispose();
                    #endregion

                    break;
            }
        }

        DataTable reNewDt(DataTable dttemp)
        {
            DataTable dtres = dttemp.Copy();

            for (int idx = dtres.Rows.Count - 1; idx < 10; idx++)
            {
                DataRow dr = dtres.NewRow();
                dtres.Rows.Add(dr);
            }

            return dtres;
        }

    }
}