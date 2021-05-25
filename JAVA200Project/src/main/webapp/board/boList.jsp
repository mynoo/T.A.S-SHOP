<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>	
		function search(){
			/* alert('검색');  */	
			var mode = $('#mode').val ;
			var keyword = $('keyword').val ;
			location.href='<%=Noform%>
	boList' + '&mode=' + mode + '&keyword='
				+ keyword;
	}
</script>
<style>
ul.pagination {
	justify-content: center;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	padding: 8px;
	text-align-last: center;
	border-bottom: 1px solid #ddd;
	color: black;
}

td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
	<jsp:include page="../common/generalhead.jsp" />
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<%=contextPath%>/images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"> <a href="#"> Home <i
								class="fa fa-chevron-right"></i>
						</a>
						</span> <span>Q&A <i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Q&A</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="container">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>TITLE</th>
						<th>CONTENT</th>
						<th>WRITER</th>
						<th>WRITEDATE</th>
						<th>MODIFY</th>
						<th>DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.bno}</td>
							<td><a href="<%=Noform%>boDetailView&bno=${bean.bno}">
									${bean.title} </a></td>
							<td>${bean.bcontents}</td>
							<td>${bean.writer}</td>
							<td>${bean.writedate}</td>
							<td><c:if test="${sessionScope.loginfo.id == bean.writer}">
									<a
										href="<%=Noform%>boUpdate&bno=${bean.bno}&${requestScope.parameters}">
										Update </a>
								</c:if></td>
							<td><c:if
									test="${sessionScope.loginfo.id == bean.writer || sessionScope.loginfo.id == 'admin' }">
									<a
										href="<%=Noform%>boDelete&bno=${bean.bno}&${requestScope.parameters}"
										onclick="return confirm('삭제하시겠습니까?');"> Delete </a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div class="button" align="right">
				<a href="<%=Noform%>boInsert" class="btn btn-primary py-2 px-4">Write</a>
			</div>

			<br>
			<div class="row mt-5" align="center">
				<div class="col text-center">
					<div class="block-27">
						<footer>${pageInfo.pagingHtml}</footer>
					</div>
				</div>
			</div>


		</div>
		<br>
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>