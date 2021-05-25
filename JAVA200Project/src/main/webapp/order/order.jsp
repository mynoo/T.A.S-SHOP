<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.ftco-section{
	font-family: 'Slabo 27px', serif;
}
</style>
</head>

<body>
	<jsp:include page="../common/generalhead.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=contextPath%>/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate mb-5 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="<%=Noform%>main">Home <i class="fa fa-chevron-right"></i></a></span> <span>Cart <i class="fa fa-chevron-right"></i></span></p>
            <h2 class="mb-0 bread">My Cart</h2>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-primary" align="center">
							<tr>
								<th>&nbsp;</th>
								<th>NO</th>
								<th>IMAGE</th>
								<th>NAME</th>
								<th>PRICE</th>
								<th>QUANTITY</th>
								<th>TOTAL</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bean" items="${sessionScope.shoplists}">
								<tr class="alert" role="alert">
									<td><input type="checkbox"></td>
									<td>${bean.pnum}</td>
									<td>
										<img src="upload/${bean.image}" style="width:70px; height:70px">
									</td>
									<td>${bean.pname}</td>
									<td>
										<fmt:formatNumber value="${bean.price}" pattern="###,###" /> 원
									</td>
									<td class="quantity">
										<div class="input-group">
											<input type="text" name="quantity"
												class="quantity form-control input-number"
												value="${bean.qty}" min="1" max="100">
										</div>
									</td>
									<td>
										<fmt:formatNumber value="${bean.price * bean.qty}" pattern="###,###" /> 원
									</td>
									<td>
										<a href="<%=Noform%>mallDelete&pnum=${bean.pnum}&id=${loginfo.id}">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			
					<div class="row justify-content-end">
						<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
							<div class="cart-total mb-3">
								<h3>Cart Totals</h3>
									<c:forEach var="bean" items="${sessionScope.shoplists}">
										<p class="d-flex">
											<span>구매 가격</span> 
											<span>
												<fmt:formatNumber value="${bean.price * bean.qty}" pattern="###,###" /> 원
											</span>
										</p>
										<p class="d-flex">
											<span>배송비</span> <span>0</span>
										</p>
										<p class="d-flex">
											<span>할인</span> <span>10%</span>
										</p>
		
										<hr>
										<p class="d-flex total-price">
											<span>총 금액</span> 
											<span>
												<fmt:formatNumber value="${bean.price * bean.qty - bean.price/10}" pattern="###,###" /> 원
											</span>
										</p>
									</c:forEach>
							</div>
								<a href="<%=Noform%>mallAddr" class="btn btn-primary py-3 px-4" >주문 하기</a>
						</div>
					</div>
				</div>=-
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

	</body>
</html>