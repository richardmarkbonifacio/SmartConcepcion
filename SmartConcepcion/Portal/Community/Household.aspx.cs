using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Community
{
    public partial class Household : clsInherited
    {
        #region Variables
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        #endregion

        #region Properties
        public long? p_selecteduser
        {
            get
            {
                if (ViewState["selectedHead"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["selectedHead"].ToString());
                }
            }
            set
            {
                ViewState["selectedHead"] = value;
            }
        }

        public DataTable p_selectedmember
        {
            get
            {
                if (ViewState["UserProfileID"] == null)
                {
                    return null;
                }
                else
                {
                    return  ViewState["UserProfileID"] as DataTable;
                }
            }
            set
            {
                ViewState["UserProfileID"] = value;
            }
        }
        #endregion
        //protected void Page_PreInit(object sender, EventArgs e)
        //{
        //    if (!isAdmin())
        //        this.MasterPageFile = "~/Site.master";
        //    else
        //        this.MasterPageFile = "~/Admin.master";
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHousehold();
                p_selectedmember = new DataTable("Selected Member");
                p_selectedmember.Columns.Add("ID");
            }
                
        }

        void LoadHousehold()
        {
            dttemp = csql.getHouseholdPaging("SmartConcepcion", gvHouseholdHead.PageSize, gvHouseholdHead.PageIndex, txtUserSearch.Text, p_BrgyID);
            
            if (dttemp.Rows.Count > 0)
            {
                gvHouseholdHead.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvHouseholdHead, dttemp);
                upHousehold.Update();
            }
        }

        protected void btnSearchHead_Click(object sender, EventArgs e)
        {
            LoadHousehold();
        }

        protected void gvHouseholdHead_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void SelectHead_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton _lnk = (LinkButton)sender;
                p_selecteduser = Convert.ToInt64(_lnk.ToolTip);
                DataTable _dttemp = csql.getHouseholdMember("SmartConcepcion", p_selecteduser, p_BrgyID);
                DataView view = _dttemp.AsDataView();

                loadGridView(gvHouseholdMembers, _dttemp);

                //_dttemp.Reset();
                _dttemp = view.ToTable(true, "ID");
                p_selectedmember = _dttemp;
                upHouseholdInfo.Update();

                txtUserSearch.Text = "";
                LoadSuggestedMember();
                
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {

        }
        protected void lnkSelectResident_Click(object sender, EventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender;
            DataRow _dr;
            if (checkBox.Checked)
            {
                _dr = p_selectedmember.NewRow();
                _dr["ID"] = checkBox.ToolTip;

                p_selectedmember.Rows.Add(_dr);
                
            }
            else
            {
                
                for (int i = p_selectedmember.Rows.Count - 1; i >= 0; i--)
                {
                    _dr = p_selectedmember.Rows[i];
                    if (_dr["ID"].ToString() == checkBox.ToolTip)
                        _dr.Delete();
                }

            }
            p_selectedmember.AcceptChanges();
        }
        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            LoadSuggestedMember();
        }
        void LoadSuggestedMember()
        {
            dttemp = csql.getHouseholdSearchForMember("SmartConcepcion", p_selecteduser.Value, 5, 0, txtMemberSearch.Text, p_BrgyID);
            if (dttemp.Rows.Count > 0)
            {
                loadGridView(gvSearchMember, dttemp);
                gvSearchMember.Visible = true;
            }
            else
            {
                gvSearchMember.Visible = false;
            }
            upNameSuggestion.Update();
        }

        protected void gvSearchMember_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                CheckBox _chk = (CheckBox)e.Row.FindControl("chkResident");
                
                DataView _dv = p_selectedmember.AsDataView();
                _dv.RowFilter = "ID=" + _chk.ToolTip;
                DataTable _dttemp = _dv.ToTable();

                //check user is a member
                if (b_hasrow(_dttemp))
                {
                    _chk.Checked = true;
                }
            }
        }

        protected void btnSaveMember_Click(object sender, EventArgs e)
        {
            try
            {
                csql.setHousehold("SmartConcepcion", p_selecteduser.Value, p_selectedmember, p_UserID.Value);
                DataTable _dttemp = csql.getHouseholdMember("SmartConcepcion", p_selecteduser, p_BrgyID);
                LoadHousehold();
                loadGridView(gvHouseholdMembers, _dttemp);
                upHouseholdInfo.Update();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void btnUpdateRoles_Click(object sender, EventArgs e)
        {
            
            dttemp = new DataTable();
            dttemp.Columns.Add("ID");
            dttemp.Columns.Add("role_code");
            DataRow dr;
            foreach (GridViewRow viewRow in gvHouseholdMembers.Rows)
            {
                dr = dttemp.NewRow();
                dr["ID"] = convert_long( viewRow.Cells[0].Text,false);
                DropDownList _ddl = (DropDownList)viewRow.FindControl("ddHouseholdPos");
                dr["role_code"] = _ddl.SelectedValue;
                dttemp.Rows.Add(dr);
            }
            csql.setHouseholdRoles("SmartConcepcion", dttemp, p_UserID.Value);
        }

        protected void gvHouseholdMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                
                DropDownList _ddl = (DropDownList)e.Row.FindControl("ddHouseholdPos");
                _ddl.SelectedValue = e.Row.Cells[3].Text;
            }
        }
    }
}