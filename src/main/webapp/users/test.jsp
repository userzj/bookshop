<%@ page language="java"   pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Gogo商场账号管理</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
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
	.bg1{background-color:#ffffff}
	.bg{background-color:#E8F6FF}
	.click{background-color:#ccffff}
.STYLE1 {font-size: 18px}
</style>
		<script type="text/javascript" src="/shopping/js/jquery.js"></script>
		<script type="text/javascript">
	$("document").ready(function(){
		$("#shuju td").addClass("bg1");
		$("#shuju td").mouseover(function(){
			$(this).removeClass("bg1");
			$(this).parent().children().addClass("bg");
		}).mouseout(function(){
			$(this).parent().children().removeClass('bg');
			$(this).parent().children().addClass("bg1");
		}).click(function(){
			$("#shuju td,.click").removeClass("click");
			$(this).parent().children().addClass("click");
		});
	});
</script>
	</head>

	<body>
		<div id="right" style="width:780px; margin-bottom:10px;">
			<div
				style="background-image:url(/shopping/images/users/xiangxi-center-top.jpg);background-repeat:repeat-x;height:8px;clear:both">
				<img style="float:left"
					src="/shopping/images/users/xiangxi-left-top.jpg" />
				<img style="float:right"
					src="/shopping/images/users/xiangxi-right-top.jpg" />
				<div style="clear:both"></div>
			</div>
			<div
				style="background-image:url(/shopping/images/users/Snap5.jpg);background-repeat:repeat-y;padding-bottom:30px;">
				<div id="xinxi">
					<p class="STYLE1">
						亲爱的用户：
					</p>
					<p class="STYLE1">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎来到个人管理空间，如有所需，请拨打38385438在线客服电话！&nbsp;
					</p>
				</div>
				<div style="clear:both"></div>
			</div>
			<div
				style="background-image:url(/shopping/images/users/xiangxi-center-bot.jpg);background-repeat:repeat-x;height:8px;clear:both">
				<img style="float:left"
					src="/shopping/images/users/xiangxi-left-bot.jpg" />
				<img style="float:right"
					src="/shopping/images/users/xiangxi-right-bot.jpg" />
				<div style="clear:both"></div>
			</div>
		</div>
	</body>
</html>
