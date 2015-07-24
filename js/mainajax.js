/// <reference path="../hyajax/hymainajax_gis.aspx" />
/// <reference path="../hyajax/hymainajax_gis.aspx" />
/// <reference path="../hyajax/hymainajax_gis.aspx" />
//主表单调用ajax
var xmlHttp;
//判断浏览器类型并创建对象
//IE
if (window.ActiveXObject) {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
}
else if (window.XMLHttpRequest) {
    xmlHttp = new XMLHttpRequest();
}

//依据gisid获取gis坐标
function hymainajax_gis(strId, strState) {
    if (strId == "" || strState == "") {
        return false;
    }
    else {
        url = "../hyajax/hymainajax_gis.aspx?strId=" + strId + "&Rnd=" + Math.random();
    }

    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var text = xmlHttp.responseText;
            var array = text.split("#");
            var imgPath = "";
            if (strState == "1") {
                imgPath = "url(images/sos.png) no-repeat";
            } else if (strState == "0") {
                imgPath = "url(images/zi.png) no-repeat";
            }
            document.getElementById('bg_sos').style.left = array[0] + "px";
            document.getElementById('bg_sos').style.top = array[1] + "px";
            document.getElementById('bg_sos').style.background = imgPath;
        }
    }
    xmlHttp.send();
}





