<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
	<!--头部-->
	<div class="header">
		<div class="wrap clearfix">
			<div class="">
				<h1 class="logo" style="margin:0;">
					<span></span>
				</h1>
			</div>
			<div class="client_side fl">
				<ul class="main_nav clearfix">
					<li class="fl"><a href="javascript:void(0);">首页</a></li>
					<li class="fl" id="xmdj"><a href="javascript:void(0);">项目对接</a></li>
					<li class="fl" id="irp"><a href="javascript:void(0);">知识产权</a></li>
					<li class="fl"><a href="javascript:void(0);">培训实训</a></li>
					<li class="fl" id="zcxc"><a href="javascript:void(0);">政策宣传</a></li>
				</ul>
			</div>


			<div class="client_login fl">
				<c:choose>
				<c:when test="${empty sessionScope.user}">
				<span class="ueser_box fl"><i class="photo"></i><img
				class="header_img" src="images/head-default-img.png" width="32"
				height="32">
				</span>
				<p>当前登录的客户为${sessionScope.u.username }</p>
				<p class="fl ueser_cnt">
					<a href="${pageContext.request.contextPath }/login.jsp">登录</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath }/register.jsp">注册</a>
				</p>
				</c:when>
				<c:otherwise>
				<span class="ueser_box fl"><i class="photo"></i><img
				class="header_img" src="upimg/${sessionScope.user.userImg }" width="32"
				height="32">
				</span>
				<p class="fl ueser_cnt">
					<a href="${pageContext.request.contextPath }/user/logout.do">退出</a>
				</p>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!--end 头部-->

  </body>
</html>
