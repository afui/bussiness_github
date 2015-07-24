using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class ggdy_Hy_SelDept : System.Web.UI.Page
{
    public string hy_mystyle()
    {
        string hy_mystyle = "";
        hy_mystyle = "";
        return hy_mystyle;
    }

    public string pis_deptid()
    {
        string ls_retrun = "";
        if (this.Request.QueryString["deptid"] != null)
        {
            ls_retrun = this.Request.QueryString["deptid"].ToString();
        }
        return ls_retrun;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.Response.Redirect("../login.aspx");
        }

        if (!this.IsPostBack)
        {
            if (this.Request.QueryString["txtfield"] != null)
            {
                txtfield.Value = this.Request.QueryString["txtfield"].ToString();
            }
            if (this.Request.QueryString["valuefield"] != null)
            {
                valuefield.Value = this.Request.QueryString["valuefield"].ToString();
            }
            if (this.Request.QueryString["type"] != null)
            {
                type.Value = this.Request.QueryString["type"].ToString();
            }
        }
    }
}
