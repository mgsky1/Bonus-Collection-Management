/*This REGISTER segment written by Martin Huang
 * 2016-11-29
 */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    //Linq数据库上下文
    DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        //页面加载时初始化Linq数据库上下文
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
    }

    //注册操作
    protected void submit_Click(object sender, EventArgs e)
    {
        //获取值
        string user_id = id.Text.Trim();
        if(user_id.Equals(""))
        {
            Response.Write("<script>alert('会员号不能为空')</script>");
            return;
        }
        string user_trueName = trueName.Text.Trim();
        string user_name = loginName.Text.Trim();
        string user_password = password.Text.Trim();
        if(user_password.Equals(""))
        {
            Response.Write("<script>alert('密码不能为空')</script>");
            return;
        }
        string user_passwordConfirm = confirm.Text.Trim();
        string user_email = email.Text.Trim();
        if(!pwdConfirm(user_password , user_passwordConfirm))
        {
            Response.Write("<script>alert('密码不匹配')</script>");
            return;
        }
        string user_phone = phone.Text.Trim();

        //注册开始
        string[] user_info = new string[] { user_id , user_trueName , user_name , user_password , user_phone , user_email};
        var set = from r in db.VIP
                  where r.VIPNo == user_id
                  select r;
        if (set.Count() > 0)
        {
            Response.Write("<script>alert('会员号已经存在!')</script>");
            return ;
        }

        if (register(user_info))
        {
            Response.Write("<script>alert('注册成功！');window.location.href='Login.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('注册失败！')</script>");
        }
    }

    //注册方法
    private bool register(string[] user_info)
    {
        VIP vip = new VIP();
        vip.VIPNo = user_info[0];
        vip.VIPName = user_info[1];
        vip.LoginName = user_info[2];
        vip.PW = user_info[3];
        vip.Phone = user_info[4];
        vip.RefereeCount = 0;
        vip.email = user_info[5];
        try
        {
            db.VIP.InsertOnSubmit(vip);
            db.SubmitChanges();
            return true;
        }catch(Exception e)
        {
            return false;
        }

        
    }

    //密码验证
    private bool pwdConfirm(string orginal , string confirm)
    {
        if (orginal.Equals(confirm))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void goback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}