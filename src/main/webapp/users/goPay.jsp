<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Gogo商场</title>
<!-- InstanceEndEditable -->
<link href="/shopping/css/index/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
</style>
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	.forderInfo{
		background-color:#FFFFFF;
		padding:5px 0px 5px 300px;
	}
	.forderInfo p{margin:10px 0px;}
	.forderInfo p span{margin-right:8px;}
	.forderInfo p input{background-image:url(/shopping/images/car/goBank.jpg); width:185px; height:35px; border:0px;}
</style>
<!-- InstanceEndEditable -->
</head>

<body>
<div style="width:980px; margin:0px auto;">
  <div id="top">
    	<div id="con">
        	<span class="c" style="padding-left:30px;"><a href="/shopping/index.jsp">Gogo首页</a></span>
            <span>|</span>
            <span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a></span>
             <span>|</span>
            <span class="c"><a href="/shopping/users/main.jsp">我的Gogo</a></span>
            <span style="margin-left:40px;"><font color="#00ff00"><span>${sessionScope.users.ulogin}</span></font>欢迎光临Gogo商城！</span>
            <span><strong style="color:#D369D7;">
            	[<a href="/shopping/userEnrol.jsp" style="color:#D369D7;">注册</a>/<a href="/shopping/usersLogin.jsp" style="color:#D369D7;">登录</a>]</strong>
           	</span>        
      	</div>
   	 	<div id="logo">
      		<img style="float:left;" src="/shopping/images/index/logo.jpg" width="220" height="80"/>
            <div id="beat">
            	<img style="float:left" src="/shopping/images/index/top_line2_search_01.gif" />
                <form action="" method="post">
                    <input id="text" type="text" name="text" style="" />
                    <input id="submit" type="image" src="/shopping/images/index/top_line2_search_02.gif" />
                    <input type="hidden" name=""/>
              	</form>
            </div>
            <div id="car">
            	<img style="float:left" src="/shopping/images/index/shop-left.jpg" />
                <img style="float:right" src="/shopping/images/index/shop-right.jpg" />
                <span style="color:#000000; margin-left:10px;">购物车：<span style="color:#FF0000; font:bold">0</span>件商品</span>
                <span style="margin-left:15px;"><a href="/shopping/users/showCar.jsp" style="color:#FF0000;">去结算</a></span>
           	</div>
      	</div>
      		<div id="menu">
      		<img style="float:left" src="/shopping/images/index/menu-l.gif" />
        	<img style="float:right" src="/shopping/images/index/menu-r.gif" />
            <ul>
       		  	<li><a href="/shopping/index.jsp"><b>首页</b></a></li>
               	<li class="img"><img style="float:left;" src="/shopping/images/index/split.jpg" /></li>            	
            	<c:forEach items="${applicationScope.goodlist}" var="list">
							<li>
								<a href="#" class="c"><b>${list[0].category.ctype}</b> </a>
							</li>
							<li class="img">
								<img style="float: left;" src="/shopping/images/index/split.jpg" />
							</li>
						</c:forEach>
        	</ul>
    	</div>
  </div>
    
    <!-- InstanceBeginEditable name="EditRegion3" -->
	<div id="mid" style="margin-bottom:20px;">
      	<div id="okPay">
            <div>
            	<h1 style="font-size:14px; color:#000000; margin-top:10px; background-image:url(/shopping/images/car/top-bg.jpg); height:36px;">
            		<img style="float:left" src="/shopping/images/car/top-left.jpg"/>
                	<b style="float:left;font-size:14px; color:#000000; margin-top:12px;">感谢您在Gogo商城购物</b>
            		<img style="float:right" src="/shopping/images/car/top-right.jpg"/>
            	</h1>
          	</div>
            <div style="border-left:1px solid #D5D5D5; border-right:1px solid #D5D5D5">
              <form action="${requestScope.nodeAuthorizationURL}" method="post">
           	  <div class="forderInfo">
                    <p><span>订 单 号：</span><b style="color:#990000">${sessionScope.payForder.fid }</b>
                   	  <span style="margin-left:10px;">[请您记下这个号码，以便在付款和查询订单时使用]</span>
                    </p>
                	<p><span>支付金额：</span><span style="color:#990000">${sessionScope.payForder.ftotal }</span></p>
                    <p><span style="float:left; margin-top:15px;">支付方式：</span>
                    	<span><img src="/shopping/images/car/boot_01.jpg" /></span>
                    </p>
                    <p><span style="float:left; margin-top:10px;">支付银行：</span>
                    	<span><img src="/shopping/images/logo/${requestScope.onpay.pd_FrpId}.gif" /></span>
                    </p>
                    <p style="padding-left:12px;">
                    <input type="hidden" name="p0_Cmd" value="${requestScope.onpay.p0_Cmd}" />
                    <input type="hidden" name="p1_MerId" value="${requestScope.onpay.p1_MerId}" />
                    <input type="hidden" name="p2_Order" value="${requestScope.onpay.p2_Order}" />
                    <input type="hidden" name="p3_Amt" value="${requestScope.onpay.p3_Amt}" />
                    <input type="hidden" name="p4_Cur" value="${requestScope.onpay.p4_Cur}" />
                    <input type="hidden" name="p5_Pid" value="${requestScope.onpay.p5_Pid}" />
                    <input type="hidden" name="p6_Pcat" value="${requestScope.onpay.p6_Pcat}" />
                    <input type="hidden" name="p7_Pdesc" value="${requestScope.onpay.p7_Pdesc}" />
                    <input type="hidden" name="p8_Url" value="${requestScope.onpay.p8_Url}" />
                    <input type="hidden" name="p9_SAF" value="${requestScope.onpay.p9_SAF}" />
                    <input type="hidden" name="pa_MP" value="${requestScope.onpay.pa_MP}" />
                    <input type="hidden" name="pd_FrpId" value="${requestScope.onpay.pd_FrpId}" />
                    <input type="hidden" name="pr_NeedResponse" value="${requestScope.onpay.pr_NeedResponse}" />
                    <input type="hidden" name="hmac" value="${requestScope.hmac}" />
                    <input type="submit" id="sub" value="" /></p>
               </div>
               </form>
               <div class="forderInfo" style="border-top:1px dashed #cccccc; margin-top:20px; padding-left:200px">
               		<p>* 您可以在“
                    		<a href="/shopping/users/main.jsp" style="color:#0077FF;">我的Gogo</a>
                         ”中查看或取消您的订单，由于系统将进行订单预处理，您可以不会立刻查询到刚提交的订单
                   	</p>
                    <p>* 我们会在7天内为您保留您未支付的订单。请及时去“
                    		<a href="/shopping/users/main.jsp" style="color:#0077FF;">我的Gogo</a>”完成支付
                    </p>
               </div>
            </div>
            <div>
            	<h1 style="background-image:url(/shopping/images/car/bot-bg.jpg); height:36px;">
            		<img style="float:left" src="/shopping/images/car/bot-left.jpg"/>
            		<img style="float:right" src="/shopping/images/car/bot-right.jpg"/>
            	</h1>
            	<div style="clear:both"></div>
          	</div>
        </div>
    </div>
	<!-- InstanceEndEditable -->
    <div id="bot">
       	  <div id="we">
            	<a href="#">关于我们</a> – 
                <a href="#">帮助中心</a> – 
                <a href="#">配送方式</a> – 
                <a href="#">支付方式</a> – 
                <a href="#">客服中心</a> – 
                <a href="#">友情链接</a> – 
                <a href="#">诚聘英才</a> – 
                <a href="#">产品招商</a> – 
                <a href="#">送礼指南</a> – 
                <a href="#">网站地图</a> 
          </div>
          <div id="info">
           	  <p>Copyright © <a href="../front/index.html">Gogo</a> 2012-2016, All Rights Reserved</p>
              <p>地址：广东省中山市</p>
              <p>Tel: (0756) 888888 Fax: (0756) 8888888  Email:xxxxxxx@qq.com</p>
              <p>本网站版权所属xxxx</p>
              <hr />
              <p style="color:#CC3300">Gogo商城与国内知名支付平台合作,确保您的交易安全! </p>
              <img src="/shopping/images/index/boot_01.jpg" />
              <img src="/shopping/images/index/boot_02.jpg" />
              <img src="/shopping/images/index/boot_03.jpg" />
              <img src="/shopping/images/index/boot_04.jpg" />
              <img src="/shopping/images/index/logo123x40.jpg" />
        </div>
  </div>
</div>
</body>
<!-- InstanceEnd --></html>
