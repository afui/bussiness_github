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
//using System.Xml.Linq;

public partial class include_top : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>saveData();</script>");
        string strBody = "" + this.txtName.Value + ",<br/><br/>感谢您注册 会飞猪，点击下面的链接可以登录：<br/><br/>http://ninghao.net/user/reset/23206/1428324932/zO8Tk2embvlNxvrfvOMrI7Yh8oSRW3rRLHfW5XUaWPg<br/><br/>这个链接只能使用一次，会引导您到设置密码。<br/><br/>在设置好您的密码之后，您就可以在 http://ninghao.net/user 使用下列帐号和密码登录了：<br/><br/>用户名: " + this.txtEmail.Value + "<br/>密码: 您的密码<br/><br/>-&nbsp; 会飞猪 团队<br/><br/><br/>";
        SendSMTPEMail("smtp.163.com", "wjszxli@163.com", "love673236376", this.txtEmail.Value, "会飞猪 的 " + this.txtName.Value + " 帐户详情", strBody);
        Response.Write("<script>alert('注册成功，我们将发送一封验证邮件到您的邮箱，您可以通过邮件来验证注册！');window.location='index.aspx?rend=" + System.Guid.NewGuid().ToString() + "'</script>");
    }
}
