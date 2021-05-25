<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%
int pageSize = 9;
%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<style>
#prList {
	float: right;
}
form.form-inline {
    justify-content: center;
}
ul.pagination {
	justify-content: center;
}

ul.pagination li {
	padding: 3;
}

.block-27 {
	margin-bottom: 20px;
}

button.btn.btn-primary {
	margin-right: 15px;
}

button.btn.btn-primary.btn2 {
	float: right;
	margin-top: -38px;
}

.form-group {
	margin-left: 20;
}

.form-group {
	margin-left: 20;
}
</style>
<script>	
	function search(){
		var mode = $('#mode').val() ;
		var keyword = $('#keyword').val() ;
		location.href='<%=Noform%>prprList' + '&mode=' + mode + '&keyword=' + keyword ;
	}
	function searchAll(){
		location.href='<%=Noform%>prprList';
	}
	$(document).ready(function() {

	});
</script>
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
						<span class="mr-2"> <a href="<%=Noform%>main">Home <i
								class="fa fa-chevron-right"></i>
						</a>
						</span> <span>Products <i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Products</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row mb-4">
						<div class="col-md-12" id="prList">
							<form action="" class="form-inline" role="form" name="myform"
								method="get">
								<div class="form-group">
									<select id="mode" name="mode" class="form-control">
										<option value="all" selected="selected">-- Select
										<option value="pname">Name
										<option value="brand">Brand
										<option value="category">Category
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="keyword"
										id="keyword">
								</div>
								&nbsp;&nbsp;
								<button class="btn btn-primary" type="button"
									onclick="search();">Search</button>
								&nbsp;&nbsp;
								<button class="btn btn-primary" type="button"
									onclick="searchAll();">SearchAll</button>
								&nbsp;&nbsp; ${pageInfo.pagingStatus}
							</form>
							<div>
								<c:if test="${whologin == 2}">
									<a href="<%=Noform%>prList">
										<button class="btn btn-primary btn2">List</button>
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="bean" items="${requestScope.lists}">
							<div class="col-md-4 d-flex">
								<div class="product ftco-animate">
									<div
										class="img d-flex align-items-center justify-content-center"
										style="background-image: url('upload/${bean.image}');">
										<div class="desc">
											<p class="meta-prod d-flex">
												<a
													href="<%=Noform%>prDetailView&pno=${bean.pno}&${requestScope.parameters}"
													class="d-flex align-items-center justify-content-center">
													<span class="flaticon-visibility"></span>
												</a>
											</p>
										</div>
									</div>
									<div class="text text-center">
										<span class="new">New Arrival</span> <span class="category">${bean.category}</span>
										<h2>${bean.pname }</h2>
										<p class="mb-0">
											<span class="price price-sale">${bean.price }</span> <span
												class="price">${bean.price-bean.price/10 }</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr>
	<div class="row mt-5">
		<div class="col text-center">
			<div class="block-27">
				<footer>${pageInfo.pagingHtml}</footer>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>