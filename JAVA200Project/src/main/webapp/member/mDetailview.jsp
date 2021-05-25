<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Profile</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=contextPath%>/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/vendor/nouislider/nouislider.min.css">

<!-- Main css -->
<link rel="stylesheet" href="<%=contextPath%>/css/css/style.css">

<style type="text/css">
#button1 {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-right: -4px;
	border: 1px solid skyblue;
}

button.btn.btn-danger {
	margin: -70px -109px;
}
</style>
</head>

<body>
	<div class="main">
		<div class="container">
			<div class="signup-content">
				<div class="signup-img">
					<img src="<%=contextPath%>/images/solid.png" alt="">

					<div class="signup-img-content">
						<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
							class="avatar img-circle img-thumbnail rounded-circle"
							alt="avatar"><br>
						<br>
						<h2 style="color: black;">My Profile</h2>
						<p style="color: black;">while seats are available!</p>
					</div>
				</div>

				<div class="signup-form">
					<form method="post" class="register-form">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="name">Id</label> <input type="text" name="id"
										id="id" value="${loginfo.id}" readonly="readonly" />
								</div>

								<div class="form-input">
									<label for="name">Name</label> <input type="text" name="name"
										id="name" value="${loginfo.name}" readonly="readonly" />
								</div>

								<div class="form-input">
									<label for="birth">Birth</label> <input type="date"
										name="birth" id="birth" value="${loginfo.birth}"
										readonly="readonly" />
								</div>
								<div class="form-input">
									<label for="email">Email</label> <input type="email"
										name="email" id="email" value="${loginfo.email}"
										readonly="readonly" />
								</div>
							</div>

							<div class="form-group">
								<div class="form-input">
									<label for="phonenumber">Phone number</label> <input
										type="text" name="phonenumber" id="phonenumber"
										value="${loginfo.phonenumber}" readonly="readonly" />
								</div>

								<div class="form-input">
									<label class="control-label" for="zipcode">Zipcode</label>
									<div class="form-inline">
										<input type="text" id="zipcode" name="zipcode"
											value="${loginfo.zipcode}" readonly="readonly">
									</div>
								</div>

								<div class="form-input">
									<label class="control-label" for="address1">Address1</label> <input
										type="text" id="roadaddress" name="roadaddress"
										value="${loginfo.roadaddress}" readonly="readonly"> <input
										type="text" id="address1" name="address1"
										value="${loginfo.address1}" readonly="readonly"> <span
										id="guide" style="color: #999; display: none"></span>
								</div>
								<div class="form-input">
									<label class="required" for="address2">Address2</label> <input
										type="text" id="address2" name="address2"
										value="${loginfo.address2}" readonly="readonly"> <input
										type="text" id="extraaddress" name="extraaddress"
										value="${loginfo.extraaddress}" readonly="readonly">
								</div>

								<div class="form-input">
									<label for="gender">Gender</label> <input type="text"
										name="gender" value="${loginfo.gender}" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="button">
							<input type="button"
								style="float: right; width: 60pt; heghit: 60pt; background-color: #b7472a; color: white;"
								value="Home" class="btn btn-default" name="home"
								onclick="location='<%=Noform%>main'" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="<%=contextPath%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=contextPath%>/vendor/nouislider/nouislider.min.js"></script>
	<script src="<%=contextPath%>/vendor/wnumb/wNumb.js"></script>
	<script
		src="<%=contextPath%>/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="<%=contextPath%>/vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="<%=contextPath%>/js/signup.js"></script>
</body>
</html>