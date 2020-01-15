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
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initData();
            }
        }
        private void initData()
        {
            p_BannerIndex = 0;
            p_dtTopAnnouncement = csql.getTopAnnoucements("SmartConcepcion");
            p_dtAnnouncement = csql.getAnnouncements("SmartConcepcion", p_PageSize, p_PageIndex, p_BrgyID,"","");
            loadGridView(gvAnnouncements, p_dtAnnouncement);
            loadGridView(gvTopAnnouncement, p_dtTopAnnouncement);

            if(p_dtAnnouncement.Rows.Count < gvAnnouncements.PageSize)
            {
                btnNext.Visible = false;
                btnPrev.Visible = false;
                
            }
            else
            {
                btnNext.Visible = true;
                btnPrev.Visible = true;
            }
            upAnnouncements.Update();
        }
        protected void gvAnnouncements_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                Image _img = (Image)e.Row.FindControl("imgbanner");
                Panel _panel = (Panel)e.Row.FindControl("panelRow");
                Panel _panelbg = (Panel)e.Row.FindControl("panelbgContainer");

                DataView _dv = p_dtAnnouncement.AsDataView();
                _dv.RowFilter = "ID=" + _img.ToolTip;
                DataTable _dttemp = _dv.ToTable();
                _panel.CssClass = "container-fluid announcement-row";
                _panelbg.CssClass = "annoucement-pinned";
                string _filepath = "~\\Portal\\Announcements\\Banner\\" + _dttemp.Rows[0]["ID"].ToString() + _dttemp.Rows[0]["banner_extension"].ToString();


                if (System.IO.File.Exists(Server.MapPath(_filepath)))
                    _panelbg.BackImageUrl = _filepath;
                else
                    _panelbg.BackImageUrl = "https://dummyimage.com/400x400";
                //_img.ImageUrl = 

            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (p_PageIndex != 0)
            {
                p_PageIndex--;
                initData();
            }
                
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            p_PageIndex++;
            initData();
        }
    }
}