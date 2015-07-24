///******************************************************??? 
///	FileName: register.js
///	Action: 会员注册页面JS处理文件
///	Copyright(c) 2013-2015 合益科技公司技术开发部
///	Writer: fangyong
///	Create Date: 2013-08-16
///******************************************************???

var rightIcon="../images/err.gif"
var rightIcons="../images/mark.gif";
var rightIcond="../images/success.gif";
var loading="../images/loading.gif";

var txtjbo=new  Array("txtLoginName","txtPassword","txtOldPassword","txtTrueName");
function $(id){return document.getElementById(id)}
function getobj(objName){
   if ($) {
      return eval('$("'+ objName +'")');
   }else {
      return eval('document.all["'+ objName +'"]');
   }
}

function oo(){$("yc").style.display="none"}

//得到焦点
for(var i=0;i<txtjbo.length;i++){ 
   $(txtjbo[i]).onfocus =function (){
      for (var j=0;j<txtjbo.length;j++){
         if (txtjbo[j]==event.srcElement.id){postobj(j);}
      }
   }
}

function postobj(num){
   obj = "lbl_"+txtjbo[num];
   $(obj).innerHTML =ZeXs[num];
}


function init()
{
}
//失去焦点
for(var i=0;i<txtjbo.length;i++){ 
   $(txtjbo[i]).onblur =function (){
      for(var j=0;j<txtjbo.length;j++){
         if (txtjbo[j]==event.srcElement.id){postob(j);}
      }
   }
}

function postob(num){
   $(txtjbo[num]).value=$(txtjbo[num]).value.replace(/\s/g,'');
   obj = "lbl_"+txtjbo[num];
   if ($(obj).innerHTML!=""){
      $(obj).innerHTML=""
   }else {
      $(obj).innerHTML=ok;
   }
}

///用户
 $("txtLoginName").onblur =function (){
   chkname("lbl_txtLoginName",$("txtLoginName"))
 }
 
//密码
$("txtPassword").onblur=function (){
    txtPassword()
}

//确认密码
$("txtOldPassword").onblur=function (){
    txtOldPassword()
}

////验证码
//$("txtCheckCode").onblur=function (){
//    txtCheckCode()
//}

//真实姓名
$("txtTrueName").onblur=function (){
    txtTrueName()
}

//提交
function submitform() {
    var txtbernem = new Array()
    txtbernem[0] = txtLoginName()                    //用户名称
    txtbernem[1] = txtPassword()                     //密码
    txtbernem[2] = txtOldPassword()                  //确认密码
    //txtbernem[3] = txtCheckCode()                    //验证码
    txtbernem[3] = txtTrueName()                     //真实姓名
    var flag = -1;
    for (i = 0; i <= 3; i++) {
        if (txtbernem[i] == false) {
            flag = flag + " " + i;
        }
    }

    //alert(flag)
    if (flag == -1) {
        //全部通过
        document.getElementById("btnSave").click();
        //document.forms[0].btnSave.click();
        return true;
    }
    else {
        //alert("您的输入有误，请检查重新输入！")
        
        return false;
    }
}

//$("btnSave").onclick=function (){
//   var txtbernem=new Array()
//   txtbernem[0]=txtLoginName()                    //用户名称
//   txtbernem[1]=txtPassword()                     //密码
//   txtbernem[2]=txtOldPassword()                  //确认密码
//   txtbernem[3]=txtEmail()                        //邮箱
//   txtbernem[4]=txtMobilePhone()                  //手机
//   txtbernem[5]=txtCheckCode()                    //验证码
//   txtbernem[6]=txtTrueName()                     //真实姓名
//   var flag=-1;
//   for (i=0;i<=6;i++){
//      if (txtbernem[i]==false){
//         flag= flag+" " + i;
//      }
//   } 
//   
//   //alert(flag)
//   if(flag == -1)
//   {
//       //全部通过
//       document.forms[0].btnSave.click();
//       return true;
//   }
//   else
//   {
//      alert("您的输入有误，请检查重新输入！")
//      return false;
//   }
// 
//}

//会员名称
function txtLoginName(){ 
   if ($(txtjbo[0]).value.replace(/\s/g,'')==""){
       $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>账号不能为空，请重新输入手机号码！</font>";
      return false;
   }
   else if ($(txtjbo[0]).value.length != 11){
       $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>手机号码11位数字！</font>";
     return false ;
   }
   else if (ignoreSpaces($(txtjbo[0]).value.replace(/\s/g,''))==1||ignoreSpaces($(txtjbo[0]).value.replace(/\s/g,''))==2){
       $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>账号不能包含中文或是特殊符号！</font>";
      return false;
   }else if ($("Lname").value.replace(/\s/g,'')=="1" ||$("Lname").value.replace(/\s/g,'')==""){
      $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>该账号已存在！</font>";
      return false;
   } else {
      $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>输入符合规范！</font>";
      return true;
  }
}

