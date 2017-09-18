<pre name="code" class="javascript">$(document).ready(function(){  
      $("#tname").blur(function(){  
          
         $.ajax({  
             type:"post",  
             url:"checklogin.do",  
             data:{tname:$("#tname").val()},  
             dataType:"text",  
             beforeSend:function(){  
                 $("#btn").val("正在提交，请稍等...");  
                 },   
             success:function(data){  
                 //判断输入是否成功，成功则跳转     
                 if("用户名可用!"==data){  
                     $("#tn").addClass("tn");  
                     $("#btn").val("Login");  
                      
                 }else{  
                     $("#tn").removeClass("tn").addClass("tnx");  
                     $("#btn").val("Login");   
                       
                     return false;  
                 }                           
            }     
         });  
          
      });  
      $('#btn').click(function(){  
          if($("#tname").val()=="请输入用户名" || $("#tname").val()==""||$("#password").val()=="请输入密码"|| $("#password").val()==""){  
              $("#msg").html("用户名不能为空！");  
             return false;  
         }else{  
            $.ajax({  
                 type:"post",  
                 url:"login.do",  
                 data:{tname:$("#tname").val(),tpwd:$("#password").val()},  
                 dataType:"text",  
                 beforeSend:function(){  
                     $("#btn").val("正在提交，请稍等...");  
                 },   
                 success:function(data){  
                     //判断输入是否成功，成功则跳转     
                     if("用户名可用!"==data){  
                         window.location.href="index.jsp";     
                     }else{  
                         $("#key").addClass("key");  
                        $("#btn").val("Login");  
                         return false;  
                     }                           
                }     
             });  
         }  
      })  
  });  