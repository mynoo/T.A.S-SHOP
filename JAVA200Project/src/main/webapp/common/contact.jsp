<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	
</head>

<body>
	<jsp:include page="generalhead.jsp" />
	
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
						<span>Contact Us <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Contact Us</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper px-md-4">
							<div class="row mb-5">
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-map-marker"></span>
										</div>
										<div class="text">
											<p>
												<span>Address:</span> 
												<span style="color: gray;">459, Gangnam-daero, Seocho-gu, Seoul, Republic of Korea </span>
											</p>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-phone"></span>
										</div>
										<div class="text">
											<p>
												<span>Phone:</span>
												<span style="color: gray;">+82 02 3486 9600</span>
											</p>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-paper-plane"></span>
										</div>
										<div class="text">
											<p>
												<span>Email:</span> 
												<span style="color: gray;">info@yoursite.com</span>
											</p>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
										<div class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-globe"></span>
										</div>
										<div class="text">
											<p>
												<span>Website</span> 
												<span style="color: gray;">yoursite.com</span>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row no-gutters">
								<div class="map">
									<div id="map" style="width:1000px;height:500px;"></div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16ab5dcc49a27d916372cd1146499fa0"></script>
	
									<script>
										//지도를 담을 영역의 DOM 레퍼런스
										var container = document.getElementById('map'); 
										
										//지도를 생성할 때 필요한 기본 옵션
										var options = { 
											//지도의 중심좌표
											center: new kakao.maps.LatLng(37.503146767801475, 127.0242638973058), 
											
											//지도의 레벨(확대, 축소 정도)
											level: 3 
										};
										
										//지도 생성 및 객체 리턴
										var map = new kakao.maps.Map(container, options);
										
										// 마커가 표시될 위치입니다 
										var markerPosition  = new kakao.maps.LatLng(37.503146767801475, 127.0242638973058); 

										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
											position: markerPosition
										});

										// 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	<jsp:include page="footer.jsp" />
  </body>
</html>