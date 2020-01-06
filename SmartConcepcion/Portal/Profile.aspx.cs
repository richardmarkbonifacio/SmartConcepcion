using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal
{
    public partial class Profile : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadUserData();
            }
        }
        void loadUserData()
        {
            DataTable _dt;

            if (p_UserID != null)
            {
                _dt = csql.getUser_Details("SmartConcepcion", p_UserID.Value);
                txtEmail.Text = _dt.Rows[0]["email"].ToString();
            }
        }
    }
}