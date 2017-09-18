<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<title>Gogo商场经典首页</title>

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

.border {
	border: 1px dashed #ffffff;
}

.showBorder {
	border: 1px dashed #FF0000;
}

#btn span {
	font-size: 13px;
	padding-right: 3px;
	border-right: 1px solid #FFFFFF;
	display: block;
	float: left;
	width: 24px;
	height: 18px;
	text-align: center;
}

#btn {
	background-color: #FFFF00;
}

.over {
	background-color: #FF0000;
}
</style>
		<script type="text/javascript" src="/shopping/js/public.js"></script>
		<script type="text/javascript" src="/shopping/js/jquery.js"></script>
		<script type="text/javascript" src="/shopping/js/users.js"></script>
		<script type="text/javascript">
	var curr = 1;
	$("document").ready(function() {
		$(".log").hide();
		$("#1").show();
		$("#b1").removeClass("over");
		$(".show").addClass("border");
		$(".show").mouseover(function() {
			$(this).removeClass("border");
			$(this).addClass("showBorder");
		});
		$(".show").mouseout(function() {
			$(this).removeClass("showBorder");
			$(this).addClass("border");
		});
		setTimeout(init, 5000);
		$("#btn span").click(function() {
			curr = $(this).html();
			$(".log").hide();
			$("#" + $(this).html()).show();
		});
		$(".num").mousemove(function() {
			curr = $(this).html();
			$(".log").hide();
			$("#" + $(this).html()).show();
			$(".num").removeClass("over");
			$(this).addClass("over");
		});
	});
	function init() {
		curr++;
		if (curr > 4) {
			curr = 4;
		}
		$(".log").hide();
		$("#" + curr).show();
		$(".num").removeClass("over");
		$("#b" + curr).addClass("over");
		if (curr == 4) {
			curr = 0;
		}
		setTimeout(init, 5000);
	}
