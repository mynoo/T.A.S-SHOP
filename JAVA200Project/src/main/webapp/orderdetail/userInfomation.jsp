<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Information</title>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
		function neworder() {
			location.href = "<%=Noform%>other"
		}
	    function Calc() {
	        var payment = $('input:radio[name="payment"]:checked').val();
	          
	          location.href = '<%=Noform%>mallCalculate&payment=' + payment;
	}
	$(document).ready(function name() {

	});
</script>
<style type="text/css">
label {
	display: inline-block;
	margin-bottom: 0.5rem;
	color: black;
	font-family: sans-serif;
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
					<div class="row align-items-end">
						<div class="col-md-12">
							<div class="form-group mt-4">
								<div class="radio">
									<label> <input type="radio" onclick="neworder();">
										Ship to different address
									</label>
									<table class="table">
										<thead class="thead-primary" align="center">
											<tr>
												<th>NO</th>
												<th>IMAGE</th>
												<th>PRODUCT</th>
												<th>PRICE</th>
												<th>QUANTITY</th>
												<th>TOTAL</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="bean" items="${sessionScope.shoplists}">
												<tr class="alert" role="alert">
													<td>${bean.pnum}</td>
													<td><img width="45" height="45"
														src="upload/${bean.image}"></td>
													<td>${bean.pname}</td>
													<td><fmt:formatNumber value="${bean.price}"
															pattern="###,###" /> 원</td>
													<td class="quantity">
														<div class="input-group">
															<input type="text" name="quantity"
																class="quantity form-control input-number"
																value="${bean.qty}" min="1" max="100">
														</div>
													</td>
													<td><fmt:formatNumber value="${bean.price * bean.qty}"
															pattern="###,###" /> 원</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="name">Recipient</label> <input type="text" name="name"
									class="form-control" value="${loginfo.name}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="zipcode">Zipcode</label> <input type="text"
									name="zipcode" class="form-control" value="${loginfo.zipcode}">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="roadaddress">Road address</label> <input type="text"
									name="roadaddress" class="form-control"
									value="${loginfo.roadaddress}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="address2">Detail Address</label> <input type="text"
									name="address2" class="form-control"
									value="${loginfo.address2}">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="address1">Ground Number Address</label> <input type="text"
									name="address1" class="form-control"
									value="${loginfo.address1}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="extraaddress">Extra address</label> <input type="text"
									name="extraaddress" class="form-control"
									value="${loginfo.extraaddress}">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="phonenumber">Phone number</label> <input type="text"
									name="phonenumber" class="form-control"
									value="${loginfo.phonenumber}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="email">Email</label> <input type="text" name="email"
									class="form-control" value="${loginfo.email}">
							</div>
						</div>
					</div>

					<div class="row mt-5 pt-3 d-flex">
						<div class="col-md-6 d-flex">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">Cart Total</h3>
								<c:forEach var="bean" items="${sessionScope.shoplists}">
									<p class="d-flex">
										<span>Price</span> <span> <fmt:formatNumber
												value="${bean.price * bean.qty}" pattern="###,###" /> 원
										</span>
									</p>
									<p class="d-flex">
										<span>Delivery charge</span> <span>0</span>
									</p>
									<p class="d-flex">
										<span>Sale prices</span> <span>10%</span>
									</p>

									<hr>
									<p class="d-flex total-price">
										<span>Total Price</span> <span> <fmt:formatNumber
												value="${bean.price * bean.qty - bean.price/10}"
												pattern="###,###" /> 원
										</span>
									</p>
								</c:forEach>
							</div>
						</div>
						<div class="col-md-6">
							<div class="cart-detail p-3 p-md-4">
								<h3 class="billing-heading mb-4">Payment Method</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label> <input type="radio" id="payment"
												name="payment" class="mr-2" value="계좌 이체"> Direct
												Bank Tranfer
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label> <input type="radio" id="payment"
												name="payment" class="mr-2" value="신용/체크"> Check
												Payment
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label> <input type="radio" id="payment"
												name="payment" class="mr-2" value="페이"> Paypal
											</label>
										</div>
									</div>
									<div class="button" align="center">
										<button type="button" class="btn btn-primary py-3 px-4"
											onclick="Calc();">결제하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>
