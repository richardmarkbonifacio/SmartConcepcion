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
        public long? p_AnnouncementID
        {
            get
            {
                if(ViewState["AnnouncementID"] != null)
                {
                    return Convert.ToInt64(ViewState["AnnouncementID"].ToString());
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["AnnouncementID"] = value;
            }
        }
        public DataTable p_dtAnnouncement
        {
            get
            {
                if (ViewState["dtAnnouncement"] != null)
                {
                    return ViewState["dtAnnouncement"] as DataTable;
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["dtAnnouncement"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string querystring = Request.QueryString["ID"];

            if (querystring != "")
            {
                if (!IsPostBack)
                {
                    p_AnnouncementID = Convert.ToInt64(querystring);
                    p_dtAnnouncement = csql.getAnnouncementsInfo("SmartConcepcion", p_AnnouncementID.Value);

                    if (p_dtAnnouncement.Rows.Count > 0)
                    {
                        txtTitle.Text = p_dtAnnouncement.Rows[0]["title"].ToString();
                        txtSubtitle.Text = p_dtAnnouncement.Rows[0]["subtitle"].ToString();
                        txtContent.Text = p_dtAnnouncement.Rows[0]["body_content"].ToString();
                    }

                }


            }
            else
            {
                p_AnnouncementID = null;
            }
                
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
                
                string _file_ext = Path.GetExtension(fuBanner.PostedFile.FileName);
                DataTable _dttemp = csql.setAnnouncements("SmartConcepcion",p_AnnouncementID,  txtTitle.Text, txtSubtitle.Text, txtContent.Text,
                    Convert.ToDateTime(txtDate.Text), 0, _file_ext, p_UserID.Value);

                if (fuBanner.HasFile && fuBanner.PostedFile != null)
                {
                    if (p_AnnouncementID != null)
                    {
                        File.Delete(Server.MapPath("Banner//" + p_AnnouncementID.ToString() + p_dtAnnouncement.Rows[0]["banner_extension"].ToString()));
                        fuBanner.SaveAs(Server.MapPath("Banner//" + p_AnnouncementID.ToString() + _file_ext));
                    }
                    else
                    {
                        fuBanner.SaveAs(Server.MapPath("Banner//" + _dttemp.Rows[0]["ID"].ToString() + _file_ext));
                    }
                }
                Response.Redirect("~/Portal/Announcements/News",false);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}