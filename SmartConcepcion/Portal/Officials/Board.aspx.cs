using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Officials
{
    public partial class Board : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            dttemp = csql.getUserPaging("SmartConcepcion", 5, 0, txtUserSearch.Text, p_BrgyID);
            if (dttemp.Rows.Count > 0)
            {
                loadGridView(gvTemplateError, dttemp);
                upNameSuggestion.Update();
            }
        }
        protected void lnkSelectResident_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;

            if (hfFrom.Value == "accsd")
            {
                //txtAccused.Text = _lnk.Text;
                //p_AccusedID = Convert.ToInt64(_lnk.ToolTip);
            }
            else
            {
                //txtComplainant.Text = _lnk.Text;
                //p_ComplainantID = Convert.ToInt64(_lnk.ToolTip);
            }
            upBoard.Update();
        }

        protected void lnkNotAResident_Click(object sender, EventArgs e)
        {


            if (hfFrom.Value == "accsd")
            {
                //txtAccused.Text = txtUserSearch.Text;
                //p_AccusedID = null;
            }
            else
            {
                //txtComplainant.Text = txtUserSearch.Text;
                //p_ComplainantID = null;
            }
            upBoard.Update();
        }
    }
}