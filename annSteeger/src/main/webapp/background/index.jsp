<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""  pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <!--    //getContextPath():返回项目名称  
    //getServerName():返回服务器名称  
    //getScheme(): Returns the name of the scheme used to make this request, for example, http, https, or ftp.  
    //getServerPort():返回服务端口号  
 -->
    <%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
<base href="<%=basePath %>" />
<link rel="icon" href="decorators/background/images/32.ico"/>
 <link rel="bookmark" href="decorators/background/images/32.ico" />
<link rel="shortcut icon"  href="ecorators/background/images/32.ico" /> 
	<title>后台管理系统</title>

	 	<link href="background/css/app.css" rel="stylesheet" type="text/css"></link>
<%--加载JQuery--%>
<script type="text/javascript" src="background/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
$(function() {
	 $("#indexRight").css("height",$(window).height()-120+70);
	 $("#indexLeft").css("height",$(window).height()-75);
	 $("#indexRight").css("width",$(window).width()-160);
	 
	 $( window ).resize(function(){
		 location=location;
	 });
	 
	    });
/**
	 * 非动态加载的控件的AJAX功能初始化
	 */
	$(document).ready(function() {
		$("#npbtn").click(function() {
			if( $('#newPt').val()== $('#confirmPt').val()){
				var params = {
						"password" : $('#newPt').val()
					};
					$.ajax({
						// 请求的url
						url : "usersEdit.do",
						type : "post",
						data : params,
						cache : false,
						dataType : "text",
						success : function(e) {
			document.getElementById("changMessage").innerHTML="修改成功！";
						},
						 error:function(XMLHttpRequest, textStatus, errorThrown){  
							 document.getElementById("changMessage").innerHTML="修改失败！";
					  }
					});
			}else{
				alert("两次密码输入不一致,请重新输入！");
				$('#newPt').value="";
				$('#confirmPt').value="";
			}

				});
	});
	function changePassword(){
		if(document.getElementById("newPassword").style.display==""){
			document.getElementById("newPassword").style.display="none";
		}else{
			document.getElementById("newPassword").style.display="";
		}
		
	}
	function clearChang(){
		document.getElementById("newPassword").style.display="none";
	}
	function clearAndOut(){
		window.location.href="login.jsp?backurl="+window.location.href;
	}


		</script>
		

<style type="text/css">

.content_top {
    background: url("decorators/images/background/bg_header0cb570.png") repeat-x scroll 0 0 #144883;
    height: 30px;
    width: 100%;
}
.content_top li {
    background: url("decorators/images/background/bg_nav0cb570.png") no-repeat scroll 1px 0 rgba(0, 0, 0, 0);
    float: left;
    height: 30px;
    line-height: 30px;
    list-style: none outside none;
    margin-left: -1px;
    width: 105px;
}
.content_top li a {
    color: #FFFFFF;
    display: block;
    font-size: 14px;
    height: 30px;
    line-height: 30px;
    outline: medium none;
    text-align: center;
}
 .content_right {
    margin-left: 215px;
 min-height: 250px;
}
 
.content_left {
    position: absolute;
    width: 215px;
    background-color: #1C86EE;
    
}
#indexRight {
  border:none;
  left: 160px;
  position: absolute;
  top: 50px;
  border-top-color: #fff;
  border-top-style: solid;
  border-top-width: 2px;
}
</style>
<script type="text/javascript">
function topclick(e){
	self.parent.frames["indexRight"].src="manage.jsp";
}

function outclick(e){
	parent.location.href='background/login.jsp';
}
</script>
</head>

<body >
	<div id="top" style="float: left; width: 100%;">
<!-- 头文件 header -->

	<div class="area top" id="header">

		<div class="logo" style="overflow: hidden;"><img src="background/images/background_0000_logo.png" alt="" />
			<a href="#"></a>
		</div>
		<div id="huany">欢迎使用后台管理系统</div>
		<div class="gong" id="header_gong">
			<div id="functionKey">
				<ul>
					<li><a href="javascript:changePassword()" class="func2">修改密码</a></li>
					<li><a onClick="outclick(this)" class="func4">退出登录</a></li>
				</ul>
			</div>
			<div class="sou">
				<!--p><input name="" type="text" class="kk1" /></p>
				<span><input name="" type="button" class="an1" /></span-->
			</div>
		</div>
	</div>
	<!--AND -->

			<!-- <div id="content_top" class="content_top">
			<li><a onClick="topclick(this)">作品上传</a></li>
			<li><a onClick="topclick(this)">作品上传</a></li>
			<li><a onClick="topclick(this)">作品上传</a></li>
			</div> -->

<div id="newPassword" style="width: 356px;height: 196px;position: absolute;top: 50%;left: 50%;z-index: 1000;  display: none;">
<input type="button"  id="cleanChangePassword" style="position: relative;top: 10px;left: 326px;" onclick="clearChang()" ></input>

	<ul style="position: relative;;top: 50px;left: 25px;">
	<li   id="changMessage"> 修改密码，请不要使用过于简单的密码！</li>
	<li><img id="newP"><a>新 密 码：</a><input type="password" id="newPt" ></input></img></li>
	<li><img id="confirmP"><a>验证密码：</a><input type="password" id="confirmPt"></input></img></li>
	<li><input type="button" id="npbtn" ></input></li>
	</ul>
	
</div>

</div>
<!-- top结束 -->
<!-- left -->
<iframe id="indexLeft" name="indexLeft" src="background/left.jsp" frameborder="0"  allowtransparency style="width: 160px; position: absolute;top:75px;left:0px;border: none;" ></iframe>
<!-- left结束 -->
<!-- right -->
<iframe id="indexRight" name="indexRight" frameborder="0"  allowtransparency src="background/right.jsp" ></iframe>
<!-- right结束 -->
</body>

</html>
