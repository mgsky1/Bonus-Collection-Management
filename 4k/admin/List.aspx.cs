using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_List : System.Web.UI.Page
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
        if (!Session["priviledge"].ToString().Equals("checker"))
        {
            Response.Redirect("Login.aspx");
            return;
        }
        //页面加载时初始化Linq数据库上下文
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
        if (!IsPostBack)
        {
            bindData();
        }
    }

    //绑定数据
    private void bindData()
    {
        var set = from r in db.VIP
                  join r1 in db.Payment
                  on r.VIPNo equals r1.VIPNo
                  where r1.ActiveState == 1 && r1.DeQueue==0
                  select new { r1.PayID, r.LoginName, r.VIPNo,r1.RefereeNo, r.Phone, r1.Bank, r1.CardHolder, r1.CardNo };

        List.DataSource = set;
        List.DataKeyNames = new string[] { "payID" };
        List.DataBind();
    }
    //分页
    protected void activateList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        List.PageIndex = e.NewPageIndex;
        List.DataBind();
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("check.aspx");
    }
    protected void List_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        List.PageIndex = e.NewPageIndex;
        bindData();
    }
}