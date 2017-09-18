<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript" src="js/jsAddress.js"></script>
  
    <base href="<%=basePath%>">
    
    <title>添加详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //for-mobile-apps -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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
  <form action="addUserDetail.action?id=${userlogin.id}"  method="post" enctype="multipart/form-data">
	<h3 class="bars">添加信息</h3>
		<div class="input-group">
		
				省：<select id="cmbProvince" name="cmbProvince"  ></select>
				市：<select id="cmbCity" name="cmbCity" ></select>
				区：<select id="cmbArea" name="cmbArea" ></select>
				
		<br /><br />

<script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea', '省', '市', '区');
	
</script>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">详细地址</span>
  <input type="text" class="form-control" placeholder="详细地址" name="dizhi" id="dizhi" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">邮政编码</span>
  <input type="text" class="form-control" name="post" id="post" placeholder="邮政编码" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">手机号码</span>
  <input type="text" name="phone" id="phone" class="form-control" placeholder="手机号码" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  

      <span class="input-group-addon">
       男 <input type="radio" aria-label="..." name="sex" value="男" >&nbsp&nbsp&nbsp
        女 <input type="radio" aria-label="..." name="sex" value="女" >
      </span>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Email</span>
  <input type="text" class="form-control" name="email" id="email" placeholder="Email" aria-describedby="basic-addon1">
</div>


	<input type = "submit"/>
</div>


       </form> 
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