</script>
		<!-- InstanceEndEditable -->
	</head>

	<body>
		<div style="width: 980px; margin: 0px auto;">
			<div id="top">
				<div id="con">
					<span class="c" style="padding-left: 30px;"><a
						href="/shopping/index.jsp">Gogo首页</a> </span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/showCar.jsp">我的购物车</a>
					</span>
					<span>|</span>
					<span class="c"><a href="/shopping/users/main.jsp">我的物品</a>
					</span>
					<span style="margin-left: 40px;"><font color="#00ff00"><span>${sessionScope.users.uname}</span>
					</font>欢迎光临Gogo商城！</span>
					<c:if test="${sessionScope.users==null}">
						<span><strong style="color: #D369D7;"> [<a
								href="/shopping/userEnrol.jsp" style="color: #D369D7;">注册</a>/<a
								href="/shopping/usersLogin.jsp" style="color: #D369D7;">登录</a>]</strong>
						</span>
					</c:if>
					<c:if test="${sessionScope.users!=null}">
						<span style="margin-left: 40px;"> 
						<input type="button" value="退出" style="color: #D369D7;" class="dd"/>
						</span>
					</c:if>
				</div>
				<div id="logo">
					<img style="float: left;" src="/shopping/images/index/logo.jpg" />
					<div id="beat">
						<img style="float: left"
							src="/shopping/images/index/top_line2_search_01.gif" />
						<form action="/shopping/goodsAction_querybyGoodname.action"
							method="post" id="queFrom">
							<input id="text" type="text" name="good.gname" value="${sessionScope.keyWord}" />
							<input id="submit" type="image"
								src="/shopping/images/index/top_line2_search_02.gif" />
						</form>
					</div>
					<div id="car">
						<img style="float: left"
							src="/shopping/images/index/shop-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/shop-right.jpg" />

						<span style="color: #000000; margin-left: 10px;">购物车:</span>
						<span style="color: #FF0000; font: bold" id="goodnum"> 
						  <c:choose>
	                		<c:when test="${sessionScope.goodnum==null}">0</c:when>
	                		<c:otherwise>${sessionScope.goodnum}</c:otherwise>
	                	</c:choose>
									 </span> 件商品
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
							<a href="/shopping/index.jsp"><b>首页</b> </a>
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

			<!-- InstanceBeginEditable name="EditRegion3" -->
			<div id="mid" style="margin: 5px 0px;">
				<div id="left">
					<div id="cell">
						<div class="small"
							style="background-image: url(/shopping/images/index/bg-top.jpg);">
							<img style="float: left"
								src="/shopping/images/index/top-left.jpg" />
							<span
								style="float: left; font-size: 14px; font: bold; color: #D62762; padding-top: 8px;">热点类别</span>
							<img style="float: right"
								src="/shopping/images/index/top-right.jpg" />
						</div>
						<!-- 一个品牌的循环开始  循环3次-->
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<!-- 一个品牌的循环结束 -->
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<!-- 商品型号循环结束 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<!-- 商品型号循环结束 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<div class="small"
							style="background-image: url(/shopping/images/index/mid-bg.jpg);">
							<img style="float: left"
								src="/shopping/images/index/mid-left.jpg" />
							<img style="float: right"
								src="/shopping/images/index/mid-right.jpg" />
						</div>
						<div style="clear: both"></div>
					</div>
					<div id="cell">
						<div class="small"
							style="background-image: url(/shopping/images/index/bg-top.jpg);">
							<img style="float: left"
								src="/shopping/images/index/top-left.jpg" />
							<span
								style="float: left; font-size: 14px; font: bold; color: #D62762; padding-top: 8px;">商品分类</span>
							<img style="float: right"
								src="/shopping/images/index/top-right.jpg" />
						</div>
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<!-- 商品型号循环结束 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<!-- 商品型号循环结束 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<div class="pinpai">
							<h2 style="font-size: 14px; color: #FF0000">
								NOKIA
							</h2>
							<!-- 这里面显示一个品牌的商品型号    循环3次 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<!-- 商品型号循环结束 -->
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
							<p>
								<a href="detailGood.jsp">E63</a><span>|</span>
								<a href="detailGood.jsp">N97</a><span>|</span>
								<a href="detailGood.jsp">E72</a><span>|</span>
								<a href="detailGood.jsp">E99</a>
							</p>
						</div>
						<div class="small"
							style="background-image: url(/shopping/images/index/mid-bg.jpg);">
							<img style="float: left"
								src="/shopping/images/index/mid-left.jpg" />
							<img style="float: right"
								src="/shopping/images/index/mid-right.jpg" />
						</div>
						<div style="clear: both"></div>
					</div>
					<div style="height: 115 px;">
						<img style="margin-bottom: 6px;"
							src="/shopping/images/show/t_100723_03.jpg" width="177" />
						<img style="margin-bottom: 6px;"
							src="/shopping/images/show/wanjuji_0715.jpg" width="177" />
					</div>
					<div>
						<div class="small"
							style="background-image: url(/shopping/images/index/bg-top.jpg);">
							<img style="float: left"
								src="/shopping/images/index/top-left.jpg" />
							<span
								style="float: left; font-size: 14px; font: bold; color: #D62762; padding-top: 8px;">Gogo公告</span>
							<img style="float: right"
								src="/shopping/images/index/top-right.jpg" />
						</div>
						<div class="pinpai" style="height: 151px;">
							<!-- 这里是商城的公告  循环5次 -->
							<p>
								<a href="#">Gogo 购物论坛</a>
							</p>
							<p>
								<a href="#">如何能够买到您想要的商品</a>
							</p>
							<p>
								<a href="#">查看购物中的注意事项</a>
							</p>
							<p>
								<a href="#">购物完成后的退货事项</a>
							</p>
							<p>
								<a href="#">欢迎您的下次购物</a>
							</p>
						</div>
						<div class="small"
							style="background-image: url(/shopping/images/index/mid-bg.jpg);">
							<img style="float: left"
								src="/shopping/images/index/mid-left.jpg" />
							<img style="float: right"
								src="/shopping/images/index/mid-right.jpg" />
						</div>
					</div>
				</div>
				<div id="right">
					<c:forEach items="${applicationScope.goodlist}" var="list">
						<div class="context">
							<!-- 从这里开始，显示一个类别的信息，-->
							<div class="contextTop">
								<img style="float: left"
									src="/shopping/images/index/top-left.jpg" />
								<b><span
									style="float: left; font-size: 15px; font: bold; color: #D62762;">${list[0].category.ctype}</span>
								</b>
								<img style="float: right"
									src="/shopping/images/index/top-right.jpg" />
								<span style="float: right;"><a
									href="/shopping/good.do?status=queNewGood">更多新品!详情请点击</a> </span>
							</div>
							<div class="contextMid">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">

									<tr>
										<c:forEach items="${list}" var="good">
											<c:url value="/detailGood.jsp" var="detail">
												<c:param name="gid" value="${good.gid}"></c:param>
												<c:param name="gname" value="${good.gname}"></c:param>
												<c:param name="gprice" value="${good.gprice}"></c:param>
												<c:param name="gpic" value="${good.gpic}"></c:param>
												<c:param name="ctype" value="${good.category.ctype}"></c:param>
												<c:param name="gremark" value="${good.gremark}"></c:param>
												<c:param name="gxremark" value="${good.gxremark}"></c:param>
											</c:url>
											<!-- 一个商品的显示  循环5次 -->
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0" class="show">
													<tr>
														<td>
															<a href="${detail}"><img
																	src="/shopping/upfile/${good.gpic}" height="50"
																	,width="500" /> </a>
														</td>
													</tr>
													<tr>
														<td align="center">
															${good.gname }
														</td>
													</tr>
													<tr>
														<td align="center" style="text-decoration: line-through">
															市场价${good.gprice + 50}
														</td>
													</tr>
													<tr>
														<td align="center" style="font: bold; color: #FF3300">
															市场价${good.gprice}
														</td>
													</tr>
												</table>
											</td>
											<!-- 一个商品显示结束 -->
										</c:forEach>
									</tr>

								</table>

							</div>
						</div>
					</c:forEach>
					<div class="contextBot">
						<img style="float: left" src="/shopping/images/index/mid-left.jpg" />
						<img style="float: right"
							src="/shopping/images/index/mid-right.jpg" />
					</div>
					<!-- 到这里一个类别的结束 -->
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
				<p>
					Copyright ©
					<a href="index.html">Gogo</a> 2012-2016, All Rights Reserved
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

		<div style="position: absolute; top: 394px; left: 778px;" id="btn">
			<!--<span class="num" id="b1">1</span>
			<span class="num" id="b2">2</span>
			<span class="num" id="b3">3</span>
			<span class="num" id="b4">4</span>
		-->
		</div>
	</body>
	<!-- InstanceEnd -->
</html>

