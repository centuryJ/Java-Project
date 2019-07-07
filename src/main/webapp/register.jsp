<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/jquery.enplaceholder.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/sea.js"></script>
<script type="text/javascript" src="js/base(1).js"></script>
<script src="js/MD5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-validate-1.12.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validate-common.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/check_reg.js"></script>
</head>

<body>
	<!--头部-->
	<c:import url="header.jsp" />
	<!-- end 头部 -->

	<!-- 主体 -->
	<div class="content">
		<!--内容区-->
		<div class="reg-box">
			<div class="wrap clearfix">
				<div class="reg-box-l">
					<div class="nor-frms-lst">
						<center><font style="color:red">${requestScope.errorInfo }</font></center>
						<form id="regform" action="registerservlet" name="regform" method="post"
							novalidate="novalidate"  >
							<ul>
								<li>
									<div class="nor-frms-tit">手机号</div>
									<div class="nor-frms-inp">
										<input type="text"  placeholder="可用于登录和找回密码"
											class="nor-inp focus" id="username" name="username">
									</div>
									<div class="nor-frms-yz" id="username_tips"></div>
								</li>
								
								<li>
									<div class="nor-frms-tit">真实姓名</div>
									<div class="nor-frms-inp">
										<input type="text"  
											class="nor-inp focus" id="realname" name="realname">
									</div>
									<div class="nor-frms-yz" id="realname_tips"></div>
								</li>
								<li>
									<div class="nor-frms-tit">密码</div>
									<div class="nor-frms-inp">
										<input type="password"  placeholder="密码"
											class="nor-inp focus" id="password" name="password">
									</div>
									<div class="nor-frms-yz" id="password_tips"></div>
								</li>
								<li>
									<div class="nor-frms-tit">确认密码</div>
									<div class="nor-frms-inp">
										<input type="password" value="" placeholder="确认密码"
											class="nor-inp focus" id="repassword" name="repassword">
									</div>
									<div class="nor-frms-yz" id="repassword_tips"></div>
								</li>
								<li>
									<div class="nor-frms-tit">上传头像</div>
									<div class="nor-frms-inp">
										<input type="file" value="" placeholder="用户头像"
											class="nor-inp focus" id="userImg" name="userImg"
											style="height: 27px">
									</div>
									<div class="nor-frms-yz" id="username_tips"></div>
								</li>
								<li class="xyz-frm-tag">
									<div class="nor-frms-tit">&nbsp;</div>
									<div class="nor-frms-inp">
										<span class="my-checkbox" id="mycheckbox" name="mycheckbox">
											<label id="agree"><em>阅读并接受</em></label><a
											href="javascript:void(0);" target="_blank">《全国大学生创业服务网用户协议》</a>
										</span>
									</div>
									<div class="nor-frms-yz" id="protocol" style="display:none">请阅读并勾选协议</div>
								</li>
							</ul>
							<div class="reg-submit">
								<input type="submit"value="注册"/>
							</div>
						</form>
						
						
					</div>
				</div>
				<!--reg-box-l End-->
				<div class="reg-box-r">
					<div class="has-reg-box">
						<p class="a">我已注册，现在就</p>
						<p class="b">
							<a href="login.jsp" class="btn-red-big"><span>登录</span></a>
						</p>
					</div>
				</div>
				<!--reg-box-l End-->
			</div>
		</div>
		<!--reg-box End-->
		<!--end 内容区-->
	</div>

	<!-- end 主体 -->
	<!--底部-->
	<c:import url="/footer.jsp" />
	<!--end 底部-->
</body>
</html>
