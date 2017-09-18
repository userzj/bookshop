<%@ page language="java"   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<!-- InstanceBegin template="/Templates/modo.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Gogo商场</title>
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
		<!-- InstanceBeginEditable name="head" -->
		<style type="text/css"> 
	* {
		margin:0px;
		font-size:12px;
		color:#666666;
	}
	#showCar{background-color:#F0F0F0; border:1px solid #D5D5D5; padding:10px;}
	#showCar #forderInfo{
		background-color:#FFFFFF; 
		border:1px solid #D5D5D5;
		padding:5px 0px 5px 10px; 
		margin:10px 0px;
	}
	#showCar #forderInfo p{margin:10px 0px;}
	#showCar #forderInfo p span{margin-right:8px;}
	#showCar #pay{
		border:1px solid #D5D5D5;
		margin-top:10px;
		padding:3px 50px 3px 10px;
		font-size:14px; 
		font:bold; 
		color:#FF0000;
		background-color:#FFF7D3
	}
	#showCar #pay img{border:0px; float:left; margin:0px 12px;}
	#showCar #pay b{font-size:14px; color:#000000; float:left; margin-top:15px;}
	#showCar #pay span{color:#990000; float:left; margin-top:15px;}
	#showCar #paybank{
		background-color:#FFFFFF;
		border:1px solid #D5D5D5;
		border-top:0px;
		padding:10px;
		font-size:14px; 
		font:bold; 
		color:#FF0000;
		padding-right:9px; 
	}
	#showCar #paybank table td{
		height:38px;
		line-height:38px;
	}
	#paybank div{clear:both; background-color:#EEF5FF; padding:3px 8px; margin-left:120px}
	#paybank div span{float:left; margin:3px 0px 0px 3px; color:#000000}
	#showCar #goPay{
		background-color:#FFFFFF; 
		border:1px solid #D5D5D5; 
		padding:10px;
		margin-top:10px; 
		text-align:right; 
		padding-right:50px;
		font-size:14px; 
		font:bold; 
		color:#FF0000
	}
	#showCar #goPay input{background-image:url(/shopping/images/car/okPay.jpg);border:0px; width:126px; height:32px;}
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
            <span style="margin-left:40px;">${sessionScope.users.ulogin}欢迎光临Gogo商城！</span>
                    
      	</div>
   	 	<div id="logo">
      		<img style="float:left;" src="/shopping/images/index/logo.jpg" width="220" height="80"/>
            <div id="beat">
            	<img style="float:left" src="/shopping/images/index/top_line2_search_01.gif" />
                <form action="/shopping/good.do" method="post" id="queFrom">
                    <input id="text" type="text" name="gname" />
                    <input id="submit" type="image" src="/shopping/images/index/top_line2_search_02.gif" />
                    <input type="hidden" name="status" value="queGoodByGname"/>
              	</form>
            </div>
           <div id="car">
            	<img style="float:left" src="/shopping/images/index/shop-left.jpg" />
                <img style="float:right" src="/shopping/images/index/shop-right.jpg" />
                <span style="color:#000000; margin-left:10px;">购物车:</span>
                <span style="color:#FF0000; font:bold"><c:choose>
	                		<c:when test="${sessionScope.goodnum==null}">0</c:when>
	                		<c:otherwise>${sessionScope.goodnum}</c:otherwise>
	                	</c:choose>件商品</span>
                <span style="margin-left:15px;"><a href="/shopping/users/showCar.jsp" style="color:#FF0000;">去结算>></a>
                </span>
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

			<div id="mid" style="margin-bottom:20px;">
				<div style="margin:30px 0px; ">
					<img src="/shopping/images/car/navigationover.jpg" />
				</div>
				<div id="showCar">
				<form action="/shopping/onpayAction_onpays.action" method="post">
					<h1 style="font-size:14px; color:#000000;">
						您的订单已生成
					</h1>
					<div id="forderInfo">
						<p>
							<span>订 单 号：</span><span>${sessionScope.payForder.fid }</span>
						</p>
						<p>
							<span>收 货 人：</span><span>${sessionScope.payForder.uname }</span>
						</p>
						<p>
							<span>送货地址：</span><span>${sessionScope.payForder.uaddress }</span>
						</p>
						<p>
							<span>邮政编码：</span><span>${sessionScope.payForder.upost }</span>
						</p>
						<p>
							<span>支付金额：</span><span>${sessionScope.payForder.ftotal }</span>
						</p>
					</div>
					<div id="pay">
						<b>支付方式：</b>
						<img src="/shopping/images/car/boot_01.jpg" />
						<span>* 世界一流的电子支付应用和服务提供商，专注于金融增值服务领域。</span>
						<span style="margin-left:40px;color:#0077FF;"><a href="#"
							style="color:#0077FF;">如何使用?</a>
						</span>
						<p style="clear:both"></p>
					</div>
					<div>
						<h1
							style="font-size:14px; color:#000000; margin-top:10px; background-image:url(/shopping/images/car/top-bg.jpg); height:36px;">
							<img style="float:left" src="/shopping/images/car/top-left.jpg" />
							<b
								style="float:left;font-size:14px; color:#000000; margin-top:12px; margin-left:-15px;">请选择支付银行</b>
							<img style="float:right" src="/shopping/images/car/top-right.jpg" />
						</h1>
							<div id="paybank" style="clear:both">
								<!-- 这里显示银行的Logo -->
								<table
									style="margin-left:120px; margin-bottom:15px; float:right">
									<tr>
										<c:forEach items="${applicationScope.logo}" var="log"
											varStatus="num">
											<td>
												<input type="radio" name="onpay.pd_FrpId" value="${fn:substring(log,0,fn:indexOf(log,'.'))}" />
											</td>
											<td width="180">
												<img src="/shopping/images/logo/${log}" />
											</td>
											<c:if test="${(num.count)%4==0}">
									</tr>
									<tr>
										</c:if>
										<!-- 结束 -->
										</c:forEach>
									</tr>
								</table>
								<!-- 这里显示银行的Logo结束 -->
								<div>
									<img style="float:left" src="/shopping/images/car/!.JPG" />
									<span>请确保您的银行卡（不支持存折）已经在银行柜台开通了网上支付功能，否则将无法支付成功</span>
									<span style="margin-left:30px;"><a href="#"
										style="color:#0077FF;">如何开通?</a>
									</span>
									<div style="clear:both"></div>
								</div>
							</div>
					</div>
					<div id="goPay" style="padding-right:9px;">
						<input type="hidden" name="status" value="pay" />
						<input type="hidden" name="ftotal" value="${sessionScope.payForder.ftotal }" />
						<input type="hidden" name="fid"  value="${sessionScope.payForder.fid}"/>
						<input type="hidden" name="onpay.p0_Cmd"  value="Buy" />
					    <input type="hidden" name="onpay.p1_MerId"  value="10000940764" />
					    <input type="hidden" name="onpay.p2_Order"  value="${sessionScope.forder.fid }" />
					    <input type="hidden" name="onpay.p3_Amt"  value="${sessionScope.forder.ftotal}" />
					     <input type="hidden" name="onpay.p4_Cur"  value="CNY" />
					     <input type="hidden" name="onpay.p8_Url"  value="<%=request.getContextPath()%>/onpay_success.action" />
					     <input type="hidden" name="onpay.p9_SAF"  value="0" />
					     <input type="hidden" name="onpay.pr_NeedResponse"  value="0" />
						<input type="submit" value="提交" />
					</div>
					</form>
				</div>
			</div>
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
					<p>
						Copyright ©
						<a href="/shopping/index.jsp">Gogo</a> 2012-2016, All Rights Reserved
						Reserved
					</p>
					<p>
						地址：广东省中山市
					</p>
					<p>
						Tel: (0756) 888888 Fax: (0756) 8888888  Email:xxxxxxx@qq.com
					</p>
					<p>
						本网站版权所属xxxx
					</p>
					<hr />
					<p style="color:#CC3300">
						Gogo商城与国内知名支付平台合作,确保您的交易安全!
					</p>
					<img src="/shopping/images/index/boot_01.jpg" />
					<img src="/shopping/images/index/boot_02.jpg" />
					<img src="/shopping/images/index/boot_03.jpg" />
					<img src="/shopping/images/index/boot_04.jpg" />
					<img src="/shopping/images/index/logo123x40.jpg" />
				</div>
			</div>
		</div>
	</body>
</html>

