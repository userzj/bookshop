<%@ page language="java"   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
</head>

<body>
        <div id="left" style="width:180px;">
        	<div>
            	<div style="background-image:url(/shopping/images/users/top.jpg); width:180px; height:35px;">
            	  <h4 style="color:#990000; font-size:14px; padding:6px 0px 0px 22px;">${sessionScope.user.ulogin}</h4>
            	</div>
                <div id="users">
                   <div class="border" style="background-image:url(/shopping/images/users/left.jpg); float:left;"></div>
                   <div id="use">
                        <p>您好！欢迎光临Gogo商城！</p>
                        <p>您现在是：<span style="color:#990000;">普通会员</span></p>
                   </div>
                   <div class="border" style="background-image:url(/shopping/images/users/right.jpg); float:right;"></div>
                </div>
                <div style="background-image:url(/shopping/images/users/usersMan-bot-bg.jpg);background-repeat:repeat-x;height:11px;clear:both">
                	<img style="float:left" src="/shopping/images/users/usersMan-bot-left.jpg" />
                    <img style="float:right" src="/shopping/images/users/usersMan-bot-right.jpg" />
                    <div style="clear:both"></div>
                </div>
            </div>
            <div style="margin:10px 0px;">
            	<div style="background-image:url(/shopping/images/users/users-dingdan-Top.jpg); height:41px;"></div>
                <div class="dingdan">
                	<p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/users/userForder.jsp"  target="right">我的订单</a>
                    </p>
                    <p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/users/test.jsp"  target="right">账户余额</a>
                    </p>
                    <p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/users/privilege.jsp" target="right">我的优惠券</a>
                    </p>
                </div>
                <div style="background-image:url(/shopping/images/users/users-bot.jpg);background-repeat:no-repeat;height:3px;"></div>
            </div>
            <div style="margin:10px 0px;">
            	<div style="background-image:url(/shopping/images/users/users-info-Top.jpg); height:41px;"></div>
                <div class="dingdan">
                	<p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/users/alterPassword.jsp" target="right">修改密码</a>
                    </p>
                    <p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/users/usersInfo.jsp" target="right">编辑个人资料</a>
                   	</p>
                </div>
                <div style="background-image:url(/shopping/images/users/users-bot.jpg); background-repeat:no-repeat; height:3px;"></div>
            </div>
            <div style="margin:10px 0px;">
            	<div style="background-image:url(/shopping/images/users/users-info-Top.jpg); height:41px;"></div>
                <div class="dingdan" style="height:50px;">
                	<p>
                    	<span style="color:#990000; font-size:18px; margin-right:6px;">▪</span>
                        <a href="/shopping/usersAction_exit.action"  target="_parent">退出管理</a>
                    </p>
                </div>
                <div style="background-image:url(/shopping/images/users/users-bot.jpg); background-repeat:no-repeat; height:3px;"></div>
            </div>
        </div>
       
</body>
</html>