//会员重名
function chkname(obj,Name){
    $(obj).innerHTML = "<img src="+loading+" align=\"absmiddle\"> 检测中，请稍候……";
    var ajax = new list("name="+Name.value,"0");
    ajax.onSuccess = function () {
        $(obj).innerHTML = xmlHttp.responseText;
        if (xmlHttp.responseText == "1") {
            $(obj).innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>该账号已存在！</font>";
            $("Lname").value = "1";
        } else if (xmlHttp.responseText == "2") {
            $(obj).innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>账号不能为空，请重新设置账号！</font>";
            $("Lname").value = "2";
        }
        else if (Name.value.length != 11) {
            $(obj).innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>手机号码11位数字！</font>";
        }
        else if (ignoreSpaces(Name.value) == 1 || ignoreSpaces(Name.value) == 2) {
            $("lbl_txtLoginName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>账号不能包含中文或是特殊符号！</font>";
        } else if (xmlHttp.responseText == "0") {
            $("Lname").value = "0";
            $(obj).innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>该账号可以注册！</font>";
        }
    }
    ajax.Init();   
}

//密码
function txtPassword(){
   if($(txtjbo[1]).value.replace(/\s/g,'')==""){
       $("lbl_txtPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>密码不能为空，请重新设置密码！</font>";
      return false
   }else if ($(txtjbo[1]).value.length<=5){
      $("lbl_txtPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>密码长度不能小于6，请重新设密码！</font>";
      return false
  } else if ($(txtjbo[1]).value.length >= 11) {
      $("lbl_txtPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>密码长度不能大于10，请重新设密码！</font>";
      return false
   }else if($(txtjbo[1]).value.replace(/\s/g,'')==$(txtjbo[0]).value.replace(/\s/g,'')){
      $("lbl_txtPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>为安全起见，密码不能与会员登录名相同！</font>";
      return false
//   }else if(isNumberContinue($(txtjbo[1]).value.replace(/\s/g,'')) == 1){
//      $("lbl_txtPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>为安全起见，密码不能用同一个数字或字母以及相连的数字或字母！</font>";
//      return false
   }else{
      $("lbl_txtPassword").innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>输入符合规范！</font>";
      return true
   }
}

//密码2
function txtOldPassword(){
   if ($(txtjbo[2]).value.replace(/\s/g,'')==""){
       $("lbl_txtOldPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>确认密码不能为空，请重新设置！</font>";
      return false
   }else if ($(txtjbo[2]).value.replace(/\s/g,'')!=$(txtjbo[1]).value.replace(/\s/g,'')){
      $("lbl_txtOldPassword").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>密码与确认密码输入不一致，请重新设置密码！</font>";
      return false
   }else{
      $("lbl_txtOldPassword").innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>输入符合规范！</font>";
      return true
   }
}


//验证码
//function txtCheckCode(){

//   //alert($(txtjbo[4]).value.replace(/\s/g,''));

//   if ($(txtjbo[3]).value.replace(/\s/g,'') == cookie("ValidateCode")){
//       $("lbl_txtCheckCode").innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>验证码正确！</font>";
//      return true;
//   }else {
//      $("lbl_txtCheckCode").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>确认验证码不符合规范，请重新设置验证码！</font>";
//      return false;
//   }
//}

//真实姓名
function txtTrueName(){
   if ($(txtjbo[3]).value!=""){
//      if(!checkZw($(txtjbo[6]).value)){
//          $("lbl_txtTrueName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>确认真实姓名输入有误，请重新设置！</font>"
//         return false
//      }else{
         $("lbl_txtTrueName").innerHTML = "<img src=" + rightIcond + " align=\"absmiddle\"> <font color=#999999>输入符合规范！</font>";
         return true
      }  
   else{
     $("lbl_txtTrueName").innerHTML = "<img src=" + rightIcon + " align=\"absmiddle\"> <font color=#FF0000>确认真实姓名不能为空，请重新设置！</font>";
      return true
   }
}

//提示 
var ok="<img src="+rightIcond+" align=\"absmiddle\"><font color=#999999>输入符合规范</font>"
var title="<p> <img src="+rightIcons+" border=\"0\">";
var titles="</p>"
var ZeXs=new Array()
ZeXs[0] = title + "登录账号是11个数字的手机号码" + titles;
ZeXs[1]=title+"密码为6到10位字符或数字"+titles;
ZeXs[2]=title+"请再输入一遍您上面填写的密码"+titles;
//ZeXs[3] = title + "请输入验证码" + titles;
ZeXs[3] = title + "请输入真实姓名,注册后将无法修改" + titles;
