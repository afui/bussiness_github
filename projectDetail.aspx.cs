using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class projectDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.QueryString["docid"] != null)
        {
            this.txtDocid.Text = this.Request.QueryString["docid"].ToString();
        }
        DataSet dt = new DataSet();
        project project = new project();
        dt = project.GetList(" id='" + this.txtDocid.Text + "' ");
        if (dt.Tables[0].Rows.Count > 0)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("<span> " + dt.Tables[0].Rows[0]["projectNmae"].ToString() + " </span><br>");
            stringBuilder.Append(" <i> " + Convert.ToDateTime(dt.Tables[0].Rows[0]["publishTime"].ToString()).ToString("yyyy.MM.dd") + "");
            string[] strArray = dt.Tables[0].Rows[0]["industry"].ToString().Split('#');
            for (int j = 0; j < strArray.Length; j++)
            {
                if (j != strArray.Length - 1)
                {
                    stringBuilder.Append("&nbsp;" + strArray[j] + "&nbsp;");
                }
            }
            stringBuilder.Append("</i>");
            stringBuilder.Append("<img src =\"Images/Img.jpg\" >");
            stringBuilder.Append("<p> " + dt.Tables[0].Rows[0]["projectDetail"].ToString() + "</p>");
            this.lb_show.Text = stringBuilder.ToString();
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        projectMessage projectMessage = new projectMessage();
        projectMessage.projectMessages = this.txtMessage.Value;
        projectMessage.addTime = DateTime.Now;
        projectMessage.id = System.Guid.NewGuid().ToString();
        projectMessage.addUserId = "";
        projectMessage.addUserName = "";
        projectMessage.addUserDeptid = "";
        projectMessage.addUserDeptName = "";
        projectMessage.projectId = this.txtDocid.Text;
        projectMessage.Add();
        Response.Write("<script>alert('添加留言成功！');</script>");
    }
}