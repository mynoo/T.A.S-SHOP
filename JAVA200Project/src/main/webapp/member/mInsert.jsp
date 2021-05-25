<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="<%=contextPath%>/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="<%=contextPath%>/vendor/nouislider/nouislider.min.css">

<!-- Main css -->
<link rel="stylesheet" href="<%=contextPath%>/css/css/style.css">

<!-- Daum Api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="<%=contextPath%>/common/common.jsp"></script>

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

<script type="text/javascript">
		function Idcheck() {
			var id = document.minsertform.id.value;
			
			if(id.length < 4){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				document.minsertform.id.focus();
				return false;
			}
			
			var url = '<%=Noform%>
	meIdcheck&id=' + id;
		window.open(url, 'mywin', 'height=150, width=300');
	}

	function isCheckFalse() {
		document.minsertform.isCheck.value = false;
	}

	function checkForm() {
		var isCheck = document.minsertform.isCheck.value;

		if (isCheck == 'false') {
			alert('아이디 중복 체크를 해주세요.');
			return false;
		}

		if (document.getElementById('password').value != document
				.getElementById('confpassword').value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.minsertform.password.focus();
		}
	}

	function Checkpw() {
		// 비밀번호
		var pw = document.getElementById('password').value;
		// 아이디
		var id = document.getElementById('id').value;
		// 특수문자
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!?@#$%^&*-~]).{4,}$/;

		// 비밀번호 검사
		if (false === reg.test(pw)) {
			alert('비밀번호는 4자이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		} else if (pw.search(id) > -1) {
			alert('비밀번호에 아이디가 포함되었습니다.');
			return false;
		} else if (pw.search(/\s/) != -1) {
			alert('비밀번호는 공백 없이 입력해주세요');
			return false;
		}

		// 비밀번호 확인
		if (document.getElementById('password').value != ''
				&& document.getElementById('confpassword').value != '') {
			if (document.getElementById('password').value == document
					.getElementById('confpassword').value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('same').style.color = 'blue';
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color = 'red';
			}
		}

	}

	$(document).ready(function name() {
		$('[data-toggle = "tooltip"]').tooltip();
	});
</script>

</head>
<body>
	<div class="main">
		<div class="container">
			<div class="signup-content">
				<div class="signup-img">
					<img src="<%=contextPath%>/images/solid.png" alt="">
					<div class="signup-img-content">
						<h2>Register now</h2>
						<p>while seats are available !</p>
					</div>
				</div>
				<div class="signup-form">
					<form method="POST" class="register-form" name="minsertform">
					<button type="button" class="btn btn-danger"
						style="border-radius: 30px; float: right;" onclick="gotomain();">
						<b>X</b>
					</button>

						<input type="hidden" id="command" value="meInsert"> <input
							type="hidden" id="isCheck" value="false">

						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="id" class="required">Id</label> <input type="text"
										class="form-control" name="id" id="id" pattern="[A-Za-z]+"
										placeholder="input your id" data-toggle="tooltip"
										onkeyup="isCheckFalse()" value="${bean.id}" /> <input
										type="button" value="Id Check" class="btn btn-primary"
										id="button" name="button" onclick="Idcheck()" /> <span
										class="err">${errid}</span>
								</div>

								<div class="form-input">
									<label for="name" class="required">Name</label> <input
										type="text" name="name" id="name" value="${bean.name}" /> <span
										class="err">${errname}</span>
								</div>

								<div class="form-input">
									<label for="password" class="required">Password</label> <input
										type="password" name="password" id="password"
										onchange="Checkpw()" /> <span class="err">${errpassword}</span>
								</div>

								<div class="form-input">
									<label for="confpassword" class="required">Confirm
										Password</label> <input type="password" name="confpassword"
										id="confpassword" onchange="Checkpw()" /> <span id="same"></span>
								</div>

								<div class="form-input">
									<label for="birth" class="required">Birth</label> <input
										type="date" name="birth" id="birth" value="${bean.birth}" /> <span
										class="err">${errbirth}</span>
								</div>

								<div class="form-input">
									<label for="phonenumber" class="required">Phone</label> <input
										type="text" name="phonenumber" id="phonenumber"
										pattern="[0-9]+" value="${bean.phonenumber}" /> <span
										class="err">${errphonenumber}</span>
								</div>

							</div>
							<div class="form-group">

								<div class="form-input">
									<label for="email" class="required">Email</label> <input
										type="email" name="email" id="email"
										placeholder="ex)abc@abc.com" value="${bean.email}" /> <span
										class="err">${erremail}</span>
								</div>

								<div class="form-input">
									<label class="control-label required" for="zipcode">Zipcode</label>
									<input type="text" id="zipcode" name="zipcode"
										placeholder="우편번호" readonly="readonly"> <span
										class="err">${errzipcode}</span>
									<div class="button">
										<input type="button" onclick="zipfind();" value="우편번호 찾기">
									</div>
								</div>
								<div class="form-input">
									<label class="required" for="address1">Address1</label> <input
										type="text" id="roadaddress" name="roadaddress"
										placeholder="도로명주소" readonly="readonly"> <input
										type="text" id="address1" name="address1" placeholder="지번주소"
										readonly="readonly"> <span id="guide"
										style="color: #999; display: none"></span>
								</div>
								<div class="form-input">
									<label class="required" for="address2">Address2</label> <input
										type="text" id="address2" name="address2" placeholder="상세주소">
									<input type="text" id="extraaddress" name="extraaddress"
										placeholder="참고항목" readonly="readonly">
								</div>

								<div class="form-radio">
									<div class="label-flex">
										<label class="required" for="gender">Gender</label>
									</div>
									<div class="form-radio-group">
										<div class="form-radio-item">
											<input type="radio" name="gender" id="man" value="남자"
												<c:if test="${bean.gender == '남자'}">
													checked="checked"
												</c:if>>
											<label for="man">Man</label> <span class="check"></span>
										</div>
										<div class="form-radio-item">
											<input type="radio" name="gender" id="female" value="여자"
												<c:if test="${bean.gender == '여자'}">
													checked="checked"
												</c:if>>
											<label for="female">Female</label> <span class="check"></span>
										</div>
									</div>
									<span class="err">${errgender}</span>
								</div>
							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="Signup" class="submit"
								onclick="return checkForm();" /> <input type="reset"
								value="Reset" class="submit" name="reset" />
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