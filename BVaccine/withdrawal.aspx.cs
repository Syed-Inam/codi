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
    public partial class withdrawal : System.Web.UI.Page
    {
        string constr2 = ConfigurationManager.ConnectionStrings["LocalMySql2"].ConnectionString;
        MySqlDataReader dreader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
            }
            else
                Response.Redirect("login.aspx");
            Session["WebForm"] = "Forms";
            CompareDOV1.ValueToCompare = DateTime.Now.ToString("dd-MM-yyyy");
            RangeValidator1.MaximumValue = DateTime.Now.ToString("dd-MM-yyyy");
            string datenow = DateTime.Now.ToString("dd-MM-yyyy");
        }

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }


        public bool FormExist()
        {
            MySqlConnection conn = new MySqlConnection(constr2);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("select * from withdrawal where wfstno='" + txtbxid.Text + "'", conn);
            dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                conn.Close();
                return true;
            }
            conn.Close();
            return false;
        }

        public void insertdata()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr2);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into withdrawal(wfstno, wfst,wfq1, wfq2, wfq3, wfq4, wfq5, wfq6, wfq7, wfq8, wfq8_o, wfsup_cd, wfsup_dt, wfinv_cd, wfinv_dt, user, date_enter)" +
                    "values ('" + txtbxid.Text.ToUpper() + "','" + txtbxst.Text.ToUpper() + "','" + txtbx1.Text.ToUpper() + "', '" + txtbx2.Text.ToUpper() + "', '" + txtbx3.Text.ToUpper() + "', '" + txtbx4.Text + "', " +
                    "'" + txtbx5.Text + "','" + txtbx6.Text + "','" + Rdbtn1.SelectedItem.Value + "','" + rdbtn2.SelectedItem.Value + "','" + txtbx8.Text + "', '" + sup_nm.Text + "', '" + sup_dt.Text + "', " +
                    "'" + inv_nm.Text + "','" + inv_dt.Text + "','" + Convert.ToString(Session["User"]) + "', '" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "')", con);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Form Submitted Successfully!');window.location.href='withdrawal.aspx';", true);
                con.Close();
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtbxid.Text == "codi___-____")
            {
                showalert("Enter sutydy ID");
                txtbxid.Focus();
            }
            else if (txtbx1.Text == "")
            {
                showalert("Enter Date of withdrawal!");
                txtbx1.Focus();
            }
            else if (txtbx2.Text == "")
            {
                showalert("Enter Childs initials");
                txtbx2.Focus();
            }
            else if (txtbx3.Text == "")
            {
                showalert("Enter mothers initials");
                txtbx3.Focus();
            }
            else if (txtbx4.Text == "")
            {
                showalert("Enter Date of birth");
                txtbx4.Focus();
            }
            else if (txtbx5.Text == "")
            {
                showalert("Enter Date of last visit");
                txtbx5.Focus();
            }
            else if (txtbx6.Text == "")
            {
                showalert("Enter name of last visit");
                txtbx6.Focus();
            }
            else if (Rdbtn1.SelectedItem == null)
            {
                showalert("Select Any option");
                Rdbtn1.Focus();
            }
            else if (rdbtn2.SelectedItem == null)
            {
                showalert("Select Any option");
                rdbtn2.Focus();
            }
            else if (rdbtn2.SelectedIndex == 3 && txtbx8.Text == "")
            {
                showalert("Please Specify other");
                txtbx8.Focus();
            }
            else
            {
                if (FormExist() == false)
                {
                    insertdata();
                }
                else
                    showalert("Study ID already exists");
            }
        }

    }
}