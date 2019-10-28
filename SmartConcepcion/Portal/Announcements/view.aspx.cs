using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class view : clsInherited
    {
        public long? p_AnnouncementID
        {
            get
            {
                if (ViewState["AnnouncementID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["AnnouncementID"].ToString());
                }
            }
            set
            {
                ViewState["AnnouncementID"] = value;
            }
        }
        public DataTable p_dtAnnouncementInfo
        {
            get
            {
                if (ViewState["dtAnnouncementInfo"] == null)
                {
                    return null;
                }
                else
                {
                    return (DataTable) ViewState["dtAnnouncementInfo"];
                }
            }
            set
            {
                ViewState["dtAnnouncementInfo"] = value;
            }
        }
        public DataTable p_dtAnnouncementComment
        {
            get
            {
                if (ViewState["dtAnnouncementComment"] == null)
                {
                    return null;
                }
                else
                {
                    return (DataTable)ViewState["dtAnnouncementComment"];
                }
            }
            set
            {
                ViewState["dtAnnouncementComment"] = value;
            }
        }
        private DataTable p_dtTopAnnouncement
        {
            get
            {
                if (ViewState["dtTopAnnouncement"] != null)
                {
                    return ViewState["dtTopAnnouncement"] as DataTable;
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["dtTopAnnouncement"] = value;
            }
        }
        public int p_PageSize
        {
            get
            {
                if (ViewState["PageSize"] != null)
                {
                    return Convert.ToInt32(ViewState["PageSize"]);
                }
                else
                {
                    return 5;
                }
            }
            set
            {
                ViewState["PageSize"] = value;
            }
        }
        public int p_PageIndex
        {
            get
            {
                if (ViewState["PageIndex"] == null)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(ViewState["PageIndex"].ToString());
                }
            }
            set
            {
                ViewState["PageIndex"] = value;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            Page.Title = "Your Title";
            base.OnLoad(e);
        }
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            string _id = Request.QueryString["ID"];
            if (_id == "")
                Response.Redirect("News");

            if (!IsPostBack)
            {
                
                p_AnnouncementID = Convert.ToInt64(_id);
                p_dtAnnouncementInfo = csql.getAnnouncementsInfo("SmartConcepcion", p_AnnouncementID.Value);
                
                p_dtTopAnnouncement = csql.getTopAnnoucements("SmartConcepcion");
                loadGridView(gvTopAnnouncement, p_dtTopAnnouncement);

                loadInfo();
                loadComment();
            }
        }
        void loadInfo()
        {
            txtTitle.InnerText = p_dtAnnouncementInfo.Rows[0]["title"].ToString();
            string _filepath = "~\\Portal\\Announcements\\Banner\\" + p_dtAnnouncementInfo.Rows[0]["ID"].ToString() + p_dtAnnouncementInfo.Rows[0]["banner_extension"].ToString();
            imgBanner.ImageUrl = _filepath;
            lblContent.Text = p_dtAnnouncementInfo.Rows[0]["body_content"].ToString();
        }
        void loadComment()
        {
            p_dtAnnouncementComment = csql.getAnnouncementsComments("SmartConcepcion",p_PageSize,p_PageIndex, p_AnnouncementID.Value);
            loadGridView(gvCommentSection, p_dtAnnouncementComment);
            txtComment.Text = null;
            upCommentSection.Update();
        }
        protected void btnComment_Click(object sender, EventArgs e)
        {
            try
            {
                csql.setAnnouncementsComment("SmartConcepcion", null, p_AnnouncementID.Value, txtComment.Text, p_UserID.Value);
                loadComment();
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            p_PageSize += 5;
            loadComment();
        }
    }
}