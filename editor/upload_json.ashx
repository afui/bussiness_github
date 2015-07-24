<%@ webhandler Language="C#" class="Upload" %>

/**
 * KindEditor ASP.NET
 *
 * 本ASP.NET程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;

public class Upload : IHttpHandler
{
	private HttpContext context;

	public void ProcessRequest(HttpContext context)
	{
		String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);
		
		//文件保存目录路径
        String savePath = "../upload/";

		//文件保存目录URL
        String saveUrl = aspxUrl + "../upload/";

		//定义允许上传的文件扩展名
		Hashtable extTable = new Hashtable();
		extTable.Add("image", "gif,jpg,jpeg,png,bmp");
		extTable.Add("flash", "swf,flv");
		extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		//最大文件大小
		int maxSize = 50000000;   //50M
		this.context = context;

		HttpPostedFile imgFile = context.Request.Files["imgFile"];
		if (imgFile == null)
		{
			showError("请选择文件。");
		}

		String dirPath = context.Server.MapPath(savePath);
		if (!Directory.Exists(dirPath))
		{
			showError("上传目录不存在。");
		}

		String dirName = context.Request.QueryString["dir"];
		if (String.IsNullOrEmpty(dirName)) {
			dirName = "image";
		}
		if (!extTable.ContainsKey(dirName)) {
			showError("目录名不正确。");
		}

		String fileName = imgFile.FileName;
		String fileExt = Path.GetExtension(fileName).ToLower();

		if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
		{
			showError("上传文件大小超过限制。");
		}

		if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
		{
			showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
		}

		//创建文件夹
		dirPath += dirName + "/";
		saveUrl += dirName + "/";
		if (!Directory.Exists(dirPath)) {
			Directory.CreateDirectory(dirPath);
		}
		String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
		dirPath += ymd + "/";
		saveUrl += ymd + "/";
		if (!Directory.Exists(dirPath)) {
			Directory.CreateDirectory(dirPath);
		}

		String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
		String filePath = dirPath + newFileName;

		imgFile.SaveAs(filePath);
        
        SmallPic(filePath, 800);  //800图片宽度 

		String fileUrl = saveUrl + newFileName;

		Hashtable hash = new Hashtable();
		hash["error"] = 0;
		hash["url"] = fileUrl;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	private void showError(string message)
	{
		Hashtable hash = new Hashtable();
		hash["error"] = 1;
		hash["message"] = message;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	public bool IsReusable
	{
		get
		{
			return true;
		}
	}
    
    /// <summary>  
    /// 按比例缩小图片，自动计算高度  
    /// </summary>  
    /// <param name="strOldPic">源图文件名(包括路径)</param>  
    /// <param name="strNewPic">缩小后保存为文件名(包括路径)</param>  
    /// <param name="intWidth">缩小至宽度</param>  
    public void SmallPic(string PicPath, int intWidth)
    {

        System.Drawing.Bitmap objPic, objNewPic;
        try
        {
            objPic = new System.Drawing.Bitmap(PicPath);
            if (objPic.Width > intWidth)
            {
                double tempbl = (double)objPic.Width / objPic.Height;
                int intHeight = Convert.ToInt32(Convert.ToDouble(intWidth) / tempbl);
                objNewPic = new System.Drawing.Bitmap(objPic, intWidth, intHeight);
                objPic.Dispose();
                //objNewPic.Save(PicPath);
                SaveAsJPEG(objNewPic, PicPath, 90);  //90图片压缩品质
                objNewPic.Dispose();
            }
            else
            {
                objPic.Dispose();
            }
        }
        catch (Exception exp) { throw exp; }
        finally
        {
            objPic = null;
            objNewPic = null;
        }
    }



    /// <summary>
    /// 保存为JPEG格式，支持压缩质量选项
    /// </summary>
    /// <param name="bmp"></param>
    /// <param name="FileName"></param>
    /// <param name="Qty"></param>
    /// <returns></returns>
    public static bool SaveAsJPEG(System.Drawing.Bitmap bmp, string FileName, int Qty)
    {
        try
        {
            System.Drawing.Imaging.EncoderParameter p;
            System.Drawing.Imaging.EncoderParameters ps;

            ps = new System.Drawing.Imaging.EncoderParameters(1);

            p = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, Qty);
            ps.Param[0] = p;

            bmp.Save(FileName, GetCodecInfo("image/jpeg"), ps);

            return true;
        }
        catch
        {
            return false;
        }

    }
    /// <summary>
    /// 保存JPG时用
    /// </summary>
    /// <param name="mimeType"></param>
    /// <returns>得到指定mimeType的ImageCodecInfo</returns>
    private static System.Drawing.Imaging.ImageCodecInfo GetCodecInfo(string mimeType)
    {
        System.Drawing.Imaging.ImageCodecInfo[] CodecInfo = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();
        foreach (System.Drawing.Imaging.ImageCodecInfo ici in CodecInfo)
        {
            if (ici.MimeType == mimeType) return ici;
        }
        return null;
    } 


}
