using System;
using System.Collections.Generic;
using System.IO;
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

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //upAnnouncements.Update();
            Byte[] imgByte = null;
            if (fuBanner.HasFile && fuBanner.PostedFile != null)
            {
                HttpPostedFile File = fuBanner.PostedFile;
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);
            }
        }
    }
}