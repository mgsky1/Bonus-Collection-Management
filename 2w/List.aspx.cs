using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _2w_List : System.Web.UI.Page
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
        bindData();
    }

    private void bindData()
    {
        var set = from r in db.Payment1
                  where r.VIPNo == Session["userID"].ToString() || r.RefereeNo == Session["userID"].ToString()
                  orderby r.PayID descending
                  select r;
        var set1 = set.Take(10);//取前10条记录
        List.DataSource = set1;
        List.DataBind();
    }
    protected void apply_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void List_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow gvr = e.Row;
        if (gvr.Cells[3].Text.Trim() == "-1")
        {
            gvr.Cells[3].Text = "作废";
        }
        if (gvr.Cells[3].Text.Trim() == "0")
        {
            gvr.Cells[3].Text = "待审";
        }
        if (gvr.Cells[3].Text.Trim() == "1")
        {
            var set = from r in db.Payment1
                      where r.PayID == Convert.ToInt32(gvr.Cells[0].Text.Trim())
                      select r;
            if (set.FirstOrDefault().DeQueue == 0)
            {
                gvr.Cells[3].Text = "排队";
            }
            else
            {
                gvr.Cells[3].Text = "出队";
            }
        }
    }
}