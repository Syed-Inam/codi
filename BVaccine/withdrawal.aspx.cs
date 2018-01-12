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

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "Forms";
            CompareDOV1.ValueToCompare = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator1.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            string datenow = DateTime.Now.ToString("dd/MM/yyyy");
        }

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }


        public void insertdata()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr2);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into withdrawal(wfst,wfq1, wfq2, wfq3, wfq4, wfq5, wfq6, wfq7, wfq8, wfsup_cd, wfsup_dt, wfinv_cd, wfinv_dt)" +
                    "values ('" + txtbxid.Text.ToUpper() + "','" + txtbx1.Text.ToUpper() + "', '" + txtbx2.Text.ToUpper() + "', '" + txtbx3.Text + "', '" + txtbx4.Text + "','" + txtbx5.Text + "','" + txtbx6.Text + "', " +
                    "'" + Rdbtn1.SelectedItem.Value + "','" + rdbtn2.SelectedItem.Value + "', '" + sup_nm.Text + "', '" + sup_dt.Text + "','" + inv_nm.Text + "','" + inv_dt.Text + "')", con);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Submitted Successfully!');window.location.href='withdrawal.aspx';", true);
                con.Close();
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtbx1.Text == "")
            {
                showalert("Enter Study ID!");
                txtbx1.Focus();
            }
            //else if (txtbx2.Text == "")
            //{
            //    showalert("Enter Participant initials!");
            //    txtbx2.Focus();
            //}
                insertdata();
            //else
            //{
            //    if (FormExist() == false)
            //    {
            //        insertdata();
            //    }
            //    txtbx1.Focus();
            //}
        }

    }
}