<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="dish_top">
	<ul>
		<li class="dish_num"></li>
		<li>
			<a href="${pageContext.request.contextPath}/CartServlet">
			<img src="${pageContext.request.contextPath}/detail/style/images/call2.gif" />
		</a></li>
	</ul>
</div>

<div id="dish_2">
	<ul>
		<jsp:useBean id="tpUtils" class="com.res.model.FoodTypeUtils"></jsp:useBean>
		<c:forEach var="tpList" items="${pageScope.tpUtils.allType}">
			<li>
				<a href="${pageContext.request.contextPath}/FoodListServlet?typeId=${pageScope.tpList.TYPEID}">${pageScope.tpList.TYPENAME}</a>
			</li>
		</c:forEach>
	</ul>
</div>
<div id="dish_3">
	<!-- 搜索菜品表单  -->
	<form action="${pageContext.request.contextPath}/FoodListServlet" method="post">
		<table style="width: 166px;">
			<tr>
				<td>
					<input type="text" id="dish_name" name="foodName" class="select_value" style="outline: none;" value="${requestScope.fName}" /> 
					<input type="hidden" value="selectFood" name="method"></td>
			</tr>
			<tr>
				<td><input type="submit" id="sub" value="" /></td>
			</tr>
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/FoodListServlet">
						<img src="${pageContext.request.contextPath}/detail/style/images/look.gif" />
					</a>
				</td>
			</tr>
		</table>
	</form>
</div>