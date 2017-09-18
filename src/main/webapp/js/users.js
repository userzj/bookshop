$("document").ready(function (){
	$(".dd").click(function (){
		alert("您确定要退出本次登陆吗???");
		if("您确定要退出本次登陆吗???"){
			open(formartURL("/shopping/usersAction_exit.action"),"_self");
		}
	});
});