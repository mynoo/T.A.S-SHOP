<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
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
	</style>
</head>
<body>

	<jsp:include page="../common/generalhead.jsp"></jsp:include>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('<%=contextPath%>/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2">
							<a href="<%=Noform%>main">Home <i class="fa fa-chevron-right"></i>
							</a>
						</span> 
						<span class="mr-2">
							<a href="board.jsp">Member<i class="fa fa-chevron-right"></i>
							</a>
						</span>
						<span>Member List<i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Member List</h2>
				</div>
			</div>
		</div>
	</section>
	
	 <section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="ftco-animate">
					<c:set var="cnt" value="0"/>
					<table>
						<tbody style="color:#808080" align="center">
							<tr>
								<th> NO </th>
								<th> ID </th>
								<th> NAME </th>
								<th> BIRTH </th>
								<th> GENDER </th>
								<th> EMAIL </th>
								<th> PHONE </th>
								<th> ADDRESS </th>
								<th> UPDATE/DEL </th>
							</tr>
						</tbody>
						<tbody>
							<c:forEach var="bean" items="${requestScope.lists }">
								<tr>
									<td>
										<c:set var="cnt" value="${cnt +1}"/>
										${cnt}
									</td>
									<td>${bean.id}</td>
									<td>${bean.name}</td>
									<td>${bean.birth}</td>
									<td>${bean.gender}</td>
									<td>${bean.email}</td>
									<td>${bean.phonenumber}</td>
									<td>
										${bean.address1}
										${bean.address2}
									</td>
									<td>
										<c:if test="${bean.id == 'admin'}">
											<a href="<%=Noform%>meUpdate&id=${bean.id}">
												Update
											</a>
										</c:if>
										<c:if test="${bean.id != 'admin'}">
											<a href="<%=Noform%>meDelete&id=${bean.id}">
												Delete
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<div class="button">
						<input type="button" value="Home" class="btn btn-default"
							style="float: right; background-color: #A23F25; color: white;" onclick="location='<%=Noform%>main'" />
					</div>
				</div>
			</div>
		</div>
	</section>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
</body>
</html>