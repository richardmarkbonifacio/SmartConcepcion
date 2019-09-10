using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion
{   
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn(object sender, EventArgs e)
        {
            DataTable _dt = csql.postSignIn("SmartConcepcion", Convert.ToInt64(txtUserid.Text), txtUserpass.Text);
            if(_dt.Rows.Count > 0)
            {
                if(Convert.ToBoolean(_dt.Rows[0]["verified"].ToString()))
                {

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
                "", txtContact.Text, txtRUserpass.Text,0, Convert.ToDateTime(txtBday.Text));
        }
    }
}