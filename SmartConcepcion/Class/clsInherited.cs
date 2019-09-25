using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;

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
        #region Properties
        public Int32? p_roleLevel
        {
            get
            {
                JArray jUserData;
                string userdata = "", result = "";
                getTickUserData(ref userdata);

                if (!userdata.Equals(""))
                {
                    jUserData = JArray.Parse(userdata);
                    result = (string)jUserData[4];
                }
                else
                {
                    Response.Redirect("~/?ReturnURL=" + HttpUtility.UrlEncode(Request.RawUrl));
                }
                return Convert.ToInt32(result);
            }
        }
        public long p_UserID
        {
            get
            {
                JArray jUserData;
                string userdata = "", result = "";
                getTickUserData(ref userdata);

                if (!userdata.Equals(""))
                {
                    jUserData = JArray.Parse(userdata);
                    result = (string)jUserData[0];
                }
                else
                {
                    Response.Redirect("~/?ReturnURL=" +HttpUtility.UrlEncode(Request.RawUrl));
                }
                return Convert.ToInt64( result);
            }
        }
        public string p_BrgyID
        {
            get
            {
                JArray jUserData;
                string userdata = "", result = "";
                getTickUserData(ref userdata);

                if (!userdata.Equals(""))
                {
                    jUserData = JArray.Parse(userdata);
                    result = (string)jUserData[3];
                }
                return result;
            }
        }
        
        #endregion

        public bool b_hasrow(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public bool isAdmin()
        {
            if (p_roleLevel == 0)
                return true;
            else
                return false;
        }
        public void loadDropDown(DropDownList ddl, DataTable dt, bool hasPrefixValue)
        {
            int temp_selindx = ddl.SelectedIndex;
            ddl.SelectedIndex = -1;

            ddl.Items.Clear();

            if (b_hasrow(dt))
            {
                ddl.DataSource = dt;
                ddl.DataBind();
            }

            if (hasPrefixValue)
            {
                ddl.Items.Insert(0, new ListItem("-Select one-", "-1"));
                ddl.Items.Insert(1, new ListItem("N/A", "-2"));
            }

            try
            {
                ddl.SelectedIndex = temp_selindx;
            }
            catch (Exception)
            {

            }
        }

        public void loadGridView(GridView gv, DataTable dt)
        {
            try
            {

                gv.DataSource = dt;
                gv.DataBind();

            }

            catch (Exception e)
            {
                throw e;
            }
        }
        public void loadListview(ListView lv, DataTable dt)
        {
            try
            {

                lv.DataSource = dt;
                lv.DataBind();

            }

            catch (Exception e)
            {
                throw e;
            }
        }

    }
}