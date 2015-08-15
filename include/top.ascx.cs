using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Net.Mail;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using TPortalClass;

//using System.Xml.Linq;

public partial class include_top : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["uid"] == null || this.Session["uid"].ToString() == "")
        {
            this.lb_showLogin.Text = "<a href=\"javascript:void(0)\" class=\"Logo\" id=\"User_Register\">注册</a>";
            this.lb_showLogin.Text += "<a href=\"javascript:void(0)\" class=\"Rion\" id=\"User_Login\">登录</a>";

        }
        else if (this.Session["uname"] != null)
        {
            this.lb_showLogin.Text = "<a href=\"javascript:void(0)\" class=\"Logo\" onclick=\"loginOut();\" id=\"loginOut\">注销</a>  <a href=\"javascript:void(0)\" class=\"Rion\" id=\"User\">欢迎你，" + this.Session["uname"].ToString() + "</a>";
            if (this.Session["utype"] != null)
            {
                if (this.Session["utype"].ToString() == "1")
                {
                    personal personal = new personal();
                    personal.GetModel(this.Session["uid"].ToString().Trim()); ;
                    this.lb_name.Text = personal.name;
                    this.lb_email.Text = personal.email;
                    this.lb_type.Text = "个人/创客";
                }
                else if (this.Session["utype"].ToString() == "2")
                {
                    investor investor = new investor();
                    investor.GetModel(this.Session["uid"].ToString().Trim()); ;
                    this.lb_name.Text = investor.name;
                    this.lb_email.Text = investor.eamil;
                    this.lb_type.Text = "投资人";
                }
                else if (this.Session["utype"].ToString() == "3")
                {
                    company company = new company();
                    company.GetModel(this.Session["uid"].ToString().Trim()); ;
                    this.lb_name.Text = company.name;
                    this.lb_email.Text = company.eamil;
                    this.lb_type.Text = "企业";
                }
            }
        }
    }
    /// <summary>
    /// 发送邮件
    /// </summary>
    /// <param name="strSmtpServer">包含用于 SMTP 事务的主机的名称或 IP 地址。System.String</param>
    /// <param name="strFrom">包含电子邮件发件人的地址的 System.String。/与凭据关联的用户名。</param>
    /// <param name="strFromPass">与凭据关联的用户名的密码。</param>
    /// <param name="strto">包含电子邮件收件人的地址的 System.String。</param>
    /// <param name="strSubject">包含主题文本的 System.String。</param>
    /// <param name="strBody">包含邮件正文的 System.String。</param>
    /// <param name="strfiles">附件 System.String[]。绝对路径名称+文件名</param>
    public void SendSMTPEMail(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
    {
        System.Net.Mail.SmtpClient client = new SmtpClient(strSmtpServer);
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(strFrom, strto, strSubject, strBody);
        message.BodyEncoding = System.Text.Encoding.UTF8;
        message.IsBodyHtml = true;
        client.Send(message);
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        string strType = "";
        string strYzid = System.Guid.NewGuid().ToString();
        if (this.ck_personal.Checked)
        {
            addPersonal(strYzid);
            strType = "1";
        }
        else if (this.ck_investor.Checked)
        {
            addInvestor(strYzid);
            strType = "2";
        }
        else if (this.ck_enterprise.Checked)
        {
            addCompany(strYzid);
            strType = "3";
        }
        string strBody = "" + this.txtName.Value + ", 你好,<br/><br/>感谢您注册<b>会飞猪</b>。</br><b>请点击以下链接认证此邮箱：</b><br/><br/>http://192.168.0.152:8009/accountConfire.aspx?user=" + this.txtEmail.Value + "&type=" + strType + "&ren=" + strYzid + "<br/><br/>(认证成功后，可用来取回账号密码)<br/><br/>-&nbsp; 会飞猪 团队<br/><br/><br/>";
        SendSMTPEMail("smtp.163.com", "wjszxli@163.com", "love673236376", this.txtEmail.Value, "欢迎您注册会飞猪账户", strBody);
        Response.Write("<script>alert('注册成功，我们将发送一封验证邮件到您的邮箱，您可以通过邮件来验证注册！');window.location='index.aspx?rend=" + System.Guid.NewGuid().ToString() + "'</script>");
    }

    private void addPersonal(string strYzid)
    {
        personal personal = new personal();
        personal.id = System.Guid.NewGuid().ToString();
        personal.loginId = this.txtEmail.Value;
        personal.pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPwd.Value, "MD5");
        personal.name = this.txtName.Value;
        personal.telNumber = "";
        personal.phoneNumber = "";
        personal.webSite = "";
        personal.address = "";
        personal.team = "";
        personal.ifEnable = "0";
        personal.detail = "";
        personal.email = this.txtEmail.Value;
        personal.yzid = strYzid;
        personal.createTime = DateTime.Now;
        personal.Add();
    }

    private void addInvestor(string strYzid)
    {
        investor investor = new investor();
        investor.id = System.Guid.NewGuid().ToString();
        investor.loginId = this.txtEmail.Value;
        investor.pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPwd.Value, "MD5");
        investor.name = this.txtName.Value;
        investor.telNumber = "";
        investor.phoneNumber = "";
        investor.company = "";
        investor.address = "";
        investor.contact = "";
        investor.ifEnable = "0";
        investor.detail = "";
        investor.intelligence = "";
        investor.capital = 0;
        investor.eamil = this.txtEmail.Value;
        investor.yzid = strYzid;
        investor.createTime = DateTime.Now;
        investor.Add();
    }

    private void addCompany(string strYzid)
    {

        company company = new company();
        company.id = System.Guid.NewGuid().ToString();
        company.loginId = this.txtEmail.Value;
        company.pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPwd.Value, "MD5");
        company.name = this.txtName.Value;
        company.telNumber = "";
        company.phoneNumber = "";
        company.companyNmae = "";
        company.address = "";
        company.contact = "";
        company.ifEnable = "0";
        company.detail = "";
        company.scale = "";
        company.capital = 0;
        company.legalPerson = "";
        company.type = "";
        company.eamil = this.txtEmail.Value;
        company.yzid = strYzid;
        company.createTime = DateTime.Now;
        company.Add();
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        string CheckCode = this.txtCheckCode.Value.Trim();  //验证码
        if (String.Compare(Request.Cookies["ValidateCode"].Value, CheckCode, true) != 0)
        {
            Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('验证码输入不正确，请重新输入！');</script>");
            return;
        }
        if (this.st_type.Value == "1")
        {
            personal personal = new personal();
            personal.loginId = this.txtUid.Value.Trim();
            personal.pwd = this.txtLogPwd.Value.Trim();
            personal.ifEnable = "1";
            if (personal.userIfEnable())
            {
                Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('该用户没有认证，请查看邮箱认证用户！');</script>");
                return;
            }
            else
            {
                DataSet dtSet = personal.userLogin();
                if (dtSet.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = dtSet.Tables[0].Rows[0]["id"].ToString();
                    Session["uname"] = dtSet.Tables[0].Rows[0]["name"].ToString();
                    Session["loginId"] = dtSet.Tables[0].Rows[0]["loginId"].ToString();
                    Session["utype"] = "1";
                    this.lb_showLogin.Text = "<a href=\"javascript:void(0)\" class=\"Logo\"  onclick=\"loginOut();\"  id=\"loginOut\">注销</a><a href=\"javascript:void(0)\" class=\"Rion\" id=\"User\"> 欢迎你，" + dtSet.Tables[0].Rows[0]["name"].ToString() + "</a>";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('用户名或密码输入错，请重新输入！');</script>");
                    return;
                }
            }
        }
        else if (this.st_type.Value == "2")
        {
            investor investor = new investor();
            investor.loginId = this.txtUid.Value.Trim();
            investor.pwd = this.txtLogPwd.Value.Trim();
            investor.ifEnable = "1";
            if (investor.userIfEnable())
            {
                Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('该用户没有认证，请查看邮箱认证用户！');</script>");
                return;
            }
            else
            {
                DataSet dtSet = investor.userLogin();
                if (dtSet.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = dtSet.Tables[0].Rows[0]["id"].ToString();
                    Session["uname"] = dtSet.Tables[0].Rows[0]["name"].ToString();
                    Session["loginId"] = dtSet.Tables[0].Rows[0]["loginId"].ToString();
                    Session["utype"] = "2";
                    this.lb_showLogin.Text = "<a href=\"javascript:void(0)\" class=\"Logo\"  onclick=\"loginOut();\"  id=\"loginOut\">注销</a><a href=\"javascript:void(0)\" class=\"Rion\" id=\"User\"> 欢迎你，" + dtSet.Tables[0].Rows[0]["name"].ToString() + "</a>";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('用户名或密码输入错，请重新输入！');</script>");
                    return;
                }
            }
        }
        else if (this.st_type.Value == "3")
        {
            company company = new company();
            company.loginId = this.txtUid.Value.Trim();
            company.pwd = this.txtLogPwd.Value.Trim();
            company.ifEnable = "1";
            if (company.userIfEnable())
            {
                Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('该用户没有认证，请查看邮箱认证用户！');</script>");
                return;
            }
            else
            {
                DataSet dtSet = company.userLogin();
                if (dtSet.Tables[0].Rows.Count > 0)
                {
                    Session["uid"] = dtSet.Tables[0].Rows[0]["id"].ToString();
                    Session["uname"] = dtSet.Tables[0].Rows[0]["name"].ToString();
                    Session["loginId"] = dtSet.Tables[0].Rows[0]["loginId"].ToString();
                    Session["utype"] = "3";
                    this.lb_showLogin.Text = "<a href=\"javascript:void(0)\" class=\"Logo\"  onclick=\"loginOut();\"  id=\"loginOut\">注销</a><a href=\"javascript:void(0)\" class=\"Rion\" id=\"User\"> 欢迎你，" + dtSet.Tables[0].Rows[0]["name"].ToString() + "</a>";
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>tip('用户名或密码输入错，请重新输入！');</script>");
                    return;
                }
            }
        }
    }

    protected void btn_loginOut_Click(object sender, EventArgs e)
    {
        Session["uid"] = "";
        Session["uname"] = "";
        Session["loginId"] = "";
        Session["utype"] = "";
        Response.Redirect("index.aspx?ren=" + System.Guid.NewGuid().ToString());
    }
}
