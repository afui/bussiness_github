using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class showExportList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder stringBuilder = new StringBuilder();
        dt_expert dtExpert = new dt_expert();
        DataSet dt = dtExpert.GetList("");
        DataTable dtImg = new DataTable();
        HyFileatt hyFileatt = new HyFileatt();
        //控制数据条数
        int s = 0;
        if (dt.Tables[0].Rows.Count > 0)
        {
            //分行
            int n = 0;
            if ((dt.Tables[0].Rows.Count) % 4 == 0)
            {
                n = (dt.Tables[0].Rows.Count) / (4);
            }
            else
            {
                n = ((dt.Tables[0].Rows.Count) / (4)) + 1;
            }
            //构造列
            for (int i = 0; i < n; ++i)
            {
                stringBuilder.Append("<ul>");
                //控制循环条件 
                int m = 0;
                if ((dt.Tables[0].Rows.Count - (i * 4)) > 4)
                {
                    m = 4;
                }
                else
                {
                    m = dt.Tables[0].Rows.Count - (i * 4);
                }
                for (int j = 0; j < m; j++)
                {
                    dtImg = hyFileatt.Getdocsfm(dt.Tables[0].Rows[s]["ID"].ToString());
                    stringBuilder.Append("<li><a href=\"showExportMain.aspx?docid=" + dt.Tables[0].Rows[s]["ID"].ToString() + "&rend=" + System.Guid.NewGuid().ToString() + "\">");
                    if (dtImg.Rows.Count > 0)
                    {
                        stringBuilder.Append("<img src=\"" + dtImg.Rows[0]["hy_filepath"].ToString() + "\">");
                    }
                    else
                    {
                        stringBuilder.Append("<img src=\"Images/Img.jpg\">");
                    }
                    dtImg.Clear();
                    stringBuilder.Append("<dt align=\"center\" >" + dt.Tables[0].Rows[s]["dt_name"].ToString() + "</dt></a></li>");
                    s++;
                }
                stringBuilder.Append("</ul>");
            }
        }
        this.lb_show.Text = stringBuilder.ToString();
    }
}