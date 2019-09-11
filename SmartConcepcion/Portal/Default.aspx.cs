using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal
{
    public partial class WebForm1 : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridView(gvAnnouncements,csql.getAnnouncements("SmartConcepcion",10,0));
        }
    }
}