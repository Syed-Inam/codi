using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVaccine
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "home";

            if (Session["User"] != null)
            {
                //    //Label user = (Label)Master.FindControl("lbl");
                //    //user.Text = Convert.ToString(Session["User"]);
            }
            else
                Response.Redirect("login.aspx");

            if (Convert.ToString(Session["WebForm"]) == "home")
            {
                home.Attributes.Add("class", "active");
                forms.Attributes.Add("class", "");
                Session["WebForm"] = null;
            }
            else if (Convert.ToString(Session["WebForm"]) == "Forms")
            {
                home.Attributes.Add("class", "");
                forms.Attributes.Add("class", "active");
               
                Session["WebForm"] = null;
            }
        }
    }
}