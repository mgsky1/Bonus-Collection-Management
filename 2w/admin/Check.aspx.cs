/*This CHECK segment written by Martin Huang Changchun Lu
 * 2016-11-30
 */
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Check : System.Web.UI.Page
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
        if(!IsPostBack)
        {
            bindData();
        }
    }
    //绑定数据
    private void bindData()
    {
        var set = from r in db.VIP1
                  join r1 in db.Payment1
                  on r.VIPNo equals r1.VIPNo
                  where r1.ActiveState == 0
                  select new {r1.PayID , r.LoginName , r.VIPNo , r1.Phone , r1.Bank , r1.CardHolder , r1.CardNo ,r1.PayJpg ,r1.PaySpecify , r1.RefereeNo};
        
        activateList.DataSource = set;
        activateList.DataKeyNames = new string[] { "payID" };
        activateList.DataBind();
    }
    //分页
    protected void activateList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        activateList.PageIndex = e.NewPageIndex;
        activateList.DataBind();
    }
    //激活
    protected void activateList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(activateList.DataKeys[e.RowIndex].Value.ToString());
        var set = from r in db.Payment1
                  where r.PayID == id
                  select r;
        foreach(var r in set)
        {
            r.ActiveState = 1; r.Checker = Session["checker"].ToString();
        }
        db.SubmitChanges();
        Response.Write("<script>alert('激活成功')</script>");
        bindData();
    }
    protected void transfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transfer.aspx");
    }
    protected void list_Click(object sender, EventArgs e)
    {
        Response.Redirect("List.aspx");
    }
    protected void goback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void activateList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    //分页
    protected void activateList_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        activateList.PageIndex = e.NewPageIndex;
        bindData();
    }
    //作废
    protected void activateList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(activateList.DataKeys[e.RowIndex].Value.ToString());
        var set = from r in db.Payment1
                  where r.PayID == id
                  select r;
        foreach (var r in set)
        {
            r.ActiveState = -1; r.Checker = Session["checker"].ToString();
        }
        db.SubmitChanges();
        Response.Write("<script>alert('已作废')</script>");
        bindData();
    }
}