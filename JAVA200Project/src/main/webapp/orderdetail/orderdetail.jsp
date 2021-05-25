<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Detail</title>

<script type="text/javascript">
		function gotomain() {
			location.href = "<%=Noform%>
	main";
	}
</script>
<style type="text/css">
.ftco-section {
	color: #000;
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
					<h2 class="mb-0 bread">Order Information</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<h3 class="mb-4 billing-heading">${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님
						주문 상세 내역</h3>
					<hr>
					<p>
						${sessionScope.loginfo.name}님이 <br> <strong>${order.orderdate}</strong>에
						구매하신 상품에 대한 상세 결제 내역입니다.
					</p>
					<hr>

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">주문 내역</h3>
						</div>
						<div class="panel-body">
							<table class="table table-condensed">
								<thead>
									<tr>
										<th class="text-center">제품명</th>
										<th class="text-center">이미지</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="totalAmount" value="0" />
									<c:forEach var="shopinfo" items="${requestScope.lists}">
										<tr>
											<td class="text-center">${shopinfo.pname}</td>
											<td class="text-center"><img alt="${shopinfo.image}"
												width="45" height="45" src="upload/${shopinfo.image}">
											</td>
											<td class="text-center"><fmt:formatNumber
													value="${shopinfo.price}" pattern="###,###" /> 원</td>
											<td class="text-center"><fmt:formatNumber
													value="${shopinfo.qty}" pattern="###,###" /> 개</td>
											<td class="text-center"><c:set var="amount"
													value="${shopinfo.price * shopinfo.qty}" /> <c:set
													var="totalAmount" value="${totalAmount + amount}" /> <fmt:formatNumber
													value="${amount}" pattern="###,###" /> 원</td>
										</tr>
									</c:forEach>
									<tr>
										<td class="thick-line"></td>
										<td class="thick-line"></td>
										<td class="thick-line"></td>
										<td class="thick-line text-center"><strong>합계</strong></td>
										<td class="thick-line text-right"><fmt:formatNumber
												value="${totalAmount}" pattern="###,###" /> 원</td>
									</tr>
									<%-- 요금에 따른 운송비 구하기 --%>
									<tr>
										<td class="no-line"></td>
										<td class="no-line"></td>
										<td class="no-line"></td>
										<td class="no-line text-center"><strong> 운송비 </strong></td>
										<td class="no-line text-right"><fmt:formatNumber
												value="${shipExpense}" pattern="###,###" /> 원</td>
									</tr>
									<tr>
										<td class="no-line"></td>
										<td class="no-line"></td>
										<td class="no-line"></td>
										<td class="no-line text-center"><strong> 최종 금액 </strong>
										</td>
										<td class="no-line text-right"><fmt:formatNumber
												value="${totalAmount}" pattern="###,###" /> 원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">결제 정보</h3>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center gr">주문 번호</td>
										<td>${order.oid}</td>
										<td class="text-center gr">주문 날짜</td>
										<td>${order.orderdate}</td>
									</tr>
									<tr>
										<td class="text-center gr">주문 총액</td>
										<td><fmt:formatNumber value="${totalAmount}"
												pattern="###,###" /> 원</td>
										<td class="text-center gr">할인 금액</td>
										<td><c:set var="discount" value="${totalAmount * 0.1}" />
											<fmt:formatNumber value="${discount}" pattern="###,###" /> 원
										</td>
									</tr>
									<tr>
										<td class="text-center gr">결제 금액</td>
										<td><fmt:formatNumber value="${totalAmount - discount}"
												pattern="###,###" /> 원</td>
										<td class="text-center gr">결제 상태</td>
										<td>결제 완료</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">배송 정보</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center gr"><strong> 받으시는 분 </strong></td>
										<td><c:if test="${sessionScope.otherinfo.fname == null}">
												${sessionScope.loginfo.name}
											</c:if> ${sessionScope.otherinfo.fname}님</td>
									</tr>
									<tr>
										<td class="text-center gr"><strong> 우편 번호 </strong></td>
										<td><c:if
												test="${sessionScope.otherinfo.zipcode == null}">
												${sessionScope.loginfo.zipcode}
											</c:if> ${sessionScope.otherinfo.zipcode}</td>
									</tr>
									<tr>
										<td class="text-center gr"><strong> 주소 </strong></td>
										<td><c:if
												test="${sessionScope.otherinfo.roadaddress == null}">
												${sessionScope.loginfo.roadaddress}
											</c:if> ${sessionScope.otherinfo.roadaddress} &nbsp; <c:if
												test="${sessionScope.otherinfo.address2 == null}">
												${sessionScope.loginfo.address2}
											</c:if> ${sessionScope.otherinfo.address2}</td>
									</tr>
									<tr>
										<td class="text-center gr"><strong> 결제 방법 </strong></td>
										<td>${sessionScope.payment}</td>
									</tr>
								</tbody>
							</table>
							<div class="button" style="float: right;">
								<input type="button" class="btn btn-primary" value="Home" onclick="gotomain()">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>