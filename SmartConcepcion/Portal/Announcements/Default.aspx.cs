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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            p_dtAnnouncement = csql.getAnnouncements("SmartConcepcion", 1, 0);
            loadGridView(gvAnnouncements, p_dtAnnouncement);
        }

        protected void gvAnnouncements_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                Image _img = (Image)e.Row.FindControl("imgbanner");
                //Byte[] imgbyte = (Byte[])p_dtAnnouncement.Rows[0]["banner_file"];
                _img.ImageUrl = "~\\Portal\\Announcements\\Banner\\"+ p_dtAnnouncement.Rows[0]["ID"].ToString() + p_dtAnnouncement.Rows[0]["banner_extension"].ToString();
            }
        }
        protected void GetImageData()
        {

        }
    }
}