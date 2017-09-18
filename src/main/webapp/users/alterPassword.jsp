<%@ page language="java"   pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户修改密码</title>
<link href="/shopping/css/index/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
</style>

<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	#users .border{
		width:7px; height:100px; background-repeat:repeat-y;
	}
	#users #use{float:left;}
	#users #use p{margin:20px 0px 10px 12px;}
	.dingdan{background-image:url(/shopping/images/users/users-mid.jpg); height:100px; padding:10px;}
	.dingdan p{border-bottom:1px dashed #cccccc; margin-bottom:6px; padding-left:20px; padding-bottom:6px;}
	.dingdan p a{color:#000000;}
	#xinxi{padding:15px;}
	#xinxi p{margin:8px 0px;}
	#xinxi table td{height:25px; text-align:center;border-bottom:1px solid #E5E5E5; border-right:1px solid #E5E5E5;}
</style>
<style type="text/css">
	.mima{
		margin:20px 0px;
		margin-left:120px;
		height:22px;
		line-height:22px;
	}
	.mima span{
		color:#000000;
		margin:0px 10px;
	}
	.mima span input{
		border:1px solid #839BB3;
		width:180px;
	}
	.mima span #sub{
		margin:0px;
		padding:0px;
		background-image:url(/shopping/images/users/subbg.jpg);
		width:47px;
		height:20px;
		border:0px;
		color:#FFFFFF;
		padding-left:5px;
	}
</style>
<script type="text/javascript"  src="/shopping/js/jquery.js"></script>
<script type="text/javascript">
$("document").ready(function (){
		$("input[type='password']").val("");
		$("#textForm").submit(function (){
			var upass =$("#upass").val();
			var newpass = $("#newpass").val();
			var newpass2= $("#newpass2").val();
 			if(upass.length<6 || upass>12){
				$("#upassError").html("<font color='#FF0000'> 您输入的密码长度应该在6~12位之间</font>");
				return false;
			}else{
				$("#upassError").html("");
			}
			if(newpass.length<6 || newpass.length>12){
				  $("#newpassError").html("<font color='#FF0000'> 您输入的密码长度应该在6~12位之间</font>");
				  return false;
			}else{
				$("#newpassError").html("");
			}
			if(newpass2!=newpass){
				$("#newpass2Error").html("<font color='#FF0000'>两次密码输入不一致，您重新输入</font>");
				return false;
			}else{
				$("#newpass2Error").html("");
			}
			return true;
		});
	});

</script>

</head>

<body>
<div id="right" style="width:780px; margin-bottom:10px;">
        	<div style="background-image:url(/shopping/images/users/xiangxi-center-top.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	<img style="float:left" src="/shopping/images/users/xiangxi-left-top.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-top.jpg" />
                    <div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/Snap5.jpg);background-repeat:repeat-y;padding-bottom:30px;">
			 <div id="xinxi">
                     	 <h1 style="border-bottom:2px solid #cccccc;">
                                <span style="border-bottom:2px solid #FF0000;font-size:14px">修改密码</span>
                     	 </h1>
                         <form action="/shopping/users.do" method="post" id="textForm">
                     	 <div class="mima">
                         	<span>我的旧密码：</span>
                            <span style="margin-left:42px;"><input type="password" name="upass" id="upass"/></span>
                            <span id="upassError">长度在6~12位之间</span>
                     	 </div>
                         <div class="mima">
                         	<span>请输入新密码：</span>
                            <span style="margin-left:30px;"><input type="password" name="newpass" id="newpass" /></span>
                            <span id="newpassError">密码长度在6~12位之间</span>
                         </div>
                         <div class="mima" style="margin-bottom:0px;">
                         	<span style="float:left">请再次输入新密码：</span>
                            <span style="float:left"><input type="password" name="upass2" id="newpass2" /></span>
                            <span id="newpass2Error">&nbsp;&nbsp;请再次确认您的新密码</span>
                            <input type="hidden" name="status" value="updPassword" />
                            <input type="hidden" name="uid" value="${sessionScope.user.uid}" />
                          
                         </div>
                         <div class="mima">
                         	 <span style="float:left"><input type="submit" id="sub" value="确定" />
                         </div>
                         </form>
              		</div>
					<div style="clear:both"></div>
            </div>
            <div style="background-image:url(/shopping/images/users/xiangxi-center-bot.jpg);background-repeat:repeat-x;height:8px;clear:both">
                	<img style="float:left" src="/shopping/images/users/xiangxi-left-bot.jpg" />
                    <img style="float:right" src="/shopping/images/users/xiangxi-right-bot.jpg" />
                    <div style="clear:both"></div>
            </div>
        </div>
</body>
</html>


