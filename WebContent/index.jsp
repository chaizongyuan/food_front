﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<style type="text/css">
* {
	margin: 0px;
	padding: 0px
}

#dish_2 a {
	text-decoration: none;
	font-size: 36px;
	color: #000;
}

#dish_2 ul {
	list-style: none;
}

#dish_2 li {
	background: url(style/images/img/btn.gif);
	width: 164px;
	height: 47px;
	text-align: center;
	padding-top: 5px;
}
</style>
</head>
<body style="text-align: center">
	<!--外部的大层-->
	<div class="index_all" style="text-align: center;">
		<!--上面的背景层-->
		<div>
			<img src="detail/style/images/flower.gif" />
		</div>
		<!--中间层-->
		<div id="index_center">
			<!--中间层的空白层-->
			<div id="space"></div>
			<!--中间层的菜单层-->
			<div>
				<!--菜单层的左边-->
				<div id="index_centerleft"></div>
				<!--菜单层的中间-->
				<div class="bg_middle">
					<img src="detail/style/images/index_menu.gif" border="0"
						usemap="#Map" />
					<map name="Map" id="Map">
						<area shape="rect" coords="164,99,354,199" href="#" />
					</map>
				</div>
				<!--中间层的右边-->
				<div id="index_centerright"></div>
			</div>

			<!--放桌子的层-->
			<div id="center_bottom">
				<ul style="display: inline-table">
					<c:forEach var="tbList" items="${requestScope.pager.data}">
						<li>
							<c:if test="${pageScope.tbList.DSTATE == 1}">
								<a href="javascript:volid(0)" style="color: red; font-size: 15px;">
									${pageScope.tbList.DNAME}(满)
								</a>
							</c:if>
							<c:if test="${pageScope.tbList.DSTATE == 0}">
								<a href="${pageContext.request.contextPath}/SubDeskServlet?deskId=${pageScope.tbList.DESKID}">
									${pageScope.tbList.DNAME}
								</a>
							</c:if>
						</li>
					</c:forEach>
				</ul>
				<br />
				<a href="${pageContext.request.contextPath}/DeskListServlet?curPage=1">首页</a>
					<a href="${pageContext.request.contextPath}/DeskListServlet?curPage=${requestScope.pager.prePage}">上一页</a>
						<c:forEach var="i" begin="1" end="${requestScope.pager.totalPage}" step="1">
							<a href="${pageContext.request.contextPath}/DeskListServlet?curPage=${pageScope.i}">${pageScope.i}</a>
						</c:forEach>
					<a href="${pageContext.request.contextPath}/DeskListServlet?curPage=${requestScope.pager.nextPage}">下一页</a>
				<a href="${pageContext.request.contextPath}/DeskListServlet?curPage=${requestScope.pager.totalPage}">尾页</a>
			</div>
		</div>
		<!--下面的背景层-->
		<div>
			<img src="detail/style/images/flower.gif" />
		</div>
	</div>
</body>
</html>