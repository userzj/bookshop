<%@ page language="java" import="java.util.*,cn.com.zj.pojo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询订单</title>
    
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
     <%
    List<Orders> list = (List<Orders>)request.getAttribute("list");
    	%>
    	
    	 <div class="bs-docs-example">
            <table class="table">
              <thead>
                <tr>
                  <th>订单号</th>
                  <th>提交时间</th>
                   <th>收货时间</th>
                  <th>价格</th>
                 
                  <th>是否发货</th>
                  <th>是否付款</th>
                  <th>订单状态</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              
    		<%
    			//遍历  并显示数据
    			for(Orders order : list){
    				%>
    				<tr>
    					
		    			<td><%= order.getId() %></td>
		    			<td><%=order.getSubmitTime() %></td>
		    			<td><%if(order.getConsignmenttime()==null){
    						%>暂未签收
    					<%}else{ %>    					
    					<%=order.getConsignmenttime() %>
    					<%}%></td>
		    			<td><%= order.getTotalprice() %></td>		    		
		    			<td><%if(order.getIsgo()==0){
    						%>未发货
    					<%}else{ %>    					
    					已发货
    					<%}%></td>
		    			<td><%if(order.getIspayoff()==0){
    						%>未支付
    					<%}else{ %>    					
    					已支付
    					<%}%></td>
		    			 <td><%=  order.getStatus() %></td>	
		    			 <td><%if(order.getIsgo()==0){
    						%><a href='isGoUpdate.action?id=<%=order.getId() %>'>确认发货</a>
    					<%}else{ %>    					
    					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-
    					<%}%></td>	    					    					    					    			
		    		</tr>				 				
    				<%
    			}
    		%>   
              </tbody>
            </table>
          </div>
  			<div class="col-sm-6 newsright">
					
					
									
			</div>
  </body>
</html>
