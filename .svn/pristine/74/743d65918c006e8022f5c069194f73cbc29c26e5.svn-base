<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 包含公共的JSP代码片段 -->

<title>无线点餐平台</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/detail/style/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/detail/style/js/page_common.js"></script>
<link href="${pageContext.request.contextPath}/detail/style/css/common_style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail/style/css/index_1.css" />
<link href="${pageContext.request.contextPath}/detail/style/css/index.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
	<div id="all">
		<div id="menu">
			<!-- 显示菜品的div -->
			<div id="top">
				<ul>
					<!-- 循环列出餐品 -->
					<c:forEach var="foodList" items="${requestScope.pager.data}">
						<li>
							<dl>
								<dt>
									<a href="FoodDetailServlet?foodId=${pageScope.foodList.FOODID}"> 
										<img width="214px" height="145px" src="${pageContext.request.contextPath}/ImageServlet?imgName=${pageScope.foodList.IMAGEPATH}" />
									</a>
								</dt>
								<dd class="f1">
									<a href="FoodDetailServlet?foodId=${pageScope.foodList.FOODID}">${pageScope.foodList.FOODNAME}</a>
								</dd>
								<dd class="f2">
									<a href="FoodDetailServlet?foodId=${pageScope.foodList.FOODID}">¥${pageScope.foodList.PRICE}</a>
								</dd>
							</dl>
						</li>
					</c:forEach>
				</ul>
			</div>

			<!-- 底部分页导航条div -->
			<div id="foot">
				<span style="float: left; line-height: 53PX; margin-left: -50px; font-weight: bold;">
					<span style="font-weight: bold">&lt;&lt;</span>
				</span>
				<div id="btn">
					<ul>
						<!-- 参看 百度, 谷歌是 左 5 右 4 -->
						<c:forEach var="i" begin="1" end="${requestScope.pager.totalPage}" step="1">
							<li>
								<a href="${pageContext.request.contextPath}/FoodListServlet?curPage=${pageScope.i}&typeId=${requestScope.typeId}">${pageScope.i}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<span style="float: right; line-height: 53px; margin-right: 10px;">
					<a href="javascript:valid(0)" style="text-decoration: none; color: #000000; font-weight: bold">&gt;&gt;</a>
				</span>
			</div>
		</div>
		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
			<jsp:include page="include.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
