<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function sendAddress(fname, zipcode, roadaddress, address1, address2,
			extraaddress) {

		opener.neworderinfo.name.value = fname;

		opener.neworderinfo.zipcode.value = zipcode;

		opener.neworderinfo.roadaddress.value = roadaddress;
		opener.neworderinfo.address1.value = address1;
		opener.neworderinfo.address2.value = address2;
		opener.neworderinfo.extraaddress.value = extraaddress;

		self.close();
	}
</script>

<style type="text/css">
th {
	color: white;
	text-align: center;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
	padding: 30px 60px;
}

td {
	color: black;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.row {
	margin: 100px auto 0;
}

.container {
	font-family: 'Slabo 27px', serif;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row" align="center">
			<table>
				<thead style="background-color: #b7472a">
					<tr>
						<th>받는 사람</th>
						<th>우편 번호</th>
						<th>도로명 주소</th>
						<th>지번 주소</th>
						<th>상세 주소</th>
						<th>참고 주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>


							<td><a href="#"
								onclick="javascript:sendAddress('${bean.fname}', '${bean.zipcode}', '${bean.roadaddress}', '${bean.address1}', '${bean.address2}', '${bean.extraaddress}');">
									${bean.fname} </a></td>
							<td>${bean.zipcode}</td>
							<td>${bean.roadaddress}</td>
							<td>${bean.address1}</td>
							<td>${bean.address2}</td>
							<td>${bean.extraaddress}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>