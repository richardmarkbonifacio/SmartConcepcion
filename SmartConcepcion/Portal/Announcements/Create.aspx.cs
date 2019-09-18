using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class Create : System.Web.UI.Page
    {
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
            }
            imgbanner.Attributes["style"] = "background: lightblue url('data:image;base64," + Convert.ToBase64String(imgByte) + "') no-repeat fixed center;background-size:cover; ";
        }
    }
}