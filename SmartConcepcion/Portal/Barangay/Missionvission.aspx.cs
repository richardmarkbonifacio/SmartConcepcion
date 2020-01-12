using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Barangay
{
    public partial class Missionvission : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable _dt = csql.getBrgyInformation("SmartConcepcion",p_BrgyID);
            mission.Text = _dt.Rows[0]["mission"].ToString();
            vision.Text = _dt.Rows[0]["vision"].ToString();
        }
    }
}