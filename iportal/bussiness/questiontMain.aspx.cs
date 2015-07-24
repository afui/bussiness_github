using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class questiontMain : System.Web.UI.Page
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
            //获取文章ID
            if (this.Request.QueryString["id"] != null)
            {
                this.txtDocid.Value = this.Request.QueryString["id"].ToString();
            }
            dataShow();
        }
    }

    private void dataShow()
    {
        question question = new question();
        question.GetModel(this.txtDocid.Value);
        this.txtName.Value = question.questioner;
        this.txtEmail.Value = question.quertionerEmail;
        this.txtDetail.Value = question.describe;
        this.txtdt_summary.Value = question.field;
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        question question = new question();
        question.id = this.txtDocid.Value;
        question.GetModel(this.txtDocid.Value);
        question.questioner = this.txtName.Value;
        question.quertionerEmail = this.txtEmail.Value;
        question.describe = this.txtDetail.Value;
        question.field = this.txtdt_summary.Value;
        question.Update();
        //写日志
        HyCommon HyCommon = new HyCommon();
        HyCommon.WriteLog("修改", "修改文章记录[id:" + this.txtDocid.Value + "]", Session["uid"].ToString(), Session["uname"].ToString());
        //提示并跳转
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>success();</script>");
    }
}