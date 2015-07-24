/*返回顶部===需要结合jquery一起使用===*/
var lastScrollY = 0;
$(function () {
    $("body").prepend("<a id=\"gotop\" class=\"gotop\" href=\"#\" title=\"返回顶部\" onfocus=\"this.blur()\" onclick=\"window.scrollTo(0,0);\"></a>");
    window.setInterval("gotop()", 1);
});
function gotop() {
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop;
    else if (document.body)
        diffY = document.body.scrollTop
    else
    { /*Netscape stuff*/ }
    percent = .1 * (diffY - lastScrollY);
    if (percent > 0) percent = Math.ceil(percent);
    else percent = Math.floor(percent);
    lastScrollY = lastScrollY + percent;
    if (lastScrollY < 100) {
        document.getElementById("gotop").style.display = "none";
    } else {
        document.getElementById("gotop").style.display = "block";
    }
}

function $F(id) {
    //debugger;
    return document.getElementById(id);
}

//objId为A链接的ID前缀，objContId为显示层的ID前缀，Num为当前tab编号,TotalNum所有tab数量
function tabOver(objId, objContId, Num, TotalNum, classNameOn, classNameOff) {
    var tabNum = TotalNum;
    //debugger;
    for (var i = 1; i <= tabNum; i++) {
        var tab = $F(objId + i);
        var tabCont = $F(objContId + i);
        if (i == Num) {
            tabCont.style.display = '';
            tab.className = classNameOn;
        }
        else {
            tabCont.style.display = 'none';
            tab.className = classNameOff;
        }
    }
}


