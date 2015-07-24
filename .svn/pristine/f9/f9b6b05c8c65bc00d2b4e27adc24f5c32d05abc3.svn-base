function GetValues()
{ 
    var str_v_all="";
    var str_t_all="";
    var str_v="";
    var str_t="";    
    for (var i=0;i<TreeStructWin.document.getElementsByTagName("input").length;i++)
    {
        var e=TreeStructWin.document.getElementsByTagName("input")[i];
        //alert(e.text);
        //alert(str.lastIndexOf("+"+e.text));
        var v_temp = e.value.split("|");
        str_v = v_temp[0];
        str_t = v_temp[1];
        if (e.type == "checkbox" && (e.name.indexOf("_subuser")!=-1) && e.checked && str_v_all.lastIndexOf("+"+e.value)<0) 
        {
            str_v_all=str_v_all+"+"+str_v;
            str_t_all=str_t_all+"+"+str_t;
        }
    }
    str_v_all=str_v_all.substring(1,str_v_all.length)
    str_t_all=str_t_all.substring(1,str_t_all.length)
    return str_v_all+"|"+str_t_all;
}

function ExtractDeptnames_Public()
{ 
    var str="";
    for (var i=0;i<TreeStructWin.document.getElementsByTagName("input").length;i++)
    {
        var e=TreeStructWin.document.getElementsByTagName("input")[i];
        if (e.type == "checkbox" && e.checked && e.name!="SelAll") 
            str=str+"+"+e.id;
    }
    return (str.substring(1,str.length));
}

function ExtractDeptids_Public()
{ 
    var str="";
    for (var i=0;i<TreeStructWin.document.getElementsByTagName("input").length;i++)
    {
        var e=TreeStructWin.document.getElementsByTagName("input")[i];
        if (e.type == "checkbox" && e.checked && e.name!="SelAll") 
            str=str+"+"+e.value;
    }
    return (str.substring(1,str.length));
}

/////以下是老方法，未删除未使用

function ExtractChValues()
{ 
    var str="";
    for (var i=0;i<TreeStructWin.document.getElementsByTagName("input").length;i++)
    {
        var e=TreeStructWin.document.getElementsByTagName("input")[i];
        //alert(e.text);
        //alert(str.lastIndexOf("+"+e.text));
        if (e.type == "checkbox" && (e.name.indexOf("_subuser")!=-1) && e.checked && str.lastIndexOf("+"+e.text)<0) 
            str=str+"+"+e.text;
    }
    return (str.substring(1,str.length));
}

function ExtractSysValues()
{ 
    var str="";
    for (var i=0;i<TreeStructWin.document.getElementsByTagName("input").length;i++)
    {
        var e=TreeStructWin.document.getElementsByTagName("input")[i];
        //alert(e.value);
        //alert(str.lastIndexOf("+"+e.value));
        if (e.type == "checkbox" && (e.name.indexOf("_subuser")!=-1) && e.checked && str.lastIndexOf("+"+e.value)<0) 
            str=str+"+"+e.value;
    }
    return (str.substring(1,str.length));
}

function ExtractDeptnames()
{ 
 var str="";
 for (var i=0;i<TreeStructWin.document.forms[0].elements.length;i++)
 {
  var e=TreeStructWin.document.forms[0].elements[i];
  if (e.type == "checkbox" && e.checked) 
     str=str+"+"+e.text;
 }
 return (str.substring(1,str.length));
}

function ExtractDeptids()
{ 
 var str="";
 for (var i=0;i<TreeStructWin.document.forms[0].elements.length;i++)
 {
  var e=TreeStructWin.document.forms[0].elements[i];
  if (e.type == "checkbox" && e.checked) 
     str=str+"+"+e.value;
 }
 return (str.substring(1,str.length));
}