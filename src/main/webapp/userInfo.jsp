<%@ page language="java" import="java.util.*,cn.com.zj.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
   
<title>个人中心</title>
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
<script type="text/javascript" src="js/geo.js"></script>
<script type="text/javascript" >
		//封装正确/错误效验
		function right(){
			return "<img src = 'images/sign-check-icon.png' alt = 'right' height = '15' width = '15'/>";
		}
		function wrong(){
			return "<img src = 'images/sign-error-icon.png' alt = 'wrong' height = '15' width = '15'/>";
		}
		/*
		 *@封装test方法
		 *require代表效验标准，lab代表label标签的id
		 */
		function test(require,lab){
			if(require){
				$(lab).html(right());
				return true;
			}else{
				$(lab).html(wrong());
				return false;
			}
		}
		function testId(){
		//注意加return
			return test($("#id").val().trim().length >= 5,"#ilab");
		}
		function testPassword(){
			return test($("#password").val().trim().length >= 6,"#plab");
		}
		function testRepeatPassword(){
			return test($("#repassword").val() == $("#password").val() && $("#password").val().trim().length >= 6,"#rlab");
		}
		function testIdCard(){
			return test($("#idCard").val().trim().match("^\\d{10}|\\d{13}|\\d{15}|\\d{18}$"),"#iclab");
		}
		function testName(){
			return test($("#name").val().trim() != "","#nlab");
		}
		function testEmail(){
			return test($("#email").val().trim().match("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$"),"#elab");
		}
		function testPhotoNumber(){
			return test($("#photoNumber").val().trim().match("^[0-9]*[1-9][0-9]*$") && $("#photoNumber").val().trim().length == 11,"#phlab");
		}
		function testSex(){
			return test($(":radio:checked").size() == 1,"#slab");
		}
		function testHadRead(){
			return test($(":checkbox:checked").size() == 1 ,"#hlab");
		}
		function testBirthday(){
			return test($("#birthday").val().match("(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)"),"#blab");
		}
		function testFirstAddress(){
			return test($("#firstaddress").val().trim() != "","#flab");
		}
		function AJAXTestId(){
				$.post("user/registtest.action",{id:$("#id").val()},function(data){
				return test($("#id").val().trim().length >= 5 && data == 0,"#ilab");
		}				
		);
		}
		function testAll(){
			if(testId()&&testPassword()&&testRepeatPassword()&&testIdCard()&&testName()&&testEmail()&&testPhotoNumber()&&testSex()&&testBirthday()&&testHadRead()&&testFirstAddress()){
				return true;
			}else{
				
				return false;
			}
		}
		
	</script>
  </head>
  
  <body onload="setup();preselect('省份');promptinfo();">
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
<!-- banner -->
   
<br />
<center>
	<form action="addUserDetail.action?id=${userlogin.id}"  method="post" enctype="multipart/form-data">
	<h3 class="bars">添加信息</h3>
	
		<div class="input-group">
		  <select class="select" name="province" id="s1">
              <option></option>
            </select>
            <select class="select" name="city" id="s2">
              <option></option>
            </select>
            <select class="select" name="town" id="s3">
              <option></option>
            </select>
            
				
		<br /><br />

<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">详细地址</span>
  <input type="text"  onblur = "testFirstAddress()" class="form-control" placeholder="详细地址" name="address" id="address" aria-describedby="basic-addon1"><label id="flab"></label>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">邮政编码</span>
  <input type="text" class="form-control" name="post" id="post" placeholder="邮政编码" aria-describedby="basic-addon1">
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">手机号码</span>
  <input type="text" name="phone" id="phone" class="form-control" onblur="testPhotoNumber()" placeholder="手机号码" aria-describedby="basic-addon1"> <label id = "phlab"></label>
</div>
<div class="input-group">
  

      <span class="input-group-addon">
       男 <input type="radio" aria-label="..." name="sex" value="男" >&nbsp&nbsp&nbsp
        女 <input type="radio" aria-label="..." name="sex" value="女" >
      </span>
</div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Email</span>
  <input type="text" class="form-control" name="email" id="email" onblur="testEmail()" placeholder="Email" aria-describedby="basic-addon1"><label id = "elab"></label>
</div>
	

          <input  type="submit" value="提交"  />
</div>


       </form> 
       <script>

//这个函数是必须的，因为在geo.js里每次更改地址时会调用此函数
function promptinfo()
{
    var address = document.getElementById('address');
    var s1 = document.getElementById('s1');
    var s2 = document.getElementById('s2');
    var s3 = document.getElementById('s3');
    address.value = s1.value + s2.value + s3.value;
}

</script>
		</center>			
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

