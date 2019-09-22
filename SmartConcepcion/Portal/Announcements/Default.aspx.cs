using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        #region Properties
        private DataTable p_dtAnnouncement
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
        public int? p_BannerIndex {
            get
            {
                if (ViewState["BannerIndex"] != null)
                {
                    return Convert.ToInt32( ViewState["BannerIndex"]) ;
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["BannerIndex"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            
            long _id = p_UserID;
            if (!IsPostBack)
            {
                p_dtAnnouncement = csql.getAnnouncements("SmartConcepcion", 15, 0);
                loadGridView(gvAnnouncements, p_dtAnnouncement);
            }
            
        }

        protected void gvAnnouncements_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                Image _img = (Image)e.Row.FindControl("imgbanner");
                Panel _panel = (Panel)e.Row.FindControl("panelRow");

                DataView _dv = p_dtAnnouncement.AsDataView();
                _dv.RowFilter = "ID=" + _img.ToolTip;
                DataTable _dttemp = _dv.ToTable();
                _panel.CssClass = "row announcement-row";
                string _filepath = "~\\Portal\\Announcements\\Banner\\" + _dttemp.Rows[0]["ID"].ToString()+ p_dtAnnouncement.Rows[0]["banner_extension"].ToString();

                
                if (System.IO.File.Exists(Server.MapPath(_filepath)))
                    _img.ImageUrl = _filepath;
                else
                    _img.ImageUrl = "https://dummyimage.com/400x400";
                //_img.ImageUrl = 
                
            }
        }
        protected void GetImageData()
        {

        }

        protected void lnkAnnouncement_Click(object sender, EventArgs e)
        {
            LinkButton _lnkbtn = (LinkButton)sender;

            DataView _dv = p_dtAnnouncement.AsDataView();
            _dv.RowFilter = "ID=" + _lnkbtn.ToolTip;
            DataTable _dttemp = _dv.ToTable();

            lblModalTitle.Text = _dttemp.Rows[0]["title"].ToString();
            lblModalBody.Text = _dttemp.Rows[0]["body_content"].ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}