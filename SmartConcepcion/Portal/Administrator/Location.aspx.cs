using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Administrator
{
    public partial class Location : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDropDown(ddBrgy, csql.getBrgyList("SmartConcepcion"), true);
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            switch (hfMode.Value)
            {
                case "brgy":
                    csql.setLocationData("SmartConcepcion", null, txtDescrition.Text, hfMode.Value, p_UserID.Value);
                    
                    break;
                case "zone":
                    csql.setLocationData("SmartConcepcion", Convert.ToInt64(ddBrgy.SelectedValue), txtDescrition.Text, hfMode.Value, p_UserID.Value);
                    break;
                default:
                    break;
            }

            loadDropDown(ddBrgy, csql.getBrgyList("SmartConcepcion"), true);
            upLocation.Update();

            txtDescrition.Text = null;
            upHealtRecord.Update();

        }
        protected void ddBrgy_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDropDown(ddZone, csql.getBrgyZone("SmartConcepcion", Convert.ToInt64(ddBrgy.SelectedValue)), false);
            upLocation.Update();
        }
    }
}