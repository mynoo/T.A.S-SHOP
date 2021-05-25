<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String payment = (String) request.getAttribute("optradio");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Detail</title>

<script type="text/javascript">
		function gotomain() {
			location.href = "<%=Noform%>main";
	}
</script>
<style type="text/css">
p {
	color: #000;
}

.ftco-section {
	font-family: 'Slabo 27px', serif;
}

th.text-center {
	color: #000 !important;
}
</style>
</head>
<body>

	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<%=contextPath%>/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"> <a href="<%=Noform%>main">Home <i
								class="fa fa-chevron-right"></i></a>
						</span> <span>Order<i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Order List</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<h3 class="mb-4 billing-heading">${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님
						주문 내역</h3>
					<hr>
					<p>
						${sessionScope.loginfo.name}님이 <br> <strong>${order.orderdate}</strong>에
						구매하신 상품에 대한 주문 내역입니다.
					</p>
					<hr>

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">주문 정보</h3>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">이미지</th>
										<th class="text-center">상품명</th>
										<th class="text-center">수량</th>
										<th class="text-center">단가</th>
										<th class="text-center">금액</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<c:if test="${sessionScope.shoplists == null}">
									<tr>
										<td colspan="7">${sessionScope.errmsg}</td>
									</tr>
								</c:if>
								<c:forEach var="shopinfo" items="${sessionScope.shoplists}">
									<tr>
										<td align="center">${shopinfo.pnum}</td>
										<td align="center"><img class="img-rounded"
											alt="${shopinfo.pname}" width="45" height="45"
											src="uploade/${shipinfo.image}"> <br></td>
										<td align="center">${shopinfo.pname}</td>
										<td align="center">${shopinfo.qty}개</td>
										<td align="center"><fmt:formatNumber
												value="${shopinfo.price}" pattern="###,###" />원</td>
										<td align="center"><fmt:formatNumber
												value="${shopinfo.qty * shopinfo.price}" pattern="###,###" />원
										</td>
										<td align="center"><a
											href="<%=Noform%>mallDelete&pnum=${shopinfo.pnum}"> 삭제 </a>
									</tr>
								</c:forEach>
								<tr class="header">
									<td colspan="4" align="center"><a
										href="<%=Noform%>mallCalculate">결재하기</a> &nbsp;&nbsp; <a
										href="<%=Noform%>prList">계속 쇼핑하기</a></td>
									<td colspan="4" align="center">총 금액 : <fmt:formatNumber
											value="${sessionScope.totalAmount}" pattern="###,###" />원
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>