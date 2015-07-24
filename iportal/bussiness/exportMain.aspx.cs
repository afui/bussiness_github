using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class iportal_bussiness_exportMain : System.Web.UI.Page
{
    public string uid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断session
        if (this.Session["uid"] != null)
        {
            if (this.Session["uid"].ToString() == "")
            {
                this.Response.Redirect("../login.aspx");
            }
        }
        else
        {
            this.Response.Redirect("../login.aspx");
        }

        if (!this.IsPostBack)
        {
            uid = this.Session["uid"].ToString();
            //获取操作类型
            if (this.Request.QueryString["op"] != null)
            {
                this.txtop.Value = this.Request.QueryString["op"].ToString();
            }
            //获取文章ID
            if (this.Request.QueryString["docid"] != null)
            {
                this.txtDocid.Value = this.Request.QueryString["docid"].ToString();
            }
            if (this.txtop.Value == "add")
            {
                this.txtDocid.Value = System.Guid.NewGuid().ToString();
            }
            dataShow();
        }

    }

    private void dataShow()
    {
        //旧文档  将数据显示出来
        if (this.txtop.Value == "modify")
        {
            dt_expert dtExpert = new dt_expert();
            dtExpert.ID = this.txtDocid.Value;
            DataSet dataSet = dtExpert.GetListById();
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                this.txtdt_type.Value = dataSet.Tables[0].Rows[0]["dt_type"].ToString();
                this.txtdt_name.Text = dataSet.Tables[0].Rows[0]["dt_name"].ToString();
                this.txtdt_email.Text = dataSet.Tables[0].Rows[0]["dt_email"].ToString();
                this.txtdt_phone.Text = dataSet.Tables[0].Rows[0]["dt_phone"].ToString();
                this.txtdt_address.Text = dataSet.Tables[0].Rows[0]["dt_address"].ToString();
                this.txtdt_summary.Value = dataSet.Tables[0].Rows[0]["dt_summary"].ToString();
            }
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        dt_expert dt_expert = new dt_expert();
        dt_expert.ID = this.txtDocid.Value;
        dt_expert.dt_type = this.txtdt_type.Value;
        dt_expert.dt_name = this.txtdt_name.Text;
        dt_expert.dt_email = this.txtdt_email.Text;
        dt_expert.dt_phone = this.txtdt_phone.Text;
        dt_expert.dt_address = this.txtdt_address.Text;
        dt_expert.dt_summary = this.txtdt_summary.Value;
        dt_expert.field = "";
        if (this.txtop.Value == "add")
        {
            dt_expert.Add();
        }
        else if (this.txtop.Value == "modify")
        {
            dt_expert.ID = this.txtDocid.Value;
            dt_expert.Update();
        }
        //写日志
        HyCommon HyCommon = new HyCommon();
        HyCommon.WriteLog("修改", "修改文章记录[id:" + this.txtDocid.Value + "]", Session["uid"].ToString(), Session["uname"].ToString());
        //提示并跳转
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>success();</script>");
    }
}