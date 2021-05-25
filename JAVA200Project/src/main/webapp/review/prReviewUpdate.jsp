<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.ftco-section {
	font-family: 'Slabo 27px', serif;
}
.placeholder {
	color: red;
}
.comment-form-wrap.pt-5 {
    margin-bottom: 50px;
}
table {
	border-collapse: collapse;
	width: 100%;
}

th {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	color: initial;
}

td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	font: message-box;
}

ul.pagination {
	justify-content: center;
}

h4 {
	margin: 0px auto;
	padding: 5px 0;
	text-align: center;
	margin-bottom: 1;
}

.add {
	color: black;
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
						<span class="mr-2"> <a href="<%=Noform%>main">Home <i
								class="fa fa-chevron-right"></i>
						</a>
						</span> <span>Review <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Review Update</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-degree-bg" style="padding: 0;">
		<div class="container">
			<div class="comment-form-wrap pt-5">
				<form method="post" class="p-5 bg-light" action="<%=YesForm%>">

					<input type="hidden" name="command" value="reviewUpdate">

					<div class="form-group">
						<input type="hidden" class="form-control" name="pno" id="pno"
							value="${bean.pno}" readonly />
					</div>
					<div class="form-group">
						<label for="name" class="add">No</label> <input type="text"
							class="form-control" name="vnum" id="vnum" value="${bean.vnum}"
							readonly />
					</div>
					<div class="form-group">
						<label for="name" class="add">Id</label> <input type="text"
							class="form-control" name="mid" id="mid" value="${loginfo.id}"
							readonly />
					</div>
					<div class="form-group">
						<label for="message" class="add">Comment</label>
						<textarea name="vcomment" id="vcomment" cols="30" rows="10"
							class="form-control" placeholder="수정할 내용을 입력하세요."></textarea>
					</div>
					<div class="form-group" align="right">
						<input type="submit" value="수정" class="btn btn-primary">
						<input type="reset" value="Reset"
							class="btn btn-primary" name="reset" />
					</div>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>