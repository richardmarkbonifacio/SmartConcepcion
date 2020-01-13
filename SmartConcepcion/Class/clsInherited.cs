using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;
using System.Collections.Specialized;
using System.Configuration;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Caching;

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
        public string p_roleLevel
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
                    FormsAuthentication.RedirectToLoginPage();
                    
                }
                return result;

            }
        }
        public long? p_UserID
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
                    return Convert.ToInt64(result);
                }
                else
                {
                    FormsAuthentication.RedirectToLoginPage();
                    return null;
                }
                
            }
        }
        public long p_BrgyID
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
                    return Convert.ToInt32(result);
                }
                else
                {
                    FormsAuthentication.RedirectToLoginPage();
                    return 0;
                }
            }
        }

        public string p_fullname
        {
            get
            {
                JArray jUserData;
                string userdata = "", result = "";
                getTickUserData(ref userdata);

                if (!userdata.Equals(""))
                {
                    jUserData = JArray.Parse(userdata);
                    result = (string)jUserData[1];
                    return result;
                }
                else
                {
                    FormsAuthentication.RedirectToLoginPage();
                    return "";
                }
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
            if (p_roleLevel == "admin")
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
        public void loadCheckboxList(CheckBoxList cbl, DataTable dt)
        {
            try
            {

                cbl.DataSource = dt;
                cbl.DataBind();

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
        public string readCookie(string obj, string name, Boolean crypt)
        {
            string res = null;

            if (Request.Cookies[obj] != null)
            {
                if (Request.Cookies[obj][name] != null)
                {
                    if (crypt)
                    {
                        res = Crypt(Request.Cookies[obj][name]);
                    }
                    else
                        res = Request.Cookies[obj][name];
                }
            }
            return res;
        }

        public void writeCookie(string obj, string value, Boolean crypt)
        {
            if (crypt)
                Response.Cookies[obj].Value = Crypt(value);
            else
                Response.Cookies[obj].Value = value;
        }

        public void writeCookie(string obj, string key, string value, Boolean crypt)
        {
            string _temp = Crypt(value);
            if (crypt)
                Response.Cookies[obj][key] = _temp;
            //Response.Cookies["test"].Value = _temp;
            else
                Response.Cookies[obj][key] = value;
        }

        public void clearCookie(string obj)
        {
            Response.Cookies.Remove(obj);
            Response.Cookies[obj].Expires = DateTime.Now.AddDays(-1);
        }
        public static string Crypt(string input)
        {

            string strTempChar = "", newValue = "";


            for (int i = 0; i < input.Length; i++)
            {

                if (Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) < 128)
                {
                    strTempChar = Convert.ToString(Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) + 128);
                }
                else if (Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) > 128)
                {
                    strTempChar = Convert.ToString(Convert.ToInt32(Convert.ToChar(input.Substring(i, 1))) - 128);
                }
                newValue += Convert.ToChar(Convert.ToInt32(strTempChar)).ToString();

            }
            return newValue;
        }

        public static string GetConfigSetting(string setting)
        {
            Cache cache = HttpContext.Current.Cache;

            if (cache[setting] != null)
                return ((string)cache[setting]);

            NameValueCollection settings = (NameValueCollection)ConfigurationManager.GetSection("appSettings");
            string storedSetting = settings[setting];

            if ((storedSetting != null) && (storedSetting != String.Empty))
            {
                cache.Insert(setting, storedSetting, new CacheDependency(HttpContext.Current.Request.PhysicalApplicationPath.TrimEnd('\\') + "\\Web.config"));
                return (storedSetting);
            }

            return (null);
        }

        public long? convert_long(string val, bool returnZero)
        {
            if (val.Equals(""))
            {
                if (returnZero)
                    return 0;
                else
                    return null;
            }
            else
            {
                try
                {
                    return Convert.ToInt64(val);
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        public DateTime? convert_date(string val)
        {
            if (val.Equals(""))
            {
                    return null;
            }
            else
            {
                try
                {
                    return Convert.ToDateTime(val);
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
        public string convert_date(string val, string format)
        {
            if (val.Equals(""))
            {
                return null;
            }
            else
            {
                try
                {
                    return Convert.ToDateTime(val).ToString(format);
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        public void SendEmail(string mailto, string subject, string body)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential("baliwaginformationsystem@gmail.com", "12QWaszx");
            //smtpClient.UseDefaultCredentials = true;
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage("baliwaginformationsystem@gmail.com",mailto);

            //Setting From , To and CC
            //mail.From = new MailAddress("baliwaginformationsystem@gmail.com", "Baliwag Information System");
            //mail.To.Add(mailto);
            //mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));
            mail.Subject = subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            smtpClient.Send(mail);
        }
    }
}