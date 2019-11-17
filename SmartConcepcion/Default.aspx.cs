using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using SmartConcepcion.Class;

namespace SmartConcepcion
{   
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDropDown(ddBrgy, csql.getBrgyList("SmartConcepcion"), false);
        }

        protected void btnSignIn(object sender, EventArgs e)
        {
            DataTable _dt = csql.postSignIn("SmartConcepcion", Convert.ToInt64(txtUserid.Text), txtUserpass.Text);
            if(_dt.Rows.Count > 0)
            {
                if(Convert.ToBoolean(_dt.Rows[0]["verified"].ToString()))
                {
                    string[] userdata;

                    string userName = (string)_dt.Rows[0]["fullname"];
                    string email = (string)_dt.Rows[0]["email"];
                    string brgyid = (string)_dt.Rows[0]["brgyid"].ToString();
                    string roleID = (string)_dt.Rows[0]["roleID"].ToString();
                    string firstname = (string)_dt.Rows[0]["firstname"].ToString();
                    userdata = new string[] { txtUserid.Text, userName, email, brgyid, roleID, firstname };
                    

                    FormsAuthenticationTicket fTicket = new FormsAuthenticationTicket(1, userName,
                        DateTime.Now, DateTime.Now.AddMinutes(10), RememberMe.Checked, JsonConvert.SerializeObject(userdata),
                        FormsAuthentication.FormsCookiePath); //new ticket

                    string encTicket = FormsAuthentication.Encrypt(fTicket);

                    // write ticket to cookie collection
                    Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket)); //new login

                    if (Request.QueryString["ReturnUrl"] == null)
                    {
                        Response.Redirect("~/Portal/");
                    }
                    else
                    {
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(userName, RememberMe.Checked));
                        //RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                }
                else
                {
                    lblErr.Text = "Account not yet verified, Ask for assistance";
                }
            }
            else
            {
                lblErr.Text = "Account not recognized";
            }
        }

        protected void btnSignUp(object sender, EventArgs e)
        {
            DataTable _dt = csql.postSignUp("SmartConcepcion", txtEmail.Text, txtFnam.Text, txtMnam.Text, txtLnam.Text,
                "", txtContact.Text, txtRUserpass.Text,Convert.ToInt64(ddBrgy.SelectedValue), Convert.ToDateTime(txtBday.Text));
        }
    }
}