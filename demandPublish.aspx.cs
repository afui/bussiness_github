using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class demandPublish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["op"] != null)
        {
            this.txtOp.Value = this.Request.QueryString["op"].ToString();
        }
        if (!this.IsPostBack)
        {
            if (this.Request.QueryString["id"] != null)
            {
                this.txtDocid.Value = this.Request.QueryString["id"].ToString();
            }
            else
            {
                this.txtDocid.Value = System.Guid.NewGuid().ToString();
            }
            if (this.txtOp.Value == "modify")
            {
                getData();
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
    private void getData()
    {
        demand dt_demand = new demand();
        dt_demand.GetModel(this.txtDocid.Value);
        this.txtDetail.Value = dt_demand.detail;
        this.firstClass.Value = dt_demand.firstClass;
        this.secondClass.Value = dt_demand.secondClass;
        this.thirdClass.Value = dt_demand.thirdClass;
        this.txtAmount.Value = dt_demand.amount.ToString();
        this.txtDistribution.Value = dt_demand.disturibution;
        this.txtWay.Value = dt_demand.way;
        if (this.ck_days1.Value == dt_demand.days)
        {
            ck_days1.Checked = true;
        }
        else if (this.ck_days2.Value == dt_demand.days)
        {
            ck_days2.Checked = true;
        }
        else if (this.ck_days3.Value == dt_demand.days)
        {
            ck_days3.Checked = true;
        }
        else if (this.ck_days4.Value == dt_demand.days)
        {
            ck_days4.Checked = true;
        }
        else
        {
            this.other_Days.Value = dt_demand.days;
        }
        this.txtTaskName.Value = dt_demand.name;
        this.st_ItemName.Value = dt_demand.projectName;
        this.st_ItemName.Value = dt_demand.projectName;
        this.txtSummary.Value = dt_demand.summary;
        this.txtPhone.Value = dt_demand.phone;
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        Response.Write("jjjj");
        demand dt_demand = new demand();
        dt_demand.detail = this.txtDetail.Value;
        dt_demand.publishTime = DateTime.Now;
        dt_demand.id = this.txtDocid.Value;
        dt_demand.publishName = this.Session["uname"].ToString();
        dt_demand.publishId = this.Session["uid"].ToString();
        dt_demand.firstClass = this.firstClass.Value;
        dt_demand.secondClass = this.secondClass.Value;
        dt_demand.thirdClass = this.thirdClass.Value;
        dt_demand.field2 = "";
        dt_demand.field3 = "";
        dt_demand.field4 = "";
        dt_demand.field5 = "";
        try
        {
            dt_demand.amount = Convert.ToDecimal(this.txtAmount.Value);
        }
        catch
        {
            dt_demand.amount = 0;
        }
        dt_demand.disturibution = this.txtDistribution.Value;
        dt_demand.way = this.txtWay.Value;
        dt_demand.days = this.other_Days.Value;
        if (this.ck_days1.Checked)
        {
            dt_demand.days = this.ck_days1.Value;
        }
        if (this.ck_days2.Checked)
        {
            dt_demand.days = this.ck_days2.Value;
        }
        if (this.ck_days3.Checked)
        {
            dt_demand.days = this.ck_days3.Value;
        }
        if (this.ck_days4.Checked)
        {
            dt_demand.days = this.ck_days4.Value;
        }

        dt_demand.orderid = BillNumberBuilder.NextBillNumber();
        dt_demand.field1 = "";
        dt_demand.name = this.txtTaskName.Value;
        dt_demand.projectName = this.st_ItemName.Value;
        dt_demand.projectID = this.st_ItemName.Value;
        dt_demand.summary = this.txtSummary.Value;
        dt_demand.phone = this.txtPhone.Value;
        dt_demand.img = "";
        dt_demand.publishType = this.Session["utype"].ToString();
        dt_demand.ifPay = "0";
        dt_demand.ifExpire = "0";
        dt_demand.ifPublish = "0";
        if (this.txtOp.Value == "modify")
        {
            dt_demand.Update();
        }
        else
        {
            dt_demand.Add();
        }
        Response.Redirect("orderConfirm.aspx?op=order&id=" + this.txtDocid.Value + "&rend=" + System.Guid.NewGuid().ToString() + "");
    }
}