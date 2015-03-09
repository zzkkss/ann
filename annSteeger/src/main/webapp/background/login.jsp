<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.web.WebAttributes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%  
      String path = request.getContextPath();  
      String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <base href="<%=basePath %>">
    <meta name="Author" content="zks" />
<meta http-equiv="X-UA-Compatible" content="IE=7,9,10" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

 <script src="jscss/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<style type="text/css">
*{overflow:hidden; font-size:9pt;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(background/images/login-background.jpg);
	height: 100%;
	width: 100%;
}
/* #lg{
background-image: url(background/images/loginAll.png);
height: 310px;
width: 530px;
position:absolute;
top: 20%;
left: 30%;
}
form{
width: 100%;
height: 100%;
}
#lg ul {position:relative;top: 55px;left: 130px;}
#lg ul li { margin: 10px;}
#lg ul li span {float:left;}
#lg ul li a {float:left;}
.inputt {width: 150px;}
#uimg{
	background:url(background/images/loginAll.png) -217px -366px;
	width:30px;height: 30px;
	}
#pimg{
	background:url(background/images/loginAll.png) -246px -366px;
	width:30px;height: 30px;
	}
#cimg{
	width:30px;height: 30px;
	}
#chimg{
width: 100px;height: 18px;
}
#lgbtn{
	background:url(background/images/loginAll.png) -217px -316px;
	width:101px;height: 39px;
	border: 0 none;
	}
#jg{
top:40px;
position: relative;
width: 300px;
left:100px;
} */

.input-container {
  margin-left: 30%;
  margin-top: 10%;
  width: 500px;
}
#password-form {
  margin-left: auto;
  margin-right: auto;
  width: 360px;
}
.control-group:after {
  clear: both;
}
.btn-large {
  font-size: 17px;
  height: 40px;
  line-height: 20px;
  margin: 0;
  padding: 9px 30px;
}
.btn-block {
  display: block;
  padding-left: 0;
  padding-right: 0;
  width: 100%;
}
.btn-primary {
  background-color: #098cc8;
  background-image: linear-gradient(to bottom, #0f9ada, #0076ad);
  border: 0 none;
  border-radius: 2px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.3), 0 0 0 1px rgba(255, 255, 255, 0.15) inset;
  color: #fff;
  transition: background-color 0.2s ease 0s, box-shadow 0.2s ease 0s, background-color 0.2s ease 0s, border-color 0.2s ease 0s, color 0.2s ease 0s;
}
.control-group:before, .control-group:after {
  content: ".";
  display: block;
  font-size: 0;
  height: 0;
  line-height: 0;
  overflow: hidden;
  visibility: hidden;
  width: 0;
}
input.input-large {
  font-size: 17px;
  height: 40px;
  line-height: 20px;
  margin: 5px 0;
  padding: 0 10px;
}
input:invalid, input:valid, input:required {
  box-shadow: inherit;
}
.uneditable-input.input-block, select.input-block, textarea.input-block, input.input-block[type="color"], input.input-block[type="date"], input.input-block[type="datetime"], input.input-block[type="datetime-local"], input.input-block[type="email"], input.input-block[type="month"], input.input-block[type="number"], input.input-block[type="password"], input.input-block[type="search"], input.input-block[type="tel"], input.input-block[type="text"], input.input-block[type="time"], input.input-block[type="url"], input.input-block[type="week"] {
  width: 100%;
}
.persistWrapper {
  color: #fff;
  margin-top: 10px;
}
.checkbox-label{
  font-size: 16px;
}

</style>

</head>

<body >

	<!-- <div id="lg">
	  <form action="j_spring_security_check" method="post">
	   <div id="jg">请使用最新版的Windows Inetnet Explorer、Mozilla Firefox、Google Chrome进行管理，其他浏览器有可能发生错误。</div>
	<ul>
	
	<li><span id="uimg"></span><a>用户名：</a><input type="text" class="inputt" name="j_username" id="uname"  value="" ></input></li>
	<li><span id="pimg"></span><a>密　码：</a><input type="password" class="inputt" name="j_password" id="pword" value=""></input></li>
		<li><img id="cimg"><a>验证码：</a><input type="text" id="cword" name="cword" value="" ></input></li>
	<li><img src="authImg.jpg" id="chimg"><a href="javascript:refresh();">单击此处刷新</a></li>
	<li><input type="submit" id="lgbtn"></li>
	<li><input type="submit" id="lgbtn" class="lgbtn" value=""></li>
	<li><a href="register.jsp">还没有帐号？马上注册</a></li>
	</ul>

       </form>
	</div> -->
	<div class="input-container" id="login-wrapper">
		<form action="j_spring_security_check" method="post" id="password-form"
			class=" username-required input-focus">
			<div class="control-group">
				<label id="accountName-label" class="control-label"
					for="accountName">输入您的用户名</label>
				<div class="controls">
					<input type="text" aria-labelledby="accountName-label"
						id="uname" value="" name="j_username" title="输入您的用户名"
						maxlength="320" tabindex="1" class="input-block input-large"
						placeholder="输入您的用户名"  />
				</div>
			</div>
			<div class="control-group">
				<label id="password-label" class="control-label" for="password">输入您的密码</label>
				<div class="controls">
					<input type="password" aria-labelledby="password-label"
						id="pword" value="" name="j_password" title="输入您的密码"
						maxlength="16" tabindex="1" class="input-block input-large"
						autocomplete="off" placeholder="输入您的密码" />
				</div>
			</div>
			<div class="persistWrapper">
<label id="persistLogin-label" class="checkbox-label css-label  checked" for="persistLogin">
<input type="checkbox" aria-labelledby="persistLogin-label" id="persistLogin" name="persistLogin" checked="checked" tabindex="1"/>
<span class="input-checkbox"></span>
保持登录状态
</label>
</div>
			<div class="control-group submit ">
				<button type="submit" id="lgbtn"
					class="btn btn-primary btn-large btn-block " data-loading-text=""
					tabindex="1">
					登录 <i class="spinner-battlenet"></i>
				</button>
			</div>
		</form>
		
	</div>
</body>
</html>