using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion
{
    public partial class SiteMaster : MasterPage
    {
        clsInherited cInh = new clsInherited();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignOut(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();

        }
    }
}