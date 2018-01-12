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
        MySqlDataReader dreader;

        protected void Page_Load(object sender, EventArgs e)
        {
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
                if (ChkID() == false)
                {
                    formPanel.Visible = true;
                    btnchk.Visible = false;
                    txtStudyID.Enabled = false;
                    txtq1dt.Focus();
                    checkArm();
                }
                else
                {
                    showalert("Already Exists");
                }
            }
        }


        public void checkArm()
        {
            string str = txtStudyID.Text;
            string n = str.Substring(0, 2);
            if (n == "14")
            {
                rdobtn.Items.FindByValue("C").Enabled = false;
                rdobtn.Items.FindByValue("D").Enabled = false;
            }
            else if (n == "09")
            {
                rdobtn.Items.FindByValue("A").Enabled = false;
                rdobtn.Items.FindByValue("B").Enabled = false;
            }
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

        public void showalert(string message)
        {
            string script = @"alert('" + message + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", script, true);
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string visit = "v2";
            string appdt = txtnxtdt.Text + txtnxttm.Text;
            
            //else
            //{
            try
            {
                MySqlConnection con = new MySqlConnection(constr2);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("insert into visit3a(studyid,dssid, formtype, csv01, csv02,rn02, hb01, hb02, hb03,hb04, hb05, hb06, hb0688x, vc01, vc02, vc03, vc04, vc05, vc06, vc07, nextapp, formdate)" +
                    "values ('" + txtStudyID.Text.ToUpper() + "','" + txtDSSID.Text.ToUpper() + "','" + visit + "','" + txtq1dt.Text + "','" + txtq2dt.Text + "','" + rdobtn.SelectedItem.Value + "','" + Q4.SelectedItem.Value + "', " +
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
            //}
        }
    }
}