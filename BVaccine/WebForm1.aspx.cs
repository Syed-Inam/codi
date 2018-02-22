using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Globalization;
using System.Configuration;

namespace BVaccine
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string constr2 = ConfigurationManager.ConnectionStrings["LocalMySql2"].ConnectionString;
        string constr1 = ConfigurationManager.ConnectionStrings["Local"].ConnectionString;

        MySqlDataReader dreader;

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
        }


        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }


        protected void submitbtn_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection(constr1);
            conn.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("update visits set visitdt='" + datepicker.Text + "' where studyid='" + txtStudyID.Text + "' and vround=4 ", conn);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Form Updated Successfully!');window.location.href='WebForm1.aspx';", true);
                conn.Close();
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void findbtn_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(constr1);
            con.Open();
            try
            {
                MySqlCommand cmd = new MySqlCommand("select * from visits where studyid='" + txtStudyID.Text + "' and vround=4 ", con);
                dreader = cmd.ExecuteReader();
                if (dreader.Read())
                {
                    string visitDt = Convert.ToString(dreader["visitdt"]);
                    datepicker.Visible = true;
                    datepicker.Text = visitDt;
                    
                    submitbtn.Visible = true;
                    findbtn.Visible = false;
                }
                else
                {
                    showalert("Record does not exist.");
                }
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}