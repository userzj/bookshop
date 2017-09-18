<%@ page language="java" import="java.util.*,cn.com.zj.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>书籍详情</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- single -->
<script src="js/imagezoom.js"></script>
<script src="js/jquery.flexslider.js"></script>
<!-- single -->
<!-- cart -->
	<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
<script>
$(document).ready(function(){
//获得文本框对象
   var t = $("#text_box");
//初始化数量为1,并失效减
$('#min').attr('disabled',true);
    //数量增加操作
    $("#add").click(function(){    
        t.val(parseInt(t.val())+1)
        if (parseInt(t.val())!=1){
            $('#min').attr('disabled',false);
        }
      
    }) 
    //数量减少操作
    $("#min").click(function(){
        t.val(parseInt(t.val())-1);
        if (parseInt(t.val())==1){
            $('#min').attr('disabled',true);
        }
      
    })
   
});
</script>  
</head>

 

  <body>
   <%
  Book book  = (Book)request.getAttribute("book1");
   List<Review> list = (List<Review>)request.getAttribute("list");
    	%>
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
<div class="page-head">
	<div class="container">
		<h3>Single</h3>
	</div>
</div>
<!-- //banner -->
<!-- single -->
<div class="single">
	<div class="container">
		<div class="col-md-6 single-right-left animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
			<div class="grid images_3_of_2">
				<div class="flexslider">
					<!-- FlexSlider -->
						<script>
						// Can also be used with $(document).ready()
							$(window).load(function() {
								$('.flexslider').flexslider({
								animation: "slide",
								controlNav: "thumbnails"
								});
							});
						</script>
					<!-- //FlexSlider-->
					<ul class="slides">
						
							<div class="thumb-image"> <img src="images/<%=book.getPicture() %>" data-imagezoom="true"   class="img-responsive"> </div>
						
						
					</ul>
					<div class="clearfix"></div>
				</div>	
			</div>
		</div>
		<div class="col-md-6 single-right-left simpleCart_shelfItem animated wow slideInRight animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInRight;">
					<h3><%= book.getBookname()%></h3>
					<p><span class="item_price">￥<%=book.getPrice() %></span> </p>
					<div class="rating1">
						<span class="starRating">
							<input id="rating5" type="radio" name="rating" value="5" checked="">
							<label for="rating5">5</label>
							<input id="rating4" type="radio" name="rating" value="4">
							<label for="rating4">4</label>
							<input id="rating3" type="radio" name="rating" value="3" >
							<label for="rating3">3</label>
							<input id="rating2" type="radio" name="rating" value="2">
							<label for="rating2">2</label>
							<input id="rating1" type="radio" name="rating" value="1">
							<label for="rating1">1</label>
						</span>
					</div>
					<br><br>
					<div class="description">
						<h5>作者:<%=book.getAuthor() %>  &nbsp 出版社:<%=book.getPublish() %>&nbsp 出版时间：<%=book.getRegTime() %> </h5>	
					</div>
					
					<div class="color-quality">
						<div class="color-quality-right">
						<br><br>
							<h5>购买数量 :</h5>
							<input id="min" name="" type="button" value="-" />  
							<input id="text_box" name="singalnum" type="text" value="1"style="width:30px;"/>  
							<input id="add" name="" type="button" value="+" />  
						</div>
					</div>
					
					<br><br>
					<div class="occasion-cart">
						<a href="addToCart.action?id=<%=book.getId() %>"  class="item_add hvr-outline-out button2">加入购物车</a>
					
					</div>
					
		</div>
				<div class="clearfix"> </div>

				<div class="bootstrap-tab animated wow slideInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: slideInUp;">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">书籍简介</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">评价</a></li>
							<li role="presentation" class="dropdown">
								<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents">书籍详情 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
									<li><a href="#dropdown1" tabindex="-1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">详细信息</a></li>
									<li><a href="#dropdown2" tabindex="-1" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">图片</a></li>
								</ul>
							</li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
								<h5>书籍介绍</h5>
								<p><%=book.getContent() %></p>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">
									<div class="bootstrap-tab-text-grid">
									    
    		<%
    			//遍历  并显示数据
    			for(Review review : list){
    				%>
    				 			
    				 		<%if(review.getReview() != ""){
												%>
												<div class="bootstrap-tab-text-grid-left">
											<img src="images/men3.jpg" alt=" " class="img-responsive">
										</div>
												<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">用户**</a></li>
												<li><a href="#"><span class="glyphicon glyphicon-share" aria-hidden="true"></span>回复</a></li>
											</ul>
											<p>
											<%=review.getReview() %>
											</p>
											
										</div>
										<div class="clearfix"> </div>
												<%
											} else{%>
											<p>暂无评论</p><% 
											}%>	
    				 			
    				 				
    				<%
    			}
    		%>   
										
										
											
											
											
											
										
										<div class="clearfix"> </div>
									</div>
									
									<div class="add-review">
										<h4>写评论</h4>
										<form action="insertReview.action" method="post">
											<input type="text" value=<%=book.getId() %> name="bookid" id="bookid" style="display:none">
											<input type="text" value=1 name="userid" id="userid" style="display:none">						
											<textarea type="text"  name="review" id="review"  onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Message...';}" required="">请输入评论...</textarea>
											<input type="submit" value="提交">
										</form>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown1" aria-labelledby="dropdown1-tab">
								<li>出 版 社：<%=book.getPublish() %></li>
								<br>
								<li>国际标准书号ISBN：<%=book.getBookno() %></li>
								<br>
								<li>出版时间：<%=book.getRegTime() %></li>
								<br>
								<li>价 格：<%=book.getPrice() %></li>
								<br>																
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="dropdown2" aria-labelledby="dropdown2-tab">
								<img src="images/<%=book.getPicture() %>" >
							</div>
						</div>
					</div>
				</div>
	</div>
</div>
<!-- //single -->
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
