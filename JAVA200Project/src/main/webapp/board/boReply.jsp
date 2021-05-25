<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
th {
	padding: 3px;
	text-align: center;
	background-color: #A23F25;
	color: white;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

td {
	padding: 3px;
	border-bottom: 1px solid #ddd;
}

textarea {
	resize: none;
}
</style>
</head>

<body>
	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('../images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="../common/common.jsp">Home
								<i class="fa fa-chevron-right"></i>
						</a></span> <span>Board<i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Reply</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<form class="form-horizontal" action="<%=Noform%>boReply"
						method="post">
						<input type="hidden" name="command" value="boReply">
						<h3>Write Reply</h3>
						<table style="width: 100%">
							<tbody>
								<tr>
									<th>Writer</th>
									<td><input type="text" name="mid" id="mid" width="100%"
										disabled="disabled" value="${sessionScope.loginfo.id}">
									</td>
								</tr>
								<tr>
									<th>Content</th>
									<td><input type="text" name="comment" id="comment"
										height="200px" width="150px"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="button" align="right">
							<button type="reset" class="btn btn-primary">Reset</button>
							<button type="submit" class=" btn btn-primary">Submit</button>
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