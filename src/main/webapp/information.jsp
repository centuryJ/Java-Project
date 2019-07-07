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
<meta charset="utf-8">
<base href="<%=basePath%>">
<link href="css/2016-meta.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/popup.css" rel="stylesheet">
<script src="js/jquery-1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/base_002.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/sea.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script src="js/MD5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-validate-1.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/validate-common.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/check_reg.js"></script>
<style>
.header_img {
	border-radius: 100%;
}
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.emp==null}">
	<c:redirect url="backlogin.jsp"/>
</c:if>
	<!--头部-->
	<c:import url="header.jsp" />
	<!-- end 头部 -->
	<!-- 主体 -->
	<div class="content">
		<!--内容区-->
		<div class="cont-wp-box modify-white-bg">
			<div class="wrap clearfix">
				<div class="cont-left">
					<div class="article-box">
						<div class="article-box-tit">
							<h4>投资中国未来 服务高校双创——全国高校创新创业投资服务联盟顺利成立</h4>
							<span>发布时间：<em> 2016年03月14日 </em></span>
						</div>
						<div class="article-box-head">
							<p style="text-align: center">
								<img alt="" zcmsimagerela="292396"
									style="width: 137px; height: 171px"
									src="images/1_2923964255.jpg" border="0">
							</p>
							<c:import url="/context/b9621f38595d424c8b8ab94faf1dcc36.jsp"/>
						</div>
					</div>
					<div class="article-list-box">
						<h4>相关文章</h4>
						<ul class="article-list">
							<li><a class="clearfix" href="javascript:void(0);"><i></i><span>百支团队争当“创客G20”
										义乌打通创业服务最后一公里</span><em> 2016年04月25日 </em></a></li>
							<li><a class="clearfix" href="javascript:void(0);"><i></i><span>教育部关于举办第二届中国“互联网+”大学生创新创业大赛的通知</span><em>
										2016年03月17日 </em></a></li>
							<li><a class="clearfix" href="javascript:void(0);"><i></i><span>义乌创业新浪潮，创客我最型第二季投融资对接会圆满落幕</span><em>
										2016年01月21日 </em></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--srh-wp-box End-->
		<!--end 内容区-->
	</div>
	<!-- end 主体-->
	<!--底部-->
	<c:import url="/footer.jsp" />
	<!--end 底部-->
</body>
</html>