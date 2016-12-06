/*This TRANSFER segment written by Martin Huang
 * 2016-11-30
 */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class transfer : System.Web.UI.Page
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
        var set = from r in db.DeQueueView1
                  join r1 in db.VIP1
                  on r.VIPNo equals r1.VIPNo
                  select new { r.PayID , r.VIPNo, r1.Phone ,r1.LoginName , r1.VIPName, r.CardNo , r.Bank , r.CardHolder , r.RefereeNo};

        list.DataSource = set;
        list.DataKeyNames = new string[] { "payID" };
        list.DataBind();
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("check.aspx");
    }
    protected void list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        list.PageIndex = e.NewPageIndex;
        bindData();
    }
}