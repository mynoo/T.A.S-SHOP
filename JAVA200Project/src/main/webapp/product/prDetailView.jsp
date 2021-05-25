<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function() {
	$('[data-toggle="popover"]').popover();
});
function goinsert() {
	location.href = '<%=Noform%>mallInsert';
	}
}
	
</script>
<style>
.container-wrap {
    margin-top: 100px;
}
form.form-inline {
    justify-content: center;
}
.imgbox {
	display: inline-block;
	vertical-align: top;
	text-align: right;
}

.containerbox {
	display: inline-block;
}

.container-wrap {
	margin: 100px auto;
    text-align: center;
}

.btn {
	justify-content: flex-end;
}

.btnbox2 {
	text-align: right;
	margin: 0 auto 20px;
	width: 1100px;
	font-family: 'Slabo 27px', serif;
}

h4 {
	margin: 0px auto;
	padding: 20px 0;
	width: 1400px;
}

.form-control-sm {
	margin: 0 10px;
}

.col-lg-10 {
	margin: auto;
}

th {
	text-align: center !important;
}

button.btn.btn-primary {
	margin: 0 10 0 0;
}
.containerbox.container.col-sm-offset.col-sm-6 {
    margin: 0;
}
.btnbox3 {
    justify-content: center;
    text-align: center;
    margin-bottom: 70px;
    font-family: 'Slabo 27px', serif;
}
.containerbox{
	font-family: 'Slabo 27px', serif;
}
.btn btn-primary{
	font-family: 'Slabo 27px', serif;
}
</style>
</head>
<body>
	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<%=contextPath%>/images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2">
							<a href="<%=Noform%>main"> Home 
								<i class="fa fa-chevron-right"></i>
							</a>
						</span>
						<span>Products <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Products</h2>
				</div>
			</div>
		</div>
	</section>
	<div class="container-wrap">
		<form action="<%=YesForm%>" class="form-inline" role="form" method="post">
			<input type="hidden" name="command" value="mallInsert">
			<div class="imgbox col-lg-3">
				<table>
					<tr>
						<td>
							<img src="upload/${bean.image}" class="img-rounded"
							alt="${bean.pname}" width="300" height="400">
						</td>
					</tr>
				</table>
			</div>
			<div class="containerbox container col-sm-offset col-sm-6">
				<div class="panel panel-primary">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="col-lg-9">
							<table class="table table-bordered">
								<tr>
									<td width="40%" align="center">NAME(NO)</td>
									<td width="60%" align="left">${bean.pname}(${bean.pno})
										<input type="hidden" name="pno" value="${bean.pno}">
									</td>
								</tr>
								<tr>
									<td width="25%" align="center">BRAND</td>
									<td width="75%" align="left">${bean.brand}</td>
								</tr>
								<tr>
									<td width="40%" align="center">PRICE</td>
									<td width="60%" align="left">
										<fmt:formatNumber value="${bean.price}" pattern="###,###" /> 원
										<input type="hidden" name="price" value="${bean.price}">
									</td>
								</tr>
								<tr>
									<td width="40%" align="center">CONTENT</td>
									<td width="60%" align="left">${bean.content}</td>
								</tr>
								<tr>
									<td width="40%" align="center">STOCK</td>
									<td width="60%" align="left">
										<input type="hidden" name="stock" id="stock" value="${bean.stock}">
										<input type="number" name="qty" id="qty" class="form-control-sm"
										data-toggle="popover" title="수량 입력란" data-trigger="hover" 	
										data-placement="auto top" data-content="구매하시고자 하는 수량을 정수로 입력하세요.">
										&nbsp;
										<span style="color: red; font-size: 10pt;">${requestScope.errmsg}</span>
									</td>
								</tr>
								<tr>
									<td width="25%" align="center">ALCOHOL</td>
									<td width="75%" align="left">${bean.alcohol}%</td>
								</tr>
								<tr>
									<td width="25%" align="center">VOLUME</td>
									<td width="75%" align="left">${bean.volume}ml</td>
								</tr>
								
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="btnbox2">
				<button type=submit class="btn btn-primary btn2">ORDER</button>
				<button type=submit class="btn btn-primary btn2">CART</button>
			</div>
		</form>
	</div>
	<div class="btnbox3">
		<c:set var="totalcount" value="${requestScope.totalcount}" />
		<form action="<%=YesForm%>" role="form"	method="get">
			<input type="hidden" name="command" value="reviewList"> <input
				type="hidden" name="pno" value="${bean.pno}"> <input
				type="hidden" name="totalcount" value="${requestScope.totalcount}">
		<button type="submit" class="btn btn-primary" id="btn1">RIVIEW(${requestScope.totalcount})</button>
		<button type="button" class="btn btn-primary" onclick="location.href='<%=Noform%>prprList';">BACK</button>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>