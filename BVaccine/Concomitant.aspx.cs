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
    public partial class Concomitant : System.Web.UI.Page
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
            MySqlCommand cmd = new MySqlCommand("select * from medication where cmss='" + cmss.Text + "' and cmsid='" + cmsid.Text + "' ", con);
            con.Open();
            try
            {
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read() == true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Already Exist!');window.location.href='Concomitant.aspx';", true);
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
                //MySqlCommand cmd = new MySqlCommand("insert into medication(cmss,cmsid, cmsr1_a, cmsr1_b, cmsr1_cd, cmsr1_d, cmsr1_e, cmsr1_f, cmsr1_g, cmsr1_h)" +
                MySqlCommand cmd = new MySqlCommand("insert into medication(cmss,cmsid, cmsr1_a, cmsr1_b, cmsr1_cd, cmsr1_d, cmsr1_e, cmsr1_f, cmsr1_g, cmsr1_h, cmsr2_a, cmsr2_b, cmsr2_cd, cmsr2_d, cmsr2_e, cmsr2_f, cmsr2_g, cmsr2_h," +
                    " cmsr3_a, cmsr3_b, cmsr3_cd, cmsr3_d, cmsr3_e, cmsr3_f, cmsr3_g, cmsr3_h, cmsr4_a, cmsr4_b, cmsr4_cd, cmsr4_d, cmsr4_e, cmsr4_f, cmsr4_g, cmsr4_h, cmsr5_a, cmsr5_b, cmsr5_cd, cmsr5_d, cmsr5_e, cmsr5_f, cmsr5_g, cmsr5_h, cmcoinv_cd,cmcoinv_dt, cms_sup_cd, cms_sup_dt) " +
                    "values ('" + cmss.Text.ToUpper() + "','" + cmsid.Text.ToUpper() + "', '" + cmsr1_a.Text + "', '" + cmsr1_b.Text + "', '" + cmsr1_c.Text + "', '" + cmsr1_d.Text + "', '" + cmsr1_e.Text + "', '" + cmsr1_f.Text + "', '" + cmsr1_g.Text + "', '" + cmsr1_h.Text + "', " +
                    " '" + cmsr2_a.Text + "', '" + cmsr2_b.Text + "', '" + cmsr2_c.Text + "', '" + cmsr2_d.Text + "', '" + cmsr2_e.Text + "', '" + cmsr2_f.Text + "', '" + cmsr2_g.Text + "', '" + cmsr2_h.Text + "', " +
                    " '" + cmsr3_a.Text + "', '" + cmsr3_b.Text + "', '" + cmsr3_c.Text + "', '" + cmsr3_d.Text + "', '" + cmsr3_e.Text + "', '" + cmsr3_f.Text + "', '" + cmsr3_g.Text + "', '" + cmsr3_h.Text + "', " +
                    " '" + cmsr4_a.Text + "', '" + cmsr4_b.Text + "', '" + cmsr4_c.Text + "', '" + cmsr4_d.Text + "', '" + cmsr4_e.Text + "', '" + cmsr4_f.Text + "', '" + cmsr4_g.Text + "', '" + cmsr4_h.Text + "', " +
                    " '" + cmsr5_a.Text + "', '" + cmsr5_b.Text + "', '" + cmsr5_c.Text + "', '" + cmsr5_d.Text + "', '" + cmsr5_e.Text + "', '" + cmsr5_f.Text + "', '" + cmsr5_g.Text + "', '" + cmsr5_h.Text + "', '" + inv_nm.Text + "','" + inv_dt.Text + "','" + sup_nm.Text + "','" + sup_dt.Text + "')", con);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Submitted Successfully!');window.location.href='Concomitant.aspx';", true);
                con.Close();
            }
            catch (Exception ex)
            {
                showalert(ex.Message);
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (cmss.Text == "")
            {
                showalert("Enter Study site!");
                cmss.Focus();
            }
            else if (cmsid.Text == "")
            {
                showalert("Enter Participant ID!");
                cmsid.Focus();
            }

            else
            {
                if (FormExist() == false)
                {
                    insertdata();
                }
                cmss.Focus();
            }

        }

    }
}