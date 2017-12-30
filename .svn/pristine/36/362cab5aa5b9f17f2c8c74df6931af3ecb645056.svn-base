<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail/style/css/index.css" />
	<script type="text/javascript">
	
		function confirmDelete(fid){
			if (confirm("是否删除当这道菜？")) {
				window.location="CartServlet?foodId=" + fid + "&flag=delete";
			}
		}
		
		function submitOrder(){
			window.location='${pageContext.request.contextPath}/CartServlet?flag=order&totalMoney=' + document.getElementById('totalMoney').innerHTML;
		}
		
		<%--计算总值--%>
		window.onload = function(){
			var counts = document.getElementsByClassName('count');
			var totalCount = 0;
			
			for (var int = 0; int < counts.length; int++) {
				totalCount += parseInt(counts[int].innerHTML);
			}
			document.getElementById('totalMoney').innerHTML = '¥ ' + totalCount;
		}
	</script>
</head>

<body style="text-align: center">
	<div id="all">
		<div id="menu">
			<!-- 餐车div -->
			<div id="count">
				<table align="center" width="100%">
					<tr height="40">
				 		<td align="center" width="20%">菜名</td>
				 		<td align="center" width="20%">单价</td>
				 		<td align="center" width="20%">数量</td>
				 		<td align="center" width="20%">小计</td>
				 		<td align="center" width="20%">操作</td>
				 	</tr>
				 	<c:forEach var="temp" items="${sessionScope}">
						<c:if test="${fn:startsWith(pageScope.temp.key , 'cart_')}">
							<tr height="60">
							 	<td align="center" width="20%">${pageScope.temp.value.foodName}</td>
							 	<td align="center" width="20%">￥${pageScope.temp.value.price}</td>
							 	<td align="center" width="20%">
							 		<input type="text" value="${pageScope.temp.value.count}" size="3" lang="3" onblur="alterSorder(this)"/>
							 	</td>
							 	<td align="center" width="20%" class="count">${pageScope.temp.value.price * pageScope.temp.value.count}</td>
							 	<td align="center" width="20%">
							 		<input type="button" value="删除" class="btn_next" lang="3" onclick="confirmDelete(${pageScope.temp.value.foodId})" />
							 	</td>
				 			</tr>
						</c:if>
				 	</c:forEach>
					<tr>
						<td colspan="6" align="right">总计:
							<span style="font-size:36px;" id="totalMoney"></span>
							<label id="counter" style="font-size:36px"></label>
						</td>
					</tr>
					<tr>
						<td colspan="6" style="margin-left: 100px; text-align: center;"align="right">
							<input type="hidden" name="bId" value="">
							<input type="button" value="下单" class="btn_next" onclick="submitOrder()" />
						</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- 右边菜系列表，菜品搜索框  -->
		<div id="dish_class">
			<jsp:include page="include.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
