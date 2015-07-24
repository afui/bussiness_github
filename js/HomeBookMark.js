﻿// JScript 文件

function addBookmark(title) {
    var url = parent.location.href;
    if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
    } else if (document.all) {
        window.external.AddFavorite(url, title);
    } else if (window.opera && window.print) {
        return true;
    }
}

function SetHome(obj, vrl) {
    try {
        obj.style.behavior = 'url(#default#homepage)'; obj.setHomePage(vrl);
    }
    catch (e) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e) {
                alert("抱歉！您的浏览器不支持直接设为首页。请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为“true”，点击“加入收藏”后忽略安全提示，即可设置成功。");
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', vrl);
        }
    }
}

//列表上全选
/* 复选框：seleall、docids */
function CheckAll() {
    for (var i = 0; i < document.forms[0].elements.length; i++) {
        var e = document.forms[0].elements[i];
        //alert("e.name:"+e.name+"  i=: "+i)
        if (e.name == 'docids')
            e.checked = document.forms[0].seleall.checked;
    }
}
function GetDocUnidListNew() {
    var str = ""
    var x = 0;
    var j = 0;
    var form = document.forms[0];
    for (var i = 0; i < form.elements.length; i++) {
        if (form.elements[i].type == "checkbox") {
            if (form.elements[i].name == "docids") {
                //不能超过900个
                if (form.elements[i].checked && j++ < 900) {
                    //                 if((j % 3)==0)str += "&";
                    str = str + "," + form.elements[i].value;
                }
            }
        }
    }
    return (str.substring(1, str.length));
}
//新建
function AddInfo(ls_table) {
    window.location = ls_table + '?op=add&rnd=' + Math.random() + '&url=' + window.location.href;
}

//删除
function DelInfo() {
    var s = GetDocUnidListNew();

    var d = dialog({
        title: '提示',
        content: '是否确定要进行删除？',
        okValue: '确定删除',
        ok: function () {
            document.getElementById('txtuids').value = s;
            if (s == "") {
                var p = dialog({
                    title: '提示',
                    content: '请选择要删除的记录！'
                });
                p.show();
                return;
            }
            document.getElementById('btndelinfo').click();
        },
        cancelValue: '不删除',
        cancel: function () { }
    });
    d.show();
}
function CshmmInfo(ls_uid) {
    sConfirm = confirm('是否确定要进行初始化密码？');
    if (sConfirm == false)
    { return false; }
    document.getElementById('txtuids').value = ls_uid;
    document.getElementById('btncshmminfo').click();


}
