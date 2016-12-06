/*This EditAuditor segment written by Xiaodong Zhang
 * 2016-12-2
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class admin_EditAuditor : System.Web.UI.Page
{
    DataClassesDataContext db;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["priviledge"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (!Session["priviledge"].ToString().Equals("admin"))
        {
            Response.Redirect("Login.aspx");
            return;
        }
        db = new DataClassesDataContext(ConfigurationManager.ConnectionStrings["db_dhxtConnectionString"].ConnectionString.ToString());
        if(!IsPostBack){
            BindData();
        }
    }
    public void BindData() {//绑定数据
        var admin = from a in db.Admin
                      where a.Permission==false
                      select a;
        GridView1.DataSource = admin;
        GridView1.DataKeyNames = new string[] { "AdminID"};
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)//修改
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string adminname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString().Trim();
        string loginname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
        string pwd = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
        string phone = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
        var update = from u in db.Admin
                     where u.AdminID == Convert.ToInt32(id)
                     select u;
        foreach(Admin edit in update){
            edit.AdminName = adminname;
            edit.LoginName = loginname;
            edit.PW = pwd;
            edit.Phone = phone;
        }
        db.SubmitChanges();
        GridView1.EditIndex = -1;
        BindData();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)//清除编辑状态
    {
        GridView1.EditIndex = -1;
        BindData();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)//设置编辑时的索引
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        var delete = from d in db.Admin
                     where d.AdminID == Convert.ToInt32(id)
                     select d;
        db.Admin.DeleteAllOnSubmit(delete);
        db.SubmitChanges();
        BindData();
    }
    protected void add_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddAuditor.aspx");
    }
    protected void goback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}