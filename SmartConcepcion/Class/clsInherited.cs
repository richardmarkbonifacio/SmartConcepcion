using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;

namespace SmartConcepcion.Class
{
    public class clsInherited : Page
    {
        public void getTickUserData(ref string res)
        {
            try
            {
                string s = Context.Request.Cookies[FormsAuthentication.FormsCookieName].Value;

                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(s);

                string cookiePath = ticket.CookiePath;
                DateTime expiration = ticket.Expiration;
                bool expired = ticket.Expired;
                bool isPersistent = ticket.IsPersistent;
                DateTime issueDate = ticket.IssueDate;

                string name = ticket.Name;
                string userData = ticket.UserData;
                int version = ticket.Version;
                res = userData;
            }
            catch (Exception ex)
            {
                res = "";
            }
        }
    }
}