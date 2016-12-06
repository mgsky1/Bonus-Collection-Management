/*This APPLICATION segment written by Martin Huang Changchun Lu
 * 2016-11-29
 */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Application : System.Web.UI.Page
{
    //Linq数据库上下文
    DataClassesDataContext db;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["priviledge"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (!Session["priviledge"].ToString().Equals("user"))
        {
            Response.Redirect("Login.aspx");
            return;
        }
        //页面加载时初始化Linq数据库上下文
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
        //创建上传文件文件夹
        createFolder();
        id.Text = Session["userID"].ToString();
    }

    //提交申请操作
    protected void submit_Click(object sender, EventArgs e)
    {
        string user_id = id.Text.Trim();
        string user_password = password.Text.Trim();
        string user_phone = phone.Text.Trim();
        string user_userTrueName = trueName.Text.Trim();
        string user_recommend = recommended.Text.Trim();
        if(!user_recommend.Equals(""))
        {
            if(!isRecommandInList(user_recommend))
            {
                Response.Write("<script>alert('推荐人会员号不存在')</script>");
                return;
            }
        }
        string user_bankName = bankName.Text.Trim();
        string user_bankNum = bankNum.Text.Trim();
        string user_bankCardName = bankcardName.Text.Trim();
        string user_paySpacify = paySpecify.Text.Trim();
        string[] user_info = new string[]{user_id , user_password , user_phone , user_userTrueName , 
            user_recommend , user_bankName , user_bankNum , user_bankCardName , user_paySpacify};

        if (apply(user_info))
        {
            Response.Write("<script>alert('提交成功！');window.location.href='List.aspx'</script>");
            //Response.Redirect("Login.aspx");
        }
        else
        {
            Response.Write("<script>alert('提交失败！')</script>");
        }

       
    }
    //提交
    private bool apply(string[] info)
    {
        Payment payment = new Payment();
        payment.VIPNo = info[0];
        payment.Phone = info[2];
        payment.RefereeNo = info[4];
        payment.Bank = info[5];
        payment.CardNo = info[6];
        payment.CardHolder = info[7];
        string path = uploadimg();
        if(!path.Equals("error"))
        {
             payment.PayJpg = path;
        }
       
        payment.PaySpecify = info[8];
        payment.ActiveState = 0;
        payment.QueueNo = 0;
        payment.DeQueue = 0;
        try
        {
            db.Payment.InsertOnSubmit(payment);
            db.SubmitChanges();
            return true;

        }catch(Exception e)
        {
            return false;
        }
    }




    //上传图片操作
    protected string uploadimg()
    {
        //保存根目录
        string savePath = createFolder() + "\\";

        //如果有文件驻留内存等待上传
        if (picUpload.HasFile)
        {
            string fileName;
            fileName = DateTime.Now.ToFileTime()+picUpload.FileName;
            //判断文件是否合法
            if (isTypeLegal(fileName))
            {
                DateTime time = DateTime.Now;
                string year = time.Year.ToString();
                string month = time.Month.ToString();
                string day = time.Day.ToString();
                if (month.Length == 1) month = "0" + month;
                if (day.Length == 1) day = "0" + day;
                string today = year + "" + month + "" + day + "/";
                savePath += fileName;
                picUpload.SaveAs(savePath);
                return "~/img/"+today + fileName; 
            }
            return "error";
        }
        return "error";
    }


    //创建上传图片的文件夹 以日期为单位 一天只会创建一次 eg.2016-11-29
    private string createFolder()
    {
        string directory = Server.MapPath("~/img/");
    //    string today = DateTime.Now.ToShortDateString();
        DateTime time = DateTime.Now;
        string year = time.Year.ToString();
        string month = time.Month.ToString();
        string day = time.Day.ToString();
        if (month.Length == 1) month = "0" + month;
        if (day.Length == 1) day = "0" + day;
        string today = year + "" + month + "" + day + "\\";
        if (!Directory.Exists(directory + today))
        {
            Directory.CreateDirectory(directory + today);
        }
        return directory + today;
    }

    //判断上传的是否是图片 目前支持*.jpg *.png
    private bool isTypeLegal(string fileName)
    {
        if (!fileName.Contains('.'))
        {
            return false;
        }
        int flag = 0;
        string[] typeRestrict = new string[] { "jpg", "png" };
        foreach (string type in typeRestrict)
        {
            if (flag == 1)
            {
                break;
            }
            string[] str = fileName.Split('.');
            if (str[1].Equals(type))
            {
                flag = 1;
            }

        }
        if (flag == 0)
        {
            return false;
        }
        return true;
    }



    private bool isRecommandInList(string id)
    {
        var set = from r in db.VIP
                  where r.VIPNo == id
                  select r;
        if (set.Count() > 0)
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
        Response.Redirect("List.aspx");
    }
}