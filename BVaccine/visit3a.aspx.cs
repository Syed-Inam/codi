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
    public partial class visit3a : System.Web.UI.Page
    {
        string constr2 = ConfigurationManager.ConnectionStrings["LocalMySql2"].ConnectionString;
        string constr1 = ConfigurationManager.ConnectionStrings["Local"].ConnectionString;
        DateTime expdt = new DateTime();
        string rand;

        MySqlDataReader dreader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
            }
            else
                Response.Redirect("login.aspx");
            //RangeValidator1.MinimumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator2.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            RangeValidator3.MaximumValue = DateTime.Now.ToString("dd/MM/yyyy");
            Session["WebForm"] = "Forms";
            txtStudyID.Focus();
        }


        protected void checkButton_Click(object sender, EventArgs e)
        {
            if (txtStudyID.Text == "" || txtStudyID.Text.Length < 6)
            {
                showalert("Enter complete study ID ");
                txtStudyID.Focus();
            }
            else if (txtDSSID.Text == "" || txtDSSID.Text.Length < 10)
            {
                showalert("Enter DSSID");
                txtDSSID.Focus();
            }
            else
            {
                if (checkEnrollment())
                {
                    if (checkWithdrawal() == false)
                    {
                        if (ChkID() == false)
                        {
                            formPanel.Visible = true;
                            btnchk.Visible = false;
                            txtq1dt.Text = expdt.ToShortDateString();
                            txtStudyID.Attributes.Add("readonly", "readonly");
                            txtq1dt.Attributes.Add("readonly", "readonly");
                            rdobtn.Attributes.Add("readonly", "readonly");
                            txtq2dt.Focus();
                            checkArm();
                        }
                        else
                            showalert("Form already exists");
                    }
                    else
                        showalert("This ID has already withdrawn from the case study.");
                }
                else
                    showalert("Study ID does not exist.");
            }
        }


        public void checkArm()
        {
            switch (rand)
            {
                case "A":
                    rdobtn.SelectedIndex = 0;
                    break;
                case "B":
                    rdobtn.SelectedIndex = 1;
                    break;
                case "C":
                    rdobtn.SelectedIndex = 2;
                    break;
                case "D":
                    rdobtn.SelectedIndex = 3;
                    break;
            }

        }


        public bool checkEnrollment()
        {
            MySqlConnection con = new MySqlConnection(constr1);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * from forms where studyid='" + txtStudyID.Text + "' and dssid='" + txtDSSID.Text + "'", con);
            dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                expdt = Convert.ToDateTime(dreader["nextapp"]);
                rand = Convert.ToString(dreader["rn02"]);
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }


        public bool ChkID()
        {
            MySqlConnection con = new MySqlConnection(constr2);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * from visit3a where studyid='" + txtStudyID.Text + "' and dssid='" + txtDSSID.Text + "'", con);
            dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }


        public bool checkWithdrawal()
        {
            MySqlConnection con = new MySqlConnection(constr2);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select * from withdrawal where wfst='" + txtStudyID.Text + "'", con);
            dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }


        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string visit = "v3";
            string appdt = txtnxtdt.Text + " " + txtnxttm.Text;
            string q9 = Q9.SelectedItem != null ? Q9.SelectedItem.Value : string.Empty;
            string q11 = Q11.SelectedItem != null ? Q11.SelectedItem.Value : string.Empty;
            string q14 = Q14.SelectedItem != null ? Q14.SelectedItem.Value : string.Empty;
            string q15 = Q15.SelectedItem != null ? Q15.SelectedItem.Value : string.Empty;

            DateTime DOV = DateTime.ParseExact(txtq2dt.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
            DateTime today = DateTime.ParseExact(RangeValidator2.MaximumValue, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            if (txtq2dt.Text == "" || (DOV > today))
            {
                showalert("Enter correct Date of Visit!");
                txtq2dt.Focus();
            }

            else if (Q4.SelectedItem == null)
            {
                showalert("Select Any option");
                Q4.Focus();
            }
            else if (Q5.SelectedItem == null)
            {
                showalert("Select Any option");
                Q5.Focus();
            }
            else if (Q5.SelectedIndex == 1 && Q6.SelectedIndex == 0)
            {
                showalert("Cannot Select Yes if the child has never been hospitalized");
                Q6.Focus();
            }
            else if (Q6.SelectedItem == null)
            {
                showalert("Select Any option");
                Q6.Focus();
            }
            else if (Q7.SelectedItem == null)
            {
                showalert("Select Any option");
                Q7.Focus();
            }
            else if (Q8.SelectedItem == null)
            {
                showalert("Select Any option");
                Q8.Focus();
            }
            else if ((Q8.SelectedIndex == 0 || Q8.SelectedIndex == 1) && Q9.SelectedItem == null)
            {
                showalert("Select Any option");
                Q9.Focus();
            }
            else if (Q9.SelectedIndex == 2 && txtq9x.Text == "")
            {
                showalert("Please Specify other");
                txtq9x.Focus();
            }
            else if (Q10.SelectedItem == null)
            {
                showalert("Select Any option");
                Q10.Focus();
            }
            else if (Q10.SelectedIndex == 0 && Q11.SelectedItem == null)
            {
                showalert("Select Any option");
                Q11.Focus();
            }
            else if (Q10.SelectedIndex == 0 && txtq12dt.Text == "")
            {
                showalert("Enter Date of Blood Collection!");
                txtq12dt.Focus();
            }
            else if (Q10.SelectedIndex == 0 && txtq13t.Text == "")
            {
                showalert("Enter Time of collection!");
                txtq13t.Focus();
            }
            else if (Q10.SelectedIndex == 0 && Q14.SelectedItem == null)
            {
                showalert("Select Any option");
                Q14.Focus();
            }
            else if (Q10.SelectedIndex == 0 && Q15.SelectedItem == null)
            {
                showalert("Select Any option");
                Q15.Focus();
            }
            else if (txtnxtdt.Text == "")
            {
                showalert("Enter Next Appointement date");
                txtnxtdt.Focus();
            }
            else if (txtnxttm.Text == "")
            {
                showalert("Enter Appointement Time");
                txtnxttm.Focus();
            }
            else
            {
                try
                {
                    MySqlConnection con = new MySqlConnection(constr2);
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand("insert into visit3a(studyid,dssid, formtype, csv01, csv02, hb01, hb02, hb03,hb04, hb05, hb06, hb0688x, vc01, vc02, vc03, vc04, vc05, vc06, vc07, nextapp, formdate)" +
                        "values ('" + txtStudyID.Text.ToUpper() + "','" + txtDSSID.Text.ToUpper() + "','" + visit + "','" + txtq1dt.Text + "','" + txtq2dt.Text + "','" + Q4.SelectedItem.Value + "', " +
                        "'" + Q5.SelectedItem.Value + "','" + Q6.SelectedItem.Value + "','" + Q7.SelectedItem.Value + "','" + Q8.SelectedItem.Value + "','" + Q9.SelectedItem.Value + "','" + txtq9x.Text.ToUpper() + "','" + Q10.SelectedItem.Value + "', " +
                        "'" + Q11.SelectedItem.Value + "','" + txtq12dt.Text + "','" + txtq13t.Text + "','" + Q14.SelectedItem.Value + "','" + Q15.SelectedItem.Value + "', '" + appdt + "', '" + DateTime.Now.ToString("dd/MM/yyyy hh:mm tt") + "')", con);
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Submitted Successfully!');window.location.href='visit3a.aspx';", true);
                    con.Close();
                }
                catch (Exception ex)
                {
                    showalert(ex.Message);
                }
            }
        }
    }
}