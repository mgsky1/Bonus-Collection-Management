/*This SHOWIMAGE segment writtn by Changchun Lu
 * 2016-12-1
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ShowImage : System.Web.UI.Page
{
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
        if (!IsPostBack)
        {
            this.ShowImg();
        }
    }
    //显示图片
    protected void ShowImg()
    {
        if (Request.QueryString["imgUrl"] != null)
        {
            this.showImage.ImageUrl = Request.QueryString["imgUrl"].ToString();
        }
    }
}