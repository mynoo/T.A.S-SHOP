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

<script src="<%=contextPath%>/common/common.jsp"></script>

<script type="text/javascript">
		
		function addrfind() {
			var id = document.neworderinfo.id.value;
			
			var url = '<%=Noform%>otheraddrList&id=' + id;

		window.open(url, 'mywin','left=800, top=400, menubar=no, height=500, width=700, scrollbar=yes')

	}

	function isCheckForm() {
		document.neworderinfo.isCheck.value = false;
	}

	$(document).ready(function name() {

	});
</script>
<style type="text/css">
.ftco-section {
	font-family: 'Slabo 27px', serif;
}
.col-md-6 {
    margin: 0 auto;
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
					<form action="<%=YesForm%>" class="billing-form"
						name="neworderinfo" method="post">

						<input type="hidden" name="command" value="otheraddrInsert">
						<input type="hidden" name="isCheck()" value="false">

						<div class="form-group">
							<div class="col-md-12">
								<div class="form-group mt-4">
									<div class="radio">
										<label> <input type="radio" onclick="addrfind()"
											class="mr-2">View previously used addresses
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
														<td><fmt:formatNumber
																value="${bean.price * bean.qty}" pattern="###,###" /> 원</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">Id</label> <input type="text" id="id"
										name="id" class="form-control" value="${loginfo.id}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">Recipient</label> <input type="text"
										id="name" name="name" class="form-control">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="zipcode">Zipcode</label> <input type="text"
										id="zipcode" name="zipcode" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="button">
									<input type="button" class="btn btn-primary"
										onclick="zipfind();" value="Find Zipcode Code">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="roadaddress">Road address</label> <input
										type="text" id="roadaddress" name="roadaddress"
										class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address2">Detail Address</label> <input type="text"
										id="address2" name="address2" class="form-control">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address1">Ground Number Address</label> <input
										type="text" id="address1" name="address1" class="form-control">
									<span id="guide" style="color: #999; display: none"></span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="extraaddress">Extra address</label> <input
										type="text" id="extraaddress" name="extraaddress"
										class="form-control">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phonenumber">Phone number</label> <input
										type="text" id="phonenumber" name="phonenumber"
										class="form-control" value="${loginfo.phonenumber}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">Email</label> <input type="text" id="email"
										name="email" class="form-control" value="${loginfo.email}">
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
											<input type="submit" class="btn btn-primary py-3 px-4"
												style="background-color: #b7472a; color: white;"
												value="Place to order">
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- END -->
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>