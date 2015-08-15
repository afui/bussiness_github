using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class orderConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["op"] != null)
        {
            this.txtOp.Value = this.Request.QueryString["op"].ToString();
        }
        if (this.Request.QueryString["id"] != null)
        {
            this.txtDocid.Value = this.Request.QueryString["id"].ToString();
        }
        if (!this.IsPostBack)
        {
            if (this.txtOp.Value == "order")
            {
                demand demand = new demand();
                demand.GetModel(this.txtDocid.Value);
                this.lb_name.Text = demand.name;
                this.lb_ammount.Text = demand.amount.ToString();
                this.lb_day.Text = demand.days;
                this.lb_detail.Text = demand.detail;
                this.lb_project.Text = demand.projectName;
                this.lb_thirdClass.Text = demand.thirdClass;
                this.txtphone.Value = demand.phone;
                this.txtSummary.Value = demand.summary;
            }
        }
    }
    public bool ifNotLong()
    {
        bool strFlag = false;
        if (this.Session["uid"] != null)
        {
            if (this.Session["uid"].ToString() == "")
            {
                strFlag = true;
            }
        }
        else
        {
            strFlag = true;
        }
        return strFlag;
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        demand demand = new demand();
        demand.GetModel(this.txtDocid.Value);
        demand.phone = this.txtphone.Value;
        demand.summary = this.txtSummary.Value;
        demand.id = this.txtDocid.Value;
        demand.ifPublish = "1";
        demand.Update();
        Response.Redirect("getBountry.aspx?id=" + this.txtDocid.Value + "&rend=" + System.Guid.NewGuid().ToString() + "");
    }
}