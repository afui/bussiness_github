using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class getBountry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["id"] != null)
        {
            this.txtDocid.Value = this.Request.QueryString["id"].ToString();
        }
        if (!this.IsPostBack)
        {
            demand demand = new demand();
            demand.GetModel(this.txtDocid.Value);
            this.lb_amount.Text = demand.amount.ToString();
            this.lb_orderid.Text = demand.orderid;
            this.lb_title.Text = demand.name;
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        demand demand = new demand();
        demand.GetModel(this.txtDocid.Value);
        demand.ifPay = "1";
        demand.Update();
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>success();</script>");
    }
}