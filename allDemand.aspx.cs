using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class allDemand : System.Web.UI.Page
{
    private string pageNo = "1";
    private string pageSie = "10";
    private string dataTotal = "10";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["page"] != null)
        {
            pageNo = this.Request.QueryString["page"].ToString();
        }
        this.lb_page.Text = HyCommon.page(pageNo, pageSie, dataTotal, "wjs&zxli", "55", "55");
    }

}