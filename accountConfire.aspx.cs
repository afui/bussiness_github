using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class accountConfire : System.Web.UI.Page
{
    private string strUid = "";
    private string strType = "";
    private string strID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["user"] != null)
        {
            strUid = this.Request.QueryString["user"].ToString();
        }
        else
        {
            Response.Write("<script>alert('对不起，参数有误！请联系管理员！');</script>");
            Response.Redirect("index.aspx?rend=" + System.Guid.NewGuid().ToString());
            return;
        }
        if (this.Request.QueryString["type"] != null)
        {
            strType = this.Request.QueryString["type"].ToString();
        }
        else
        {
            Response.Write("<script>alert('对不起，参数有误！请联系管理员！');</script>");
            Response.Redirect("index.aspx?rend=" + System.Guid.NewGuid().ToString());
            return;
        }
        if (this.Request.QueryString["ren"] != null)
        {
            strID = this.Request.QueryString["ren"].ToString();
        }
        else
        {
            Response.Write("<script>alert('对不起，参数有误！请联系管理员！');</script>");
            Response.Redirect("index.aspx?rend=" + System.Guid.NewGuid().ToString());
            return;
        }
        if (strType == "1")
        {
            personal personal = new personal();
            personal.yzid = strID;
            personal.loginId = strUid;
            DataSet dtSet = personal.GetAuthenticationList();
            if (dtSet.Tables[0].Rows.Count > 0)
            {
                personal.ifEnable = "1";
                personal.id = dtSet.Tables[0].Rows[0]["id"].ToString();
                personal.authenticationTime = DateTime.Now;
                personal.UpdateAuthenticationList();
            }
        }
        else if (strType == "2")
        {
            investor investor = new investor();
            investor.yzid = strID;
            investor.loginId = strUid;
            DataSet dtSet = investor.GetAuthenticationList();
            if (dtSet.Tables[0].Rows.Count > 0)
            {
                investor.ifEnable = "1";
                investor.id = dtSet.Tables[0].Rows[0]["id"].ToString();
                investor.authenticationTime = DateTime.Now;
                investor.UpdateAuthenticationList();
            }
        }
        else if (strType == "3")
        {
            company company = new company();
            company.yzid = strID;
            company.loginId = strUid;
            DataSet dtSet = company.GetAuthenticationList();
            if (dtSet.Tables[0].Rows.Count > 0)
            {
                company.ifEnable = "1";
                company.id = dtSet.Tables[0].Rows[0]["id"].ToString();
                company.authenticationTime = DateTime.Now;
                company.UpdateAuthenticationList();
            }
        }
        else
        {
            Response.Write("<script>alert('对不起，参数有误！请联系管理员！');</script>");
            Response.Redirect("index.aspx?rend=" + System.Guid.NewGuid().ToString());
            return;
        }
    }
}