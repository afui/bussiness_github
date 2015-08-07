using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class projectMain : System.Web.UI.Page
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
            dataShow();
        }

    }

    private void dataShow()
    {
        string strDocid = "";
        if (this.Request.QueryString["docid"] != null)
        {
            strDocid = this.Request.QueryString["docid"].ToString();
            project project = new project();
            project.GetModel(" and id='" + strDocid + "' ");
            this.lb_projectName.Text = project.projectNmae;
            this.lb_projectNet.Text = project.projectAdress;
            this.lb_projectSummary.Text = project.projcetSummary;
            this.lb_projectKey.Text = project.projcetKeyword;
            this.lb_industry.Text = project.industry.Replace("#", " ");
            this.lb_projectDetail.Text = project.projectDetail;
            this.lb_financing.Text = project.financing.ToString();
            this.lb_phone.Text = project.phoneNumber;
            this.lb_email.Text = project.eamil;
            this.lb_movice.Text = project.video;
            this.lb_teamDetail.Text = project.teamDetail;
            projectMessage projectMessage = new projectMessage();
            DataSet dtSet = projectMessage.GetList(" and  projectId ='" + strDocid + "' ");
            string strMessage = "";
            if (dtSet.Tables[0].Rows.Count > 0)
            {
                for (int i=0;i<dtSet.Tables[0].Rows.Count;i++)
                {
                    strMessage = dtSet.Tables[0].Rows[i]["projectMessages"].ToString();
                    for (int j=0;j<((strMessage.Length/30)+1);j++)
                    {
                        
                    }
                }
            }
        }

    }
}