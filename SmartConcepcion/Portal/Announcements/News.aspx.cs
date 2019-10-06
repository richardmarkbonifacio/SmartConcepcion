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
    public partial class News : clsInherited
    {
        clsQuery csql = new clsQuery();
        #region Properties
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
        public int? p_BannerIndex
        {
            get
            {
                if (ViewState["BannerIndex"] != null)
                {
                    return Convert.ToInt32(ViewState["BannerIndex"]);
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
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!isAdmin())
            {
                //btnOpenAnnouncementDlg.Attributes["disabled"] = "disabled";
            }
            if (!IsPostBack)
            {
                initData();
            }
        }
        private void initData()
        {
            p_BannerIndex = 0;//reset even after postbacks
            p_dtTopAnnouncement = csql.getTopAnnoucements("SmartConcepcion");
            p_dtAnnouncement = csql.getAnnouncements("SmartConcepcion", p_PageSize, 0);
            loadGridView(gvAnnouncements, p_dtAnnouncement);
            upAnnouncements.Update();
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
                _panel.CssClass = "container-fluid announcement-row";
                string _filepath = "~\\Portal\\Announcements\\Banner\\" + _dttemp.Rows[0]["ID"].ToString() + p_dtAnnouncement.Rows[0]["banner_extension"].ToString();


                if (System.IO.File.Exists(Server.MapPath(_filepath)))
                    _img.ImageUrl = _filepath;
                else
                    _img.ImageUrl = "https://dummyimage.com/400x400";
                //_img.ImageUrl = 

            }
        }

    }
}