using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Officials
{
    public partial class Official : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataView view;
        DataTable dttemp;
        #region Properties
        public DataTable p_dtOfficial
        {
            get
            {
                return (DataTable)ViewState["dtOfficial"];
            }
            set
            {
                ViewState["dtOfficial"] = value;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                initOfficial();
        }
        void initOfficial()
        {
            p_dtOfficial = csql.getBrgyOfficial("SmartConcepcion", p_BrgyID);
            //CAPTAIN
            view = new DataView();
            view = p_dtOfficial.AsDataView();
            view.RowFilter = "code = 'brgycptn'";
            dttemp = view.ToTable();

            lblCaptain.Text = dttemp.Rows[0]["officialName"].ToString();

            //COUNCILOR
            view = new DataView();
            view = p_dtOfficial.AsDataView();
            view.RowFilter = "code = 'brgycnclr'";
            dttemp = view.ToTable();

            loadListview(lvCouncilor, dttemp);
        }
    }
}