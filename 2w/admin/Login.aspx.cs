/*This LOGIN segment written by Martin Huang Xiaodong Zhang
 * 2016-12-1
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class admin_Login : System.Web.UI.Page
{
    DataClassesDataContext db;
    protected void Page_Load(object sender, EventArgs e)
    {
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if(identity.SelectedValue.ToString().Equals("0"))
        {
            if (login(user.Text,password.Text,identity.SelectedValue.ToString()))
            {
                Session["priviledge"] = "checker";
                Session["checker"] = user.Text;
                Response.Redirect("Check.aspx");                
            }
            else
            {
                Response.Write("<script>alert('审核人员登陆失败')</script>");
            }

        }
        if(identity.SelectedValue.ToString().Equals("1")){
            if (login(user.Text, password.Text, identity.SelectedValue.ToString()))
            {
                Session["priviledge"] = "admin";
                Response.Redirect("EditAuditor.aspx");
            }
            else
            {
                Response.Write("<script>alert('管理人员登陆失败')</script>");
            }

        }
    }
    public bool login(string name,string pwd,string identity) {//登录
        bool flag=false;
        if(identity.Equals("1")){
            flag=true;
        }
        var result = from r in db.Admin
                     where r.LoginName == name && r.PW == pwd && r.Permission == flag
                     select r;
        if(result.Count()>0){
            return true;
        }
        return false;
    }
}