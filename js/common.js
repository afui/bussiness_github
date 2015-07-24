///******************************************************???
///	FileName: common.js
///	Action: JS处理文件
///	Copyright(c) 2013-2015 合益科技公司技术开发部
///	Writer: fangyong
///	Create Date: 2013-08-16
///******************************************************???

/* 点击验证码图片刷新验证码 */
function showimg(im) {
    im.src = "../include/ValidateImg.aspx?" + new Date;
}

//立即去邮箱收邮件
function submitmail() {
    window.open(document.getElementById('txtemailurl').value,"","","");

}


//数字检测
function isNumberContinue(str){
   var patn1 = /^[0-9_]+$/;
   var ascendNumber = 0;
   var descendNumber = 0;
   for (var i = 1; i < str.length; i++){
      if (str.charAt(i).charCodeAt() != (str.charAt(i - 1).charCodeAt() + 1)) {
         ascendNumber = 1;
         break;
      }
   }
   for (i = 0; i < (str.length - 1); i++) {
      if (str.charAt(i).charCodeAt() != (str.charAt(i + 1).charCodeAt() + 1)){
         descendNumber = 1;
         break;
      }
   }
   if (descendNumber == 0 || ascendNumber == 0) 
      return 1; 
   else 
      return 0;
}

//邮政
function isPostalCode(s){
   var patrn = /^[0-9]{6}$/;;
   if (!patrn.exec(s)) return false
   return true
}

//验证Email格式
function ValidateEmail(source){
   var patrn = /^[_a-zA-Z0-9\-\.]+@([\-_a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
   return patrn.exec(source);
}

//数值检测
function isNumber(name){ 
   if (name.length   ==   0)
      return false;
   for(i=0; i< name.length; i++){ 
      if (name.charAt(i)   <   "0"   ||   name.charAt(i)   >   "9")
         return false;
      }
      return true;
}

function isValueSize(values,flag)
{   
    if(flag=="1")
    {
        var minValue=0;
        var maxValue=9999999;
        if(parseFloat(values)<parseFloat(minValue)||parseFloat(values)>parseFloat(maxValue))
          return false;
        else
            return true;
    }else{
        if(values<0||values>9999999)
            return false;
        else
            return true;
    }
}
// 手机
function checkMobile(s){   
   var regu =/^1[0-9]{10}$/;
   return regu.exec(s)
}

// 只能输入中文
function checkZw(s){   
   var reg=/^[\u4E00-\u9FA5]+$/;
   return reg.exec(s)
}

//空格 中文  符号
function ignoreSpaces(string) {
   var temp = "";
   var badchar  =  ';|<>`&!*(~^)-#?   :"/$=\\'+"'"; 
   var textchar;  
   string = '' + string;
   splitstring = string.split(" ");
   for (i = 0; i < splitstring.length; i++)
      temp += splitstring[i];
   if(escape(string).indexOf("%u")!=-1){      
          return 1;   
   }   
   for (var i  = 0; i< temp.length;i++)
   {   
       textchar   = temp.charAt(i);   
       if (badchar.indexOf(textchar)>= 0){   
          return 2;   
       }   
   }       
   return temp;
}

//过滤字符串
function onKeyUp(e, a) {
   e = e || event;
   if (e.keyCode != 37 && e.keyCode != 39){
      document.getElementById(a).value = document.getElementById(a).value.replace(/\D/g, '');
   }
}

function $(id){return document.getElementById(id)}

//验证
function cookie(name){    
   var cookieArray=document.cookie.split("; "); //得到分割的cookie名值对    
   var cookie=new Object();    
   for (var i=0;i<cookieArray.length;i++){    
      var arr=cookieArray[i].split("=");       //将名和值分开    
      if(arr[0]==name)return unescape(arr[1]); //如果是指定的cookie，则返回它的值    
   } 
   return ""; 
}  

//会员收藏
function SaveFavorites(){
   var ID= $("ID").value;
   var ajax=new list("","9") 
   ajax.onSuccess = function(){
      if (xmlHttp.responseText=="ok"){
         alert("提交成功");
      }
	  else{
	     alert(xmlHttp.responseText);
	  }
   }
}


/// <summary>
/// 获取模板
/// </summary>
/// <param name="parame">传递的参数</param>
/// <param name="ID">服务器处理程序</param>
/// <returns></returns>
function list(parame,ID){ 
   var thisTHost = top.location.host;
   var obj = this;
   //this.state ="d";
   this.Init = function () {
       xmlHttp = false;
       if (window.XMLHttpRequest) {
           xmlHttp = new XMLHttpRequest();  //　非IE　浏览器
       }
       else if (window.ActiveXObject) {
           try { //IE
               xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); //较新版本的IE
           }
           catch (e) {
               try {
                   xmlHttp = new ActiveXOBject("Microsoft.XMLHTTP"); //旧版本IE
               }
               catch (e)
          { }
           }
       }
       else {
           window.alert("不能创建　XMLHttpRequest对象，无法应用Ajax");
           return false;
       }
       //var url="http://192.168.0.131:8080/Control/Ajax.ashx?"
       var url = "http://" + thisTHost + "/tools/Handler.ashx?"
       url += parame + "&action=" + ID;
       //window.alert(url);
       xmlHttp.open("get", url, true);
       xmlHttp.onreadystatechange = function () {
           if (xmlHttp.readyState == 4) {
               if (xmlHttp.status == 200) {
                   obj.onSuccess();
               }
           }
       }
       xmlHttp.send(null);
   } 

}


function DrawImage(ImgD,w,h){  
    var image=new Image();    
    image.src=ImgD.src;    
    if(image.width>0 && image.height>0){       
        if(image.width/image.height>= w/h){    
            if(image.width>w){    
                ImgD.width=w;    
            }else{    
                ImgD.width=image.width;    
                ImgD.height=image.height;    
            }   
			if(image.height>h){    
                ImgD.height=h;      
            }else{    
                ImgD.width=image.width;    
                ImgD.height=image.height;    
            }     
            ImgD.alt=image.width+"×"+image.height;  
			  
        }else{    
          
            ImgD.alt=image.width+"×"+image.height;    
        }    
    }    
} 




