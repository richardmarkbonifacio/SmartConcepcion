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
        public DataSet p_dsOfficial
        {
            get
            {
                return (DataSet)ViewState["dsOfficial"];
            }
            set
            {
                ViewState["dsOfficial"] = value;
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
            p_dsOfficial = csql.getBrgyOfficial("SmartConcepcion", p_BrgyID);
            lblCaptain.Text = p_dsOfficial.Tables["dtCapt"].Rows[0]["officialName"].ToString();
            imgcaptain.Src = $"../community/ProfilePicture/{p_dsOfficial.Tables["dtCapt"].Rows[0]["userID"].ToString()}{p_dsOfficial.Tables["dtCapt"].Rows[0]["profile_ext"].ToString()}{'"'}";
            loadListview(lvCouncilor, p_dsOfficial.Tables["dtCouncilor"]);
        }
    }
}