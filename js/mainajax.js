/// <reference path="../hyajax/hymainajax_gis.aspx" />
/// <reference path="../hyajax/hymainajax_gis.aspx" />
/// <reference path="../hyajax/hymainajax_gis.aspx" />
//��������ajax
var xmlHttp;
//�ж���������Ͳ���������
//IE
if (window.ActiveXObject) {
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
}
else if (window.XMLHttpRequest) {
    xmlHttp = new XMLHttpRequest();
}

//����gisid��ȡgis����
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





