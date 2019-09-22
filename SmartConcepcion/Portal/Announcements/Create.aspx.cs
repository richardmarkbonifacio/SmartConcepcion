using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class Create : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Byte[] imgByte = null;
            if (fuBanner.HasFile && fuBanner.PostedFile != null)
            {
                HttpPostedFile File = fuBanner.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);
                //imgbanner.Attributes["style"] = "background: lightblue url('data:image;base64," + Convert.ToBase64String(imgByte) + "') no-repeat fixed center;background-size:cover; ";
            }
            
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                Byte[] imgByte = null;

                
                    //HttpPostedFile File = fuBanner.PostedFile;
                    //imgByte = new Byte[File.ContentLength];
                    //File.InputStream.Read(imgByte, 0, File.ContentLength);
                    string _file_ext = Path.GetExtension(fuBanner.PostedFile.FileName);
                    DataTable _dttemp = csql.setAnnouncements("SmartConcepcion", txtTitle.Text, txtSubtitle.Text, txtContent.Text,
                        Convert.ToDateTime(txtDate.Text), 0, _file_ext, p_UserID);

                if (fuBanner.HasFile && fuBanner.PostedFile != null)
                {
                    fuBanner.SaveAs(Server.MapPath("Banner//" + _dttemp.Rows[0]["ID"].ToString() + _file_ext ));
                }
                Response.Redirect("");
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}