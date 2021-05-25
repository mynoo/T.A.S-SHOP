<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.add {
	color: black;
}

.ftco-section {
	font-family: 'Slabo 27px', serif;
}
.comment-form-wrap.pt-5 {
    margin-bottom: 50px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
						<span class="mr-2"><a
							href="<%=contextPath%>/common/main.jsp">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>Review<i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Review Insert</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg" style="padding: 0;">
		<div class="container">
			<div class="comment-form-wrap pt-5">
				<form method="POST" class="p-5 bg-light" action="<%=YesForm%>"
					enctype="multipart/form-data">

					<input type="hidden" id="command" name="command"
						value="reviewInsert">

					<div class="form-group">
						<label for="name" class="add">No</label> <input type="text"
							class="form-control" name="pno" id="pno" value="${bean.pno}"
							readonly />
					</div>
					<div class="form-group">
						<label for="name" class="add">Id</label> <input type="text"
							class="form-control" name="mid" id="mid" value="${loginfo.id}"
							readonly />
					</div>
					<div class="form-group">
						<label for="message" class="add">Message</label>
						<textarea name="vcomment" id="vcomment" cols="30" rows="10"
							class="form-control"></textarea>
					</div>
					<div class="form-group" align="right">
						<input type="submit" value="Post Review" class="btn btn-primary">
						<button type="button" class="btn btn-primary"
							onclick="location.href='<%=Noform%>reviewList&pno=${bean.pno}';">Back</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>