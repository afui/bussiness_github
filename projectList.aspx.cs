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
                stringBuilder.Append("<p> 提到HUD，大多数的人也许都还比较陌生，HUD是平视显示器（Head Up Display）的缩写，这一技术最早运用于战斗机上，飞行员只需平视前方，不丧失对于当前形势的掌控，就能方便地查看飞机的仪表数据。由于其安全便利的特点，之后民航机也都纷纷安装此设备。近年来，一些较为高端的汽车也开始配置HUD。");
                stringBuilder.Append("</p>");
                stringBuilder.Append("<a href =\"#\"><em> 了解更多 </em></a>\"");
                stringBuilder.Append("</li>\"");
            }
        }

        this.lb_show.Text = stringBuilder.ToString();
    }
}