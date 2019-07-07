<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
	<!--底部-->
	<div class="footer">
		<div class="wrap clearfix">
			<div class="foot-l">
				<ul class="foot-abt">
					<li><a target="_blank" href="javascript:void(0);">新职业</a></li>
					<li><a target="_blank" href="javascript:void(0);">关于创业网</a></li>
					<li><a target="_blank" href="javascript:void(0);">联系我们</a></li>
				</ul>
				<div class="cpy-right">
					<p class="a">主管部门：中华人民共和国教育部</p>
					<p class="b">版权所有：全国高等学校学生信息咨询与就业指导中心</p>
				</div>
			</div>
			<div class="foot-r">
				<p>京ICP备15029560号</p>
			</div>
		</div>
	</div>
	<!--end 底部-->
	
  </body>
</html>
