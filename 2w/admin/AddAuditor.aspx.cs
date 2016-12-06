/*This ADDAUDITOR segment written by Xiaodong Zhang
 * 2016-12-1
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class admin_AddAuditor : System.Web.UI.Page
{
    DataClassesDataContext db;
    protected void Page_Load(object sender, EventArgs e)
    {
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
        if (Session["priviledge"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }        
        if(!Session["priviledge"].ToString().Equals("admin"))
        {
            Response.Redirect("Login.aspx");
            return;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Admin add = new Admin();
        add.AdminName = adminname.Text;
        add.LoginName = loginname.Text;
        add.PW = pwd.Text;
        add.Phone = phone.Text;
        add.Permission = false;
        try
        {
            db.Admin.InsertOnSubmit(add);
            db.SubmitChanges();
            Response.Redirect("EditAuditor.aspx");
        }catch(Exception exception)
        {
            Response.Write("<script>alert('添加失败')</script>");
        }
       
    }
}