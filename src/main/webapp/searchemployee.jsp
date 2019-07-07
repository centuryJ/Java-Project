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
	<!-- 查询创业动态 -->
	<form action="searchemployeeServlet" method="get">
		标题<input type="text" name="name" value="${requestScope.name }"/>
		    <input type="submit" value="查询"/>
	</form>
	<!-- 显示创业动态 -->
	<table border="1">
		<tr>
			<td>员工ID</td>
			<td>员工名称</td>
			<td>员工密码</td>
			<td>员工姓名</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="obj">
			<tr>
				<td>${obj.id }</td>
				<td>${obj.name }</td>
				<td>${obj.password }</td>
				<td>${obj.realname }</td>
				<td>
					<!-- 实现删除 -->
				    <a href="deleteemployeeserverlet?id=${obj.id }">删除</a>
				    <!-- 实现修改 -->
				    <a href="preupdateemployeesserverlet?id=${obj.id }">修改</a>
				</td>
			</tr>
		</c:forEach>
	</table>

	<!-- 分页 -->
	<div id="fenye" style="margin-top: 30px;">
		<!-- 首页：当前的页码为1 -->
	    <a href="searchemployeeServlet?pc=1&name=${name}" class="layui-btn layui-btn-small layui-btn-primary">首页</a>
	    <!-- pb.pc为当前的页码，大于1时，才能点击 上一页 -->
	    <c:if test="${pb.pc > 1 }">
	    	<a href="searchemployeeServlet?pc=${pb.pc-1}&name=${name}" class="layui-btn layui-btn-small layui-btn-primary">
	    		上一页
	   		</a>
	    </c:if>
	    <!-- pb.pc为当前的页码，小于等于1时，不能点击 上一页 -->
	    <c:if test="${pb.pc <= 1 }">
	    	<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-disabled">
	    		上一页
	   		</a>
	    </c:if>
	             第${pb.pc }页
	   	<!-- pb.pc为当前的页码， pb.tp为总页数，当前的页码小于总页数时，才能点击下一页 -->
	    <c:if test="${pb.pc < pb.tp }">
	    	<a href="searchemployeeServlet?pc=${pb.pc+1}&name=${name}" class="layui-btn layui-btn-small layui-btn-primary">下一页</a>
	    </c:if>
	    <!-- pb.pc为当前的页码， pb.tp为总页数，当前的页码大于等于总页数时，不能点击下一页 -->
	    <c:if test="${pb.pc >= pb.tp }">
	    	<a href="javascript:;" class="layui-btn layui-btn-small layui-btn-disabled">下一页</a>
	    </c:if>
	    <!-- 尾页：当前的页码为总页数 -->
	    <a href="searchemployeeServlet?pc=${pb.tp}&name=${name}" class="layui-btn layui-btn-small layui-btn-primary">尾页</a>共${pb.tp }页
   </div>


</body>
</html>