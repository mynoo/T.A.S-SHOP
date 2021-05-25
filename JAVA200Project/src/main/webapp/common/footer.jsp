<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="whologin" value="0" />
	<c:if test="${empty sessionScope.loginfo}">
		<c:set var="whologin" value="0" />
	</c:if>
	<c:if test="${not empty sessionScope.loginfo}">
		<c:if test="${sessionScope.loginfo.id == 'admin'}">
			<c:set var="whologin" value="2" />
		</c:if>
		<c:if test="${sessionScope.loginfo.id != 'admin'}">
			<c:set var="whologin" value="1" />
		</c:if>
	</c:if>
	
<!DOCTYPE html>
<html>
<head>
<style>
.ftco-footer {
    padding: 0;
}
</style>
<meta charset="UTF-8">
</head>
<body>
	<footer class="ftco-footer">
		<div class="container-fluid px-0 py-5 bg-black">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with
							<i class="fa fa-heart color-danger" aria-hidden="true"></i> by 
							<a href="https://colorlib.com" target="_blank">Colorlib.com</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
			</svg>
	</div>
</body>
</html>