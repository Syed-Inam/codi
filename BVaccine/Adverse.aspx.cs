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
    public partial class Adverse : System.Web.UI.Page
    {
        string constr2 = ConfigurationManager.ConnectionStrings["LocalMySql2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "Forms";
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
            MySqlCommand cmd = new MySqlCommand("select * from adverse where aess='" + aess.Text + "' and aepid='" + aepid.Text + "' ", con);
            con.Open();
            try
            {
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read() == true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist!');window.location.href='Adverse.aspx';", true);
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
                MySqlCommand cmd = new MySqlCommand("insert into adverse(aess,aepid, aepin, aedob, aes_inv_cd,aes_inv_dt, aes_inv_nt, aec_inv_cd, aec_inv_dt,aec_inv_nt, aes1_a, aes1_b, aes1_c, aes1_d, aes1_e, aes1_f, aes1_g, aes1_h,aes1_ho, aes1_i,aes1_io, aes1_j," +
                    " aes2_a, aes2_b, aes2_c, aes2_d, aes2_e, aes2_f, aes2_g, aes2_h, aes2_ho, aes2_i, aes2_io, aes2_j, aes3_a, aes3_b, aes3_c, aes3_d, aes3_e, aes3_f, aes3_g, aes3_h, aes3_ho, aes3_i, aes3_io, aes3_j, aes4_a, aes4_b, aes4_c, aes4_d, aes4_e, aes4_f, aes4_g, aes4_h, aes4_ho, aes4_i, aes4_io, aes4_j) " +
                    "values ('" + aess.Text.ToUpper() + "','" + aepid.Text.ToUpper() + "','" + aepin.Text.ToUpper() + "','" + aedob.Text + "','" + aes_inv_cd.Text + "','" + aes_inv_dt.Text + "','" + aes_inv_nt.Text + "','" + aec_inv_cd.Text + "','" + aec_inv_dt.Text + "','" + aec_inv_nt.Text + "', " +
                    " '" + aes1_a.Text + "', '" + aes1_b.Text + "', '" + aes1_c.Text + "', '" + aes1_d.Text + "', '" + aes1_e.Text + "', '" + aes1_f.Text + "', '" + aes1_g.Text + "', '" + aes1_h.Text + "', '" + aes1_ho.Text + "', '" + aes1_i.Text + "', '" + aes1_io.Text + "', '" + aes1_j.Text + "', " +
                    " '" + aes2_a.Text + "', '" + aes2_b.Text + "', '" + aes2_c.Text + "', '" + aes2_d.Text + "', '" + aes2_e.Text + "', '" + aes2_f.Text + "', '" + aes2_g.Text + "', '" + aes2_h.Text + "', '" + aes2_ho.Text + "', '" + aes2_i.Text + "', '" + aes2_io.Text + "', '" + aes2_j.Text + "', " +
                    " '" + aes3_a.Text + "', '" + aes3_b.Text + "', '" + aes3_c.Text + "', '" + aes3_d.Text + "', '" + aes3_e.Text + "', '" + aes3_f.Text + "', '" + aes3_g.Text + "', '" + aes3_h.Text + "', '" + aes3_ho.Text + "', '" + aes3_i.Text + "', '" + aes3_io.Text + "', '" + aes3_j.Text + "', " +
                    " '" + aes4_a.Text + "', '" + aes4_b.Text + "', '" + aes4_c.Text + "', '" + aes4_d.Text + "', '" + aes4_e.Text + "', '" + aes4_f.Text + "', '" + aes4_g.Text + "', '" + aes4_h.Text + "', '" + aes4_ho.Text + "', '" + aes4_i.Text + "', '" + aes4_io.Text + "', '" + aes4_j.Text + "')", con);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Submitted Successfully!');window.location.href='Adverse.aspx';", true);
                con.Close();
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (aess.Text == "")
            {
                showalert("Enter Study site!");
                aess.Focus();
            }
            else if (aepid.Text == "")
            {
                showalert("Enter Participant ID!");
                aepid.Focus();
            }
            if (aepin.Text == "")
            {
                showalert("Enter Participant Initials!");
                aess.Focus();
            }
            else if (aedob.Text == "")
            {
                showalert("Enter Date of birth!");
                aepid.Focus();
            }

            //else if (txtq4.Text == "" || !(txtq4.Text == "1" || txtq4.Text == "2"))
            //{
            //    showalert("Enter Value!");
            //    txtq4.Text = "";
            //    txtq4.Focus();
            //}
            //else if (txtq5.Text == "" || !(txtq5.Text == "1" || txtq5.Text == "2"))
            //{
            //    showalert("Enter Value where 1 or 2 only!");
            //    txtq5.Text = "";
            //    txtq5.Focus();
            //}
            //else if (txtq5.Text == "1" && (txtq6.Text == "" || !(txtq6.Text == "1" || txtq6.Text == "2")))
            //{
            //    showalert("Enter Value where 1 or 2 only!");
            //    txtq6.Text = "";
            //    txtq6.Focus();
            //}
            //else if (txtq7.Text == "" || !(txtq7.Text == "1" || txtq7.Text == "2"))
            //{
            //    showalert("Enter Value where 1 or 2 only!");
            //    txtq7.Text = "";
            //    txtq7.Focus();
            //}
            //else if (txtq8.Text == "" || !(txtq8.Text == "1" || txtq8.Text == "2" || txtq8.Text == "3"))
            //{
            //    showalert("Enter Value where 1 or 2 or 3 only!");
            //    txtq8.Text = "";
            //    txtq8.Focus();
            //}
            //else if (txtq8.Text != "3" && (txtq9.Text == "" || !(txtq9.Text == "1" || txtq9.Text == "2" || txtq9.Text == "3")))
            //{
            //    showalert("Enter Value where 1 or 2 or 3 only!");
            //    txtq9.Text = "";
            //    txtq9.Focus();
            //}
            //else if (txtq9.Text == "3" && (txtq9x.Text == "" || txtq9x.Text.Length < 1))
            //{
            //    showalert("Enter Specify Value!");
            //    txtq9x.Enabled = true;
            //    txtq9x.Focus();
            //}
            //else if (txtq10.Text == "" || !(txtq10.Text == "1" || txtq10.Text == "2" || txtq10.Text == "3"))
            //{
            //    showalert("Enter Value where 1 or 2 or 3 only!");
            //    txtq10.Text = "";
            //    txtq10.Focus();
            //}
            //else if (txtq11.Text == "" || !(txtq11.Text == "1" || txtq11.Text == "2" || txtq11.Text == "3"))
            //{
            //    showalert("Enter Value where 1 or 2 or 3 only!");
            //    txtq11.Text = "";
            //    txtq11.Focus();
            //}
            //else if (txtq12dt.Text == "")
            //{
            //    showalert("Enter Date of BLOOD COLLECTION!");
            //    txtq12dt.Focus();
            //}
            //else if (txtq13t.Text == "")
            //{
            //    showalert("Enter Time of collection!");
            //    txtq13t.Focus();
            //}
            //else if (txtq14.Text == "" || !(txtq14.Text == "1" || txtq14.Text == "2"))
            //{
            //    showalert("Enter Value where 1 or 2 only!");
            //    txtq14.Text = "";
            //    txtq14.Focus();
            //}
            //else if (txtq15.Text == "" || !(txtq15.Text == "1" || txtq15.Text == "2"))
            //{
            //    showalert("Enter Value where 1 or 2 only!");
            //    txtq15.Text = "";
            //    txtq15.Focus();
            //}

            else
            {
                if (FormExist() == false)
                {
                    insertdata();
                }
                aess.Focus();
            }
                
        }
    }
     
}