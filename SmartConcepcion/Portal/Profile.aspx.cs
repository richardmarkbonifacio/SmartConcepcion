using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
                
                imgpreview.Attributes["style"] = $"background-image : url({'"'}community/ProfilePicture/{_dt.Rows[0]["id"].ToString()}{_dt.Rows[0]["profile_ext"].ToString()}{'"'})";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if ((txtConfirm.Text != txtNewPassword.Text ) && txtNewPassword.Text != "")
            {
                lblErrorMessage.Text = "Password do not match";
            }
            
            else
            {
                if (fuBanner.HasFile && fuBanner.PostedFile != null && txtNewPassword.Text == "")
                {
                    string _file_ext = Path.GetExtension(fuBanner.PostedFile.FileName);
                    fuBanner.SaveAs(Server.MapPath("Community//ProfilePicture//" + p_UserID.ToString() + _file_ext));
                    csql.setProfileUpdate("SmartConcepcion", p_UserID.Value,_file_ext, txtConfirm.Text);
                }
                else if (!fuBanner.HasFile && fuBanner.PostedFile == null && txtNewPassword.Text == "")
                {
                    csql.setProfileUpdate("SmartConcepcion", p_UserID.Value, "", "");
                }
                else
                {
                    csql.setProfileUpdate("SmartConcepcion", p_UserID.Value, "", txtConfirm.Text);
                }
                loadUserData();
            }
        }
    }
}