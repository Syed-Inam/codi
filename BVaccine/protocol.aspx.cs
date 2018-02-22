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
    public partial class protocol : System.Web.UI.Page
    {
        string constr2 = ConfigurationManager.ConnectionStrings["LocalMySql2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "Forms";
            if (Session["User"] != null)
            {
            }
            else
                Response.Redirect("login.aspx");
            RangeValidator1.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator2.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator3.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator4.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator5.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            string datenow = DateTime.Now.ToString("dd/MM/yyyy");
        }


        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }


        public bool FormExist()
        {
            bool exist = false;
            MySqlConnection con = new MySqlConnection(constr2);
            MySqlCommand cmd = new MySqlCommand("select * from Protocol where pds='" + txtbx1.Text + "' and pdst='" + txtbx2.Text + "' ", con);
            con.Open();
            try
            {
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read() == true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist!');window.location.href='protocol.aspx';", true);
                    exist = true;
                }
            }
            finally
            {
                con.Close();
            }
            return exist;
        }

        public void insertdata()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr2);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into Protocol(pds,pdst, pda, pdb, pdca, pdcb, pdcc, pdcd, pdce, pdda, pddb, pddc, pddd, pdde, pde, pdf, pdirb_iec1, pdirb_iec2, pdirb_iec3, pdirb_iec4, pdga, pdgb, pdgc, pdgd, pdge, pdinv_cd, pdinv_dt, pdsi, pdsi_dt, pdsp, pdsp_dt, pdirb, pdirb_dt, user, date_enter)" +
                    "values ('" + txtbx1.Text.ToUpper() + "','" + txtbx2.Text.ToUpper() + "', '" + txtbx2cd.Text.ToUpper() + "', '" + txtbx3.Text + "', '" + txtbx4_1.Text + "', '" + txtbx4_2.Text + "', '" + txtbx4_3.Text + "', '" + txtbx4_4.Text + "', '" + txtbx4_5.Text + "','" + txtbx5_1.Text + "','" + txtbx5_2.Text + "','" + txtbx5_3.Text + "','" + txtbx5_4.Text + "','" + txtbx5_5.Text + "', " +
                    "'" + Rdbtn1.SelectedItem.Value + "','" + Rdbtn2.SelectedItem.Value + "','" + Convert.ToInt32(chkbx.Items[0].Selected) + "','" + Convert.ToInt32(chkbx.Items[1].Selected) + "','" + Convert.ToInt32(chkbx.Items[2].Selected) + "','" + Convert.ToInt32(chkbx.Items[3].Selected) + "', '" + txtbx6_1.Text + "', '" + txtbx6_2.Text + "', '" + txtbx6_3.Text + "', '" + txtbx6_4.Text + "'," +
                    "'" + txtbx6_5.Text + "','" + txtbx7.Text + "','" + txtbx7dt.Text + "','" + txtbx8.Text + "','" + txtbx8dt.Text + "','" + Convert.ToInt32(CheckBox1.Checked) + "','" + txtbxdt1.Text + "','" + Convert.ToInt32(CheckBox2.Checked) + "','" + txtbxdt2.Text + "','" + Convert.ToString(Session["User"]) + "', '" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "' )", con);               
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Submitted Successfully!');window.location.href='protocol.aspx';", true);
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
                showalert("Enter Study site");
                txtbx1.Focus();
            }
            else if (txtbx2.Text == "codi___-____")
            {
                showalert("Enter Participant ID!");
                txtbx2.Focus();
            }
            else if (txtbx2cd.Text == "")
            {
                showalert("Enter Participant initials!");
                txtbx2cd.Focus();
            }
            else if (txtbx3.Text == "")
            {
                showalert("Enter Date of protocol deviation!");
                txtbx3.Focus();
            }
            else if (txtbx4_1.Text == "")
            {
                showalert("Enter description of deviation!");
                txtbx4_1.Focus();
            }
            else if (txtbx5_1.Text == "")
            {
                showalert("Enter reason for deviation!");
                txtbx5_1.Focus();
            }
            else if (Rdbtn1.SelectedItem == null)
            {
                showalert("Select Any option");
                Rdbtn1.Focus();
            }
            else if (Rdbtn2.SelectedItem == null)
            {
                showalert("Select Any option");
                Rdbtn2.Focus();
            }
            else if (chkbx.SelectedItem == null)
            {
                showalert("Select atleast one option");
                Rdbtn2.Focus();
            }
            else if (txtbx6_1.Text == "")
            {
                showalert("Enter steps to resolve deviation!");
                txtbx6_1.Focus();
            }

            else
            {
                if (FormExist() == false)
                {
                    insertdata();
                }
                else
                    showalert("Study ID already deviated from protocol");
            }

        }

    }
}