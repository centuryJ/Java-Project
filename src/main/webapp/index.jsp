<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>主页功能</title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
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
<script src="js/jquery.SuperSlide.2.1.1.js"></script>

<style type="text/css">
.tabs_title span {
	cursor: pointer;
}
</style>
<script src="js/jqBanner.js" type="text/javascript"></script>
<script src="js/TabSwitch.js" type="text/javascript"></script>
<script src="js/jquery.pagination.js" type="text/javascript"></script>
<link href="css/base(2).css" rel="stylesheet" type="text/css">
<link href="css/index(1).css" rel="stylesheet" type="text/css">
<style>
/*红包弹窗*/
.lucky .bd {
	font-size: 14px;
}

.lucky .gxn {
	color: #ff9e12;
}

.lucky .yhd {
	color: #333333;
	font-weight: bold;
}

.lucky .money {
	font-size: 24px;
	color: #ff5050;
	font-weight: bold;
}

.lucky .ts {
	font-size: 12px;
	color: #999999;
}

/*红包弹窗*/
.hb-layer {
	background-color: transparent;
	border: none;
	width: 727px;
	height: 579px;
	background: url(../front/dist/images/hb-bg.png) no-repeat center top;
	margin-left: -363px;
	margin-top: -289px;
}

.hb-main {
	width: 510px;
	margin-left: 80px;
	padding: 30px;
}

.hb-main .hd {
	position: relative;
	padding-left: 103px;
	min-height: 88px;
}

.hb-main .hd-img {
	width: 88px;
	height: 88px;
	position: absolute;
	left: 0;
	top: 0;
}

.hb-main .hb-xmname {
	padding-bottom: 3px;
	font-size: 18px;
	font-weight: bold;
}

.hb-main .hb-tg {
	font-size: 24px;
	font-weight: bold;
	color: #11a551;
}

.hb-main .hb-tg img {
	vertical-align: middle;
}

.hb-main .hb-txt {
	margin-top: 10px;
	text-align: center;
	font-size: 18px;
}

.hb-main .hb-txt span {
	color: #bc2414;
}

.hb-main .hb-img img {
	width: 100%;
	height: 163px;
	border-radius: 3px;
	margin: 15px 0 40px;
}

.hb-cqbtn {
	width: 130px;
	height: 130px;
	display: inline-block;
	position: absolute;
	left: 50%;
	bottom: 44px;
	z-index: 1002;
	border-radius: 50%;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	color: #be8600;
	overflow: hidden;
	margin-left: -80px;
}

.hb-cqbtn span {
	position: relative;
	top: 6px;
}
</style>
<style>
.header_img {
	border-radius: 100%;
}
</style>
</head>
<body>
	<!--头部-->
	<c:import url="header.jsp" />
	<!-- end 头部 -->

	<div class="wrap">

		<!--[ Temp: body_box ]-->
		<div class="body_box clearfix">
			<div class="body_left fl">
				<div class="tabs clearfix">
					<h3 class="tabs_title">
						<strong>优秀项目<i class="triangle_right"></i></strong>
						<div class="txtScroll-left">
							<div class="bd">
								<div class="tempWrap"
									style="overflow:hidden; position:relative; width:684px">
									<ul class="infoList" style="width: 2394px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
									</ul>
								</div>
							</div>
						</div>
					</h3>
					<div class="tabs_con">

						<div class="tab">
							<ul class="tabs_list clearfix">
							<c:forEach items="${applicationScope.itemList}" var="item">
								<li class="fl">
									<p class="phot">
										<img
											src="images/${item.itemImg }"
											width="375" height="200">
									</p>
									<p class="name">${item.itemTitle }
									<c:if test="${item.itemStage.stageId eq 1 }">
									<i class="invest_ico_gray"></i>
									</c:if>
									</p>
									<p class="tits">${item.itemUnit }</p>
									<p class="link">
										<a>${item.itemIndustry.industryTitle }</a>
									</p>
									<p class="weal">
									<c:forEach items="${item.itemTypeList }" var="type">
										<a href="javascript:void(0)" class="one">${type.typeName }</a>
									</c:forEach>
									</p>
								</li>
							</c:forEach>
							</ul>
							<div>
								<a href="#" class="seemore_btn">加载更多</a>
							</div>
						</div>


					</div>
				</div>
			</div>
			<!-- body_left  // -->
			<!-- body_right  // -->
			<div class="body_right fr">
				<div class="br_main_cnt fr">
					<div class="cst_box">
						<div class="cst_tp">
							<div class="sct_tp_bdr clearfix">
								<h4 class="fl">
									创业动态<i class="arrow_ico"></i>
								</h4>
								<br>
								<!-- 只显示创业动态的标题 -->
								<ul>
									<c:forEach items="${sessionScope.infos }" var="info">
										<li><a href="infodetailservlet?id=${info.id }">${info.title }</a></li>
									</c:forEach>
								
								</ul>
								<div class="cst_tp_r fr">
									<a
										href="javascript:void(0)"
										class="cst_tp_more">更多&gt;</a>
								</div>
							</div>
						</div>
						<div class="cst_bd">
							<div class="news_box">
								<ul class="news_all_list">
								<c:forEach items="${applicationScope.infoList }" var="info">
									<li><a href="information.jsp">
									<i class="square"></i>
									${info.infoTitle }</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--cst_box End-->
					<div class="cst_box">
						<div class="cst_tp">
							<div class="sct_tp_bdr clearfix">
								<h4 class="fl">
									创业政策<i class="arrow_ico"></i>
								</h4>
								<br>
								<br>
								<br>
								<br>
								<br>
								<!-- 只显示创业动态的标题 -->
								<ul>
									<c:forEach items="${sessionScope.nws}" var="nes">
										<li><a href="newsdetailservlet?id=${nes.id }">${nes.title }</a></li>
									</c:forEach>
								
								</ul>
								<div class="cst_tp_r fr">
									<a
										href="javascript:void(0)"
										class="cst_tp_more">更多&gt;</a>
								</div>
							</div>
						</div>
						<div class="cst_bd">
							<div class="news_box">
								<ul class="news_all_list">
									<li></li>
								</ul>
							</div>
						</div>
					</div>
					<!--cst_box End-->
				</div>
			</div>
			<!-- body_right  // -->
		</div>
		<!--[ TempEnd: body_box ]-->
	</div>
<!--底部-->
<c:import url="/footer.jsp"/>
<!--end 底部-->
</body>
</html>