<%@ page language="java" import="java.util.*,cn.com.zj.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
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
  <%
  List<OrderOrderDetail> list = (List<OrderOrderDetail>)request.getAttribute("list");
    	%>
    	 <%
  Integer orderid = (Integer)request.getAttribute("orderid");
    	%>
    	 <div class="bs-docs-example">
            <table class="table">
              <thead>
                <tr>
                  
                  <th>书名</th>
                  <th>数量</th>
                 
                 
                </tr>
              </thead>
              <tbody>
              
    		<%
    			//遍历  并显示数据
    			for(OrderOrderDetail aOrderOrderDetail : list){
    				%>
    				<tr>
    					
		    			
		    			<td><%=aOrderOrderDetail.getBookname() %></td>
		    			<td><%=aOrderOrderDetail.getSingalnum() %></td>   					    			
		    		</tr>				 				
    				<%
    			}
    		%>   
    		
    		
    		
              </tbody>
            </table>
          </div>
  			<div class="col-sm-6 newsright">
					 订单号：<%=orderid %><br/><br/>
					 提交时间:<%=list.get(0).getSubmitTime() %><br/><br/>
                   	 总价格:<%=list.get(0).getTotalprice() %><br/><br/><br/><br/>
					<a href='emptyCart.action?userid=${userlogin.id}'>立即付款</a>
									
			</div>
  
 
  </body>
</html>
