<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}
th {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
h4 {
	text-align: center;
}
ul.pagination{
	justify-content: center;
}
ul.pagination li {
    padding: 3;
}
form.form-inline {
    justify-content: center;
}
.form-group {
    margin: 0 5;
}
.btn{
	margin: 10px;
}
.form-control{
	height: 50px;
}
</style>
<script>	
		function search(){
			var mode = $('#mode').val() ;
			var keyword = $('#keyword').val() ;
			location.href='<%=Noform%>prList' + '&mode=' + mode + '&keyword=' + keyword ;
		}
		function searchAll(){
			location.href='<%=Noform%>prList';
		}
		function writeForm(){
			location.href='<%=Noform%>prInsert';
		}
		
		$(document).ready(function(){
			
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
						<span class="mr-2">
							<a href="<%=Noform%>main">Home 
								<i class="fa fa-chevron-right"></i>
							</a>
						</span>
						<span>Products <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Products List</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<table>
				<thead>
					<tr>
						<td align="center" colspan="12">
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
									onclick="search();">search</button>
								&nbsp;&nbsp;
								<button class="btn btn-primary" type="button"
									onclick="searchAll();">searchAll</button>
									<button class="btn btn-primary btn-info" type="button"
										onclick="writeForm();">Regist</button>
								&nbsp;&nbsp; ${pageInfo.pagingStatus}
							</form>
						</td>
					</tr>
				</thead>
				<tbody style="color:#808080" align="center">
					<tr>
						<th>PNO</th>
						<th>PNAME</th>
						<th>CONTENT</th>
						<th>BRAND</th>
						<th>CATEGORY</th>
						<th>STOCK</th>
						<th>PRICE</th>
						<th>ALCOHOL</th>
						<th>VOLUME</th>
						<th>DATE</th>
						<th>DELETE</th>
						<th>UPDATE</th>
					</tr>
				</tbody>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.pno}</td>
					<td>
						<a href="<%=Noform%>prDetailView&pno=${bean.pno}&${requestScope.parameters}">
							${bean.pname}
						</a>
					</td>
						<td>${bean.content}</td>
						<td>${bean.brand}</td>
						<td>${bean.category}</td>
						<td>${bean.stock}</td>
						<td>${bean.price}</td>
						<td>${bean.alcohol}</td>
						<td>${bean.volume}</td>
						<td>${bean.date}</td>
					<td>
						<a href="<%=Noform%>prDelete&pno=${bean.pno}" onclick="return confirm('삭제하시겠습니까?');">
							Delete
						</a>
					</td>
					<td>
						<a href="<%=Noform%>prUpdate&pno=${bean.pno}">
							Update
						</a>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<footer>${pageInfo.pagingHtml}</footer>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br><br><br><br>
		<script type="text/javascript">
		   /* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */ 
			$('#mode option').each(function(){
				if( $(this).val() == '${pageInfo.mode}' ){
					$(this).attr('selected', 'selected') ;
				}
			});	
			/* 이전에 넣었던 값 그대로 보존 */
			$('#keyword').val( '${pageInfo.keyword}');
		</script>	
<jsp:include page="../common/footer.jsp" />
</body>
</html>