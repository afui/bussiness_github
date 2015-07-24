using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft;
using TPortalClass;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getExport()
    {
        StringBuilder stringBuilder = new StringBuilder();
        dt_expert dtExpert = new dt_expert();
        DataSet dt = dtExpert.GetListTop(10, "");
        DataTable dtImg = new DataTable();
        HyFileatt hyFileatt = new HyFileatt();

        if (dt.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
            {
                dtImg = hyFileatt.Getdocsfm(dt.Tables[0].Rows[i]["ID"].ToString());
                stringBuilder.Append("<li><a  target=\"_blank\"  href=\"showExportMain.aspx?docid=" + dt.Tables[0].Rows[i]["ID"].ToString() + "&rend=" + System.Guid.NewGuid().ToString() + "\">");
                if (dtImg.Rows.Count > 0)
                {
                    stringBuilder.Append("<img src=\"" + dtImg.Rows[0]["hy_filepath"].ToString() + "\">");
                }
                else
                {
                    stringBuilder.Append("<img src=\"Images/Img.jpg\">");
                }
                dtImg.Clear();
                stringBuilder.Append("</a></li>");
            }
        }
        return stringBuilder.ToString();
    }
}