<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>Gogo商场购物车</title>
		<!-- InstanceEndEditable -->
		<link href="/shopping/css/index/index.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
* {
	margin: 0px;
	font-size: 12px;
	color: #666666;
}

a img {
	border: 0px;
}

#mid p a {
	color: #3A6AB3
}

#mid p a:hover {
	color: #FF0000;
	text-decoration: underline
}
</style>

		<!-- InstanceBeginEditable name="head" -->
		<link href="/shopping/css/index/showCar.css" rel="stylesheet"
			type="text/css" />

		<script type="text/javascript" src="/shopping/js/jquery.js"></script>
		<script type="text/javascript" src="/shopping/js/public.js"></script>
		<script type="text/ecmascript" src="/shopping/js/area.js"></script>
		<script type="text/javascript" src="/shopping/js/user/showCar.js"></script>
	</head>

	<body>
		<div style="width: 980px; margin: 0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp">Gogo首页</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp">我的Gogo</a>
					</span>
					<span style="margin-left: 40px;">${sessionScope.users.uname}欢迎光临Gogo商城！</span>
					<c:if test="${sessionScope.users==null}">
						<span><strong style="color: #D369D7;"> [<a
								href="/shopping/userEnrol.jsp" style="color: #D369D7;">注册</a>/<a
								href="/shopping/usersLogin.jsp" style="color: #D369D7;">登录</a>]</strong>
						</span>
					</c:if>

				</div>
				<div id="logo">
					<img style="float: left;" src="/shopping/images/index/logo.jpg"
						width="220" height="80" />
					<div id="beat">
						<img style="float: left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/good.do" method="post" id="queFrom">
							<input id="text" type="text" name="gname" />
							<input id="submit" type="image"
								src="/shopping/images/index/top_line2_search_02.gif" />
							<input type="hidden" name="status" value="queGoodByGname" />
						</form>
					</div>
					<div id="car">
						<img style="float: left"
							src="/shopping/images/index/shop-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/shop-right.jpg" />
						<span style="color: #000000; margin-left: 10px;">购物车:</span>
						<span style="color: #FF0000; font: bold" id="goodnum"
							class="${sessionScope.goodnum}"><c:choose>
								<c:when test="${sessionScope.goodnum==null}">0</c:when>
								<c:otherwise>${sessionScope.goodnum}</c:otherwise>
							</c:choose>
						</span><span> 件商品</span>
						<span style="margin-left: 15px;"><a
							href="/shopping/users/showCar.jsp" style="color: #FF0000;">去结算</a>
						</span>
					</div>
				</div>
				<div id="menu">
					<img style="float: left" src="/shopping/images/index/menu-l.gif" />
					<img style="float: right" src="/shopping/images/index/menu-r.gif" />
					<ul>
						<li>
							<a href="/shopping/index.jsp"><b>首页</b>
							</a>
						</li>
						<li class="img">
							<img style="float: left;" src="/shopping/images/index/split.jpg" />
						</li>
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

			<div id="mid" style="margin-bottom: 20px;">
				<div style="margin-left: 100px; height: 300px;" id="nocar">
					<img src="/shopping/images/car/car.jpg"
						style="float: left; margin-right: 5px; margin-top: 80px;" />
					<h1 style="padding-top: 110px; font-size: 18px; color: #A42221">
						您的购物车还是空的，赶快行动吧！
					</h1>
					<p style="padding-top: 10px; color: #000000">
						马上去
						<a href="/shopping/index.jsp">Gogo首页</a>
					</p>

				</div>

				<div id="showCar">
					<h1 style="font-size: 14px; color: #000000; padding-bottom: 5px;">
						已选择的商品：
					</h1>
					<div>
						<table width="100%" cellspacing="0" cellpadding="0">
							<tr id="title">
								<td width="130">
									商品编号
								</td>
								<td>
									商品名称
								</td>
								<td width="100">
									销售价格
								</td>
								<td width="100">
									数量
								</td>
								<td width="100">
									小计
								</td>
								<td width="120">
									从购物车中删除
								</td>
							</tr>
							<!-- 购物车里一个商品的信息 -->
							<c:forEach items="${sessionScope.forder.sorders}" var="sorder">
								<tr id="${sorder.good.gid}">
									<td >
										<a href="#" name="sorder.good.gid">
										${sorder.good.gid}</a>
									</td>
									<td>
										${sorder.gname }
									</td>
									<td>
										${sorder.gprice}
									</td>
									<td>
										<img class="cut" src="/shopping/images/car/cut.jpg" id="-1"
											title="减少商品数量" />
										<input type="text" class="gnumber" id="${sorder.gnumber}"
											maxlength="3" value="${sorder.gnumber}" />
										<img class="cut" src="/shopping/images/car/add.jpg" id="1"
											title="增加商品数量" />
									</td>
									<td>
										${fn:substring(sorder.gprice*sorder.gnumber,0,(fn:indexOf(sorder.gprice*sorder.gnumber,".")+3))}
									</td>
									<td class="del">
										<span>删除</span>
									</td>
								</tr>
								<!-- 购物车里一个商品的信息结束 -->
							</c:forEach>
						</table>
					</div>
					<div class="ftotal" id="ftotal">
						商品总价:￥${fn:substring(sessionScope.forder.ftotal,0,(fn:indexOf(sessionScope.forder.ftotal,".")+3))}
					</div>
					<div class="ftotal" style="padding-right: 9px;">
						<a href="/shopping/index.jsp"><img
								style="margin: 0px 5px 3px;" src="/shopping/images/car/gogo.jpg" />
						</a>
					   <c:choose>
					   <c:when test="${sessionScope.forder.ftotal>0}">
					   <a href="/shopping/users/lastConfirm.jsp" id="go"><img
								src="/shopping/images/car/goPay.jpg" />
						</a>
					   </c:when>
					   <c:otherwise>
					   <a href="#"><img
								src="/shopping/images/car/goPay.jpg" />
						</a>
					   </c:otherwise>
					   </c:choose>	
						
						
					</div>


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
						<a href="../front/index.html">Gogo</a> 2012-2016, All Rights Reserved
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
					<p style="color: #CC3300">
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
	<!-- InstanceEnd -->
</html>
