<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
	<!-- 包含公共的JSP代码片段 -->
	
<title>无线点餐平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/detail/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/detail/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath}/detail/style/css/common_style_blue.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail/style/css/index_1.css" />
<link href="${pageContext.request.contextPath}/detail/style/css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail/style/css/dis_message.css" />
</head>
<body style="text-align: center">
	<div id="all">
		<!--左边菜品详细信息 -->
		<div id="menu1">
			<div class="menu2" style="text-align:center;">
				<img src="${pageContext.request.contextPath}/detail/style/images/order_detials_bg.png" />
			</div>
			<c:forEach var="temp" items="${requestScope.foodDetail}">
				<div class="menu3" >
					<div class="menu3_left">
						<img src="ImageServlet?imgName=${pageScope.temp.IMAGEPATH}" style="width:270px; height:290px;" />
					</div>
					<div class="menu3_right">
						<p>菜名:${pageScope.temp.FOODNAME}</p>
						<p>价格:&nbsp;&nbsp;&yen;&nbsp;${pageScope.temp.PRICE}</p>
						<p style="font-size: 25px;">简介:${pageScope.temp.DESCS}</p>
					</div>
				</div>
				<div class="menu4">
					<a href="${pageContext.request.contextPath}/CartServlet?foodId=${pageScope.temp.FOODID}&foodName=${pageScope.temp.FOODNAME}&price=${pageScope.temp.PRICE}&flag=addToCart" style="background:url(${pageContext.request.contextPath}/detail/style/images/img/order_left_corner_bg.png);">放入餐车</a>
					<a href="#" onclick="javascript:history.go(-1);" style="background:url(${pageContext.request.contextPath}/detail/style/images/img/order_right_corner_bg.png);">返回</a>
				</div>
			</c:forEach>
		</div>
		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
			<jsp:include page="include.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
