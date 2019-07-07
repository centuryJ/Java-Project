<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 引入jstl --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- 没有登录emp的值为null -->
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>
<!-- 显示创业动态 -->
<table border="1">
	<tr>
		<td>编号</td>
		<td>标题</td>
		<td>时间</td>
		<td>正文</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${requestScope.infomations }" var="infomation">
		<tr>
			<td>${infomation.id }</td>
			<td>${infomation.title }</td>
			<td>${infomation.time }</td>
			<td>${infomation.context }</td>
			<td>
				<!-- 实现删除 -->
			    <a href="deleteinformationservlet?id=${infomation.id }">删除</a>
			    <!-- 实现修改 -->
			    <a href="preupdateinformationservlet?id=${infomation.id }">修改</a>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>