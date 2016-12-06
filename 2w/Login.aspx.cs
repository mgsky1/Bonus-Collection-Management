/*This LOGIN segment written by Martin Huang Changchun Lu
 * 2016-11-29
 */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    //Linq数据库上下文
    DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        //页面加载时初始化Linq数据库上下文
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
    }

    //点击注册按钮时重定向到注册界面
    protected void register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }


    //点击登陆按钮时进行登陆操作
    protected void submit_Click(object sender, EventArgs e)
    {
        string user_name = user.Text.Trim();
        string user_password = password.Text.Trim();
        if (login(user_name, user_password))
        {
            Session["priviledge"] = "user";
            Response.Redirect("Application.aspx");
        }
        else
        {
            Response.Write("<script>alert('登陆失败')</script>");
        }
        
    }

    //登陆方法
    private bool login(string userName , string password)
    {
        var set = from r in db.VIP1
                    where r.VIPNo == userName && r.PW == password
                    select r;
        if (set.Count() > 0)
        {
            foreach(var r in set)
            {
                Session["userID"] = r.VIPNo;
            }
            return true;
        }
        else
        {
            return false;
        }
    }
    //验证
    private bool validateFun()
    {
        if (this.user.Text == "" || this.password.Text == "")
        {
            Response.Write("<script>alert('用户名或密码不能为空!');history.go(-1)</script>");
            return false;
        }
        return true;
    }

    protected void forget_Click(object sender, EventArgs e)
    {
        string userName = user.Text.Trim();
        var set = from r in db.VIP1
                  where r.VIPNo == userName
                  select r;
        if (set.Count() > 0)
        {
            foreach(var r in set)
            {
                smtp(r.PW, r.email);
                Response.Write("<script>alert('密码已发送至邮件:" + r.email + "')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('会员号不存在')</script>");
        }
    }

    private void smtp(string pwd , string mail)
    {
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        client.Host = "smtp.163.com";//使用163的SMTP服务器发送邮件
        client.UseDefaultCredentials = true;
        client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        client.Credentials = new System.Net.NetworkCredential("yourEmailName", "yourEmailPwd");//163的SMTP服务器需要用163邮箱的用户名和密码作认证，如果没有需要去163申请个,
        //这里假定你已经拥有了一个163邮箱的账户，用户名为abc，密码为*******
        System.Net.Mail.MailMessage Message = new System.Net.Mail.MailMessage();
        Message.From = new System.Net.Mail.MailAddress("yourEmail");
        Message.To.Add(mail);//将邮件发送给邮箱
        Message.Subject = "密码";
        Message.Body = pwd;
        Message.SubjectEncoding = System.Text.Encoding.UTF8;
        Message.BodyEncoding = System.Text.Encoding.UTF8;
        Message.Priority = System.Net.Mail.MailPriority.High;
        Message.IsBodyHtml = true;
        client.Send(Message);

    }
}
