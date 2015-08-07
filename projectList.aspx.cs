using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPortalClass;

public partial class projectList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        project project = new project();
        DataSet dt = project.GetList("");
        StringBuilder stringBuilder = new StringBuilder();
        string strProjectDetail = "";
        if (dt.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
            {
                stringBuilder.Append("<li><img src = \"Images/Img.jpg\" ><a href = \"projectDetail.aspx?docid=" + dt.Tables[0].Rows[i]["id"].ToString() + "&rend =" + System.Guid.NewGuid().ToString() + "\">");
                stringBuilder.Append("<span> " + dt.Tables[0].Rows[i]["projectNmae"].ToString() + " </span></a><br>");
                stringBuilder.Append(" <i> " + Convert.ToDateTime(dt.Tables[0].Rows[i]["publishTime"].ToString()).ToString("yyyy.MM.dd") + "");
                string[] strArray = dt.Tables[0].Rows[i]["industry"].ToString().Split('#');
                for (int j = 0; j < strArray.Length; j++)
                {
                    if (j != strArray.Length - 1)
                    {
                        stringBuilder.Append("&nbsp;" + strArray[j] + "&nbsp;");
                    }
                }
                stringBuilder.Append("</i>");
                strProjectDetail = dt.Tables[0].Rows[i]["projectDetail"].ToString();
                if (strProjectDetail.Length > 400)
                {
                    strProjectDetail = strProjectDetail.Substring(0, 400) + "...";
                }
                stringBuilder.Append("<p>" + strProjectDetail + "</p>");
                stringBuilder.Append("<a href =\"projectDetail.aspx?docid=" + dt.Tables[0].Rows[i]["id"] + "&rend=" + System.Guid.NewGuid().ToString() + "\"><em> 了解更多 </em></a>\"");
                stringBuilder.Append("</li>\"");
            }
        }

        this.lb_show.Text = stringBuilder.ToString();
    }
}