<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/detail/style/css/index.css" />
	<script type="text/javascript">
		// 通知服务员结账
		function callPay() {
			alert('尊敬的顾客,您好!已经通知服务员结账，请稍等!');
			window.location.href='DeskListServlet';
		}
		
		<%--计算总值--%>
		window.onload = function(){
			alert('下单成功');
			var counts = document.getElementsByClassName('count');
			var totalCount = 0;
			
			for (var int = 0; int < counts.length; int++) {
				totalCount += parseInt(counts[int].innerHTML);
			}
			document.getElementById('totalMoney').innerHTML = '&yen; ' + totalCount;
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
				 	</tr>
					<c:forEach var="temp" items="${requestScope.list}">
						<tr height="60">
						 	<td align="center" width="20%">${pageScope.temp.foodName}</td>
						 	<td align="center" width="20%">&yen; ${pageScope.temp.price}</td>
						 	<td align="center" width="20%">${pageScope.temp.count}</td>
						 	<td align="center" width="20%" class="count">${pageScope.temp.price * pageScope.temp.count}</td>
				 		</tr>
				 	</c:forEach>
					<tr>
						<td colspan="6" align="right">总计:
							<span style="font-size:36px;" id="totalMoney" ></span>
							<label id="counter" style="font-size:36px"></label>
						</td>
					</tr>
					<tr>
						<td colspan="6" style="margin-left: 100px; text-align: center;"align="right">
							<input type="hidden" name="bId" value="">
							<input type="button" value="结账" class="btn_next" lang="" onclick="callPay()" />
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
