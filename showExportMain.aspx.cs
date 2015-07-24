using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class showExportMain : System.Web.UI.Page
{
    private string strDocid = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.Request.QueryString["docid"] != null)
        {
            strDocid = this.Request.QueryString["docid"].ToString();
        }
        StringBuilder stringBuilder = new StringBuilder();
        dt_expert dtExpert = new dt_expert();
        dtExpert.ID = strDocid;
        DataSet dt = dtExpert.GetListById();
        DataTable dtImg = new DataTable();
        HyFileatt hyFileatt = new HyFileatt();
        dtImg = hyFileatt.Getdocsfm(strDocid);
        stringBuilder.Append("<div class=\"exp_Bottom\">");
        if (dt.Tables[0].Rows.Count > 0 && dtImg.Rows.Count > 0)
        {
            stringBuilder.Append("<img src=\"" + dtImg.Rows[0]["hy_filepath"].ToString() + "\">");
            stringBuilder.Append("<span>" + dt.Tables[0].Rows[0]["dt_name"].ToString() + "</span><p>");
            stringBuilder.Append(dt.Tables[0].Rows[0]["dt_summary"].ToString());
        }
        stringBuilder.Append("</p></div>");
        this.lb_show.Text = stringBuilder.ToString();
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        question question = new question();
        if (this.txtType.Value == "1")
        {
            question.id = System.Guid.NewGuid().ToString();
            question.expertId = strDocid;
            question.questioner = "[匿名]";
            question.describe = this.txtDetail.Value;
            question.quertionerEmail = this.txtEmail.Value;
            question.questionTime = DateTime.Now;
        }
        else
        {
            question.id = System.Guid.NewGuid().ToString();
            question.expertId = strDocid;
            question.describe = this.txtDDetail.Value;
            question.quertionerEmail = this.txtDEmail.Value;
            question.questioner = this.txtName.Value;
            question.questionTime = DateTime.Now;
        }
        question.Add();
        Response.Write("<script>alert('保存成功！');</script>");
    }
}