<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商业合作</title>
 <!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>

  </head>
  
  <body>
 <!-- header -->
<div class="header">
	<div class="container">
		<ul>
		
		
			<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>自营快递及时高效</li>
			<li><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><%if(session.getAttribute("userlogin")==null){%>
																									<a href="login.jsp" >亲，请登录								
																									<%}else{%>
																									 尊敬的&nbsp ${userlogin.username}&nbsp 您好！																									
																								<%}%></li>
		</ul>
	</div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
	<div class="container">
		<div class="col-md-3 header-left">
			<h1><a href="index.jsp"><img src="images/logo3.jpg"></a></h1>
		</div>
		<div class="col-md-6 header-middle">
			<form action="searchBooks.action" method="post" >
				<div class="search">
					<input type="search" value="请输入您要查询的书籍" name = "bookname" id = "bookname" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" required="">
				</div>
				<div class="section_room">
					<select id="bookclass" name = "bookclass" onChange="change_country(this.value)" class="frm-field required">
								  
    								<option value =1 >教育</option>
    								<option value =2 >小说</option>
    								<option value =3 >文艺</option>
    								<option value =4 >青春</option>
    								<option value =5 >童书</option>
    								<option value =6 >生活</option>
    								<option value =7>人文社科</option>
    								<option value =8 >经管</option>
    								<option value =9 >励志</option>
    								<option value =10 >科技</option>
    								<option value =11 >工具书</option>
    								<option value =12 >期刊</option>
    								<option value =13 >其它</option>
    								<option value =0 selected>所有分类</option>
					</select>
				</div>
				<div class="sear-sub">
					<input type="submit" value=" ">
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
		<div class="col-md-3 header-right footer-bottom">
			<ul>
			<%if(session.getAttribute("userlogin")==null){%>
																									<li><a href="login.jsp" class="use1"  ><span>登录</span></a></li>								
																									<%}else{%>
																									<li><a href='queryUserInfo.action?id=${userlogin.id}' class="use1"  ><span>我的信息</span></a></li>																								
																								<%}%>
				
					
				
				<li><a class="fb" href="http://www.facebook.com"></a></li>
				<li><a class="twi" href="http://www.twitter.com"></a></li>
				<li><a class="insta" href="http://www.instagram.com"></a></li>
				<li><a class="you" href="http://www.youtube.com"></a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //header-bot -->
<!-- banner -->
<div class="ban-top">
	<div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				
				<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav menu__list">
					<li class="active menu__item menu__item--current"><a class="menu__link" href="index.jsp">主页 <span class="sr-only">(current)</span></a></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li class="dropdown menu__item">
						<a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">图书分类 <span class="caret"></span></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
										<a href="index.jsp"><img src="images/woo1.jpg" alt=" "/></a>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="searchBooksAsclassification.action?bookclass=1">教育</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=2">小说</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=3">文艺</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=4">青春</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=5">童书</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=6">生活</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=7">人文社科 </a></li>
										</ul>
									</div>
									<div class="col-sm-3 multi-gd-img">
										<ul class="multi-column-dropdown">
											<li><a href="searchBooksAsclassification.action?bookclass=8">经管</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=9">励志</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=10">科技</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=11">工具书</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=12">期刊</a></li>
											<li><a href="searchBooksAsclassification.action?bookclass=13">其它</a></li>
											<li><a href="index.jsp">主页</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
					</li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					
					<li class=" menu__item"><a class="menu__link" href="contact.jsp">商业合作</a></li>
				  </ul>
				</div>
			  </div>
			</nav>	
		</div>
		<div class="top_nav_right">
			<div class="cart box_1">
						<a href="selToCart.action">
						<h3> <div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								购物车</div>
								<p><a href="selToCart.action" ></a></p>
							</h3>
						</a>
						
						
			</div>	
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //banner-top -->
<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="contact-grids">
				<div class="col-md-4 contact-grid text-center animated wow slideInLeft" data-wow-delay=".5s">
					<div class="contact-grid1">
						<i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
						<h4>Address</h4>
						<p>12K Street, 45 Building Road <span>New York City.</span></p>
					</div>
				</div>
				<div class="col-md-4 contact-grid text-center animated wow slideInUp" data-wow-delay=".5s">
					<div class="contact-grid2">
						<i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
						<h4>Call Us</h4>
						<p>+1234 758 839<span>+1273 748 730</span></p>
					</div>
				</div>
				<div class="col-md-4 contact-grid text-center animated wow slideInRight" data-wow-delay=".5s">
					<div class="contact-grid3">
						<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
						<h4>Email</h4>
						<p><a href="mailto:info@example.com">info@example1.com</a><span><a href="mailto:info@example.com">info@example2.com</a></span></p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="map wow fadeInDown animated" data-wow-delay=".5s">
				<h3 class="tittle">View On Map</h3>
				<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d2482.432383990807!2d0.028213999961443994!3d51.52362882484525!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1423469959819" frameborder="0" style="border:0"></iframe>
			</div>
			<h3 class="tittle">Contact Form</h3>
			<form>
				<div class="contact-form2">
					<input type="text" value="Name" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Name';}" required="">
					<input type="email" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}" required="">
					<textarea type="text" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
					<input type="submit" value="Submit" >
				</div>
			</form>
		</div>
	</div>
	
<!-- //contact -->

<!-- //product-nav -->
<div class="coupons">
	<div class="container">
		<div class="coupons-grids text-center">
			<div class="col-md-3 coupons-gd">
				<h3>仅需三部轻松完成购物</h3>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<h4>登录或注册</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
				<h4>选择心仪的图书</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="col-md-3 coupons-gd">
				<span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
				<h4>完成支付</h4>
				<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur.</p>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="col-md-3 footer-left">
			<h2><a href="index.jsp"><img src="images/logo3.jpg" alt=" " /></a></h2>
			<p>Neque porro quisquam est, qui dolorem ipsum quia dolor
			sit amet, consectetur, adipisci velit, sed quia non 
			numquam eius modi tempora incidunt ut labore 
			et dolore magnam aliquam quaerat voluptatem.</p>
		</div>
		<div class="col-md-9 footer-right">
			
		
			<div class="clearfix"></div>
			<div class="sign-grds">
				
				
				<div class="col-md-4 sign-gd-two">
					<h4>商城信息</h4>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>地址 : 吉林省长春市前进大街2699号<span></span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="mailto:info@example.com">izhujia@vip.qq.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>电话 : 15754308615 </li>
					</ul>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<p class="copy-right">Copyright &copy; 2016.祝嘉 All rights reserved</p>
	</div>
</div>
<!-- //footer -->
</body>
</html>
