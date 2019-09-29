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
                    return 2;
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
                btnOpenAnnouncementDlg.Attributes["disabled"] = "disabled";
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
            loadListview(lvAnnouncement, p_dtTopAnnouncement);
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
                string _filepath = "~\\Portal\\Announcements\\Banner\\" + _dttemp.Rows[0]["ID"].ToString()+ p_dtAnnouncement.Rows[0]["banner_extension"].ToString();

                
                if (System.IO.File.Exists(Server.MapPath(_filepath)))
                    _img.ImageUrl = _filepath;
                else
                    _img.ImageUrl = "https://dummyimage.com/400x400";
                //_img.ImageUrl = 
                
            }
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
                    fuBanner.SaveAs(Server.MapPath("Banner//" + _dttemp.Rows[0]["ID"].ToString() + _file_ext));
                }
                initData();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void lvAnnouncement_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Image _img = (Image)e.Item.FindControl("imgbanner");
            Panel _panelbg = (Panel)e.Item.FindControl("panelbgContainer");
            Panel _panelitem = (Panel)e.Item.FindControl("panelItem");

            DataView _dv = p_dtTopAnnouncement.AsDataView();
            _dv.RowFilter = "ID=" + _img.ToolTip;
            DataTable _dttemp = _dv.ToTable();

            switch (p_BannerIndex)
            {
                case 0:
                    _panelitem.CssClass = "col-md-6 col-ms-12 pinned-container-one";
                    _panelbg.CssClass = "annoucement-pinned top-one";
                    break;
                case 1:
                    _panelitem.CssClass = "col-md-3 col-ms-12 pinned-container-two";
                    _panelbg.CssClass = "annoucement-pinned top-two";
                    break;
                case 2:
                    _panelitem.CssClass = "col-md-3 col-ms-12 pinned-container-two";
                    _panelbg.CssClass = "annoucement-pinned top-two";
                    break;
                case 3:
                    _panelitem.CssClass = "col-md-6 col-ms-12 pinned-container-three";
                    _panelbg.CssClass = "annoucement-pinned top-two";
                    break;
                default:
                    _panelitem.CssClass = "col-md-3 col-ms-12 pinned-container-four";
                    _panelbg.CssClass = "annoucement-pinned top-two";
                    break;
            }

            p_BannerIndex++;
            string _filepath = "~\\Portal\\Announcements\\Banner\\" + _dttemp.Rows[0]["ID"].ToString() + _dttemp.Rows[0]["banner_extension"].ToString();

            if (System.IO.File.Exists(Server.MapPath(_filepath)))
                _panelbg.BackImageUrl = _filepath;
            //_panelbg.Attributes["style"] = "background:linear-gradient(0deg,rgba(255,0,150,0.3),rgba(255,0,150,0.3)),url(" + _filepath + ")";
            else
                _panelbg.BackImageUrl = "https://dummyimage.com/400x300";
                //_img.ImageUrl = 

        }

        protected void LoadMore_Click(object sender, EventArgs e)
        {
            p_PageSize = p_PageSize * 2;
            initData();
        }
    }
}