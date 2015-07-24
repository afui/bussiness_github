<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ifr_rentpic.aspx.cs" Inherits="ifr_rentpic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <script type="text/javascript" src="/tools/fileatt/swfupload/swfupload.js"></script>
    <script type="text/javascript" src="/tools/fileatt/js/handlers.js"></script>
    <script type="text/javascript">
        var swfu;
        window.onload = function () {
            swfu = new SWFUpload({
                // Backend Settings
                upload_url: "/tools/fileatt/uploadPhoto.aspx?type=1",
                post_params: {
                    "ASPSESSID": "",
                    "docid": "<%=ls_fatherid %>",
                    "userid": "<%=ls_userid %>"
                },

                // File Upload Settings
                file_size_limit: "50 MB",
                file_types: "*.jpg;*.jpeg;*.gif;*.bmp;*.png",   //允许上传的文件类型 所有的用*.*
                file_types_description: "所有文件",
                file_upload_limit: "0",    // Zero means unlimited

                // Event Handler Settings - these functions as defined in Handlers.js
                //  The handlers are not part of SWFUpload but are part of my website and control how
                //  my website reacts to the SWFUpload events.
                file_queue_error_handler: fileQueueError,
                file_dialog_complete_handler: fileDialogComplete,
                upload_progress_handler: uploadProgress,
                upload_error_handler: uploadError,
                upload_success_handler: uploadSuccess,
                upload_complete_handler: uploadComplete,

                // Button settings
                button_image_url: "/images/szfytp.png",
                button_placeholder_id: "spanButtonPlaceholder",
                button_width: 119,
                button_height: 30,
                button_text: '',
                button_text_style: '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 12pt; }',
                button_text_top_padding: 1,
                button_text_left_padding: 5,

                // Flash Settings
                flash_url: "/tools/fileatt/swfupload/swfupload.swf", // Relative to this file

                custom_settings: {
                    upload_target: "divFileProgressContainer"
                },
                // Debug Settings
                debug: false
            });
        }
        function DelInfo(ls_id) {
            var s = ls_id;
            var fm = document.forms[0];
            if (s == "") {
                return false;
            }
            sConfirm = confirm('是否确定要进行删除？');
            if (sConfirm == false)
            { return false; }
            fm.txtuids.value = s;
            fm.btndelinfo.click();
        }
        //设置封面
        function szfm(id) {
            var fm = document.forms[0];
            if (id == "") {
                return false;
            }
            fm.txtfmid.value = id;
            fm.btnSzfm.click();
        }
    </script>

    <style type="text/css">
        .pic01 {
            z-index: 1;
            position: absolute;
        }

        .photo_fm {
            width: 30px;
            height: 30px;
            z-index: 8;
            position: relative;
        }

        .option01 {
            position: relative;
            top: 105px;
        }

            .option01 a:link, a:visited {
                color: #1742C1;
                text-decoration: none;
            }

            .option01 a:hover {
                color: #FF9001;
                text-decoration: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;
        </div>
        <div id="content">
            <div id="swfu_container" style="margin: 0px 10px;">
                <div>
                    <span id="spanButtonPlaceholder"></span>&nbsp;<font color="red">注意：图片最多只能上传8张。</font>
                </div>
            </div>
        </div>
        <div id="tdstate" style="display: none; padding-top: 10px">
            <img src="/images/loading.gif" border="0" alt="" />上传中，请稍后......
        </div>
        <div style="padding-top: 10px;">
            <%=LoadingPictures()%>
        </div>
        <div style="display: none;">
            文档ID：<input id="txtdocid" runat="server" value="" /><br />
            删除的IDS：<input id="txtuids" name="txtuids" runat="server" />
            删除：<asp:Button ID="btndelinfo" Text="删除" OnClick="btndelinfo_Click" runat="server" />
            设置的IDS：<input id="txtfmid" runat="server" />
            设置封面：<asp:Button ID="btnSzfm" Text="删除" OnClick="btnSzfm_Click" runat="server" />
        </div>
    </form>
</body>
</html>
