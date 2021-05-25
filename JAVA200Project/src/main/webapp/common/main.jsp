<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE>
<html>
<head>
<style>
.row.justify-content-center.pb-5 {
    margin: 200px 0 30px 0;
}
div#viewAll {
    margin: 100px 0px;
}
</style>
</head>
<body>

	<jsp:include page="mainhead.jsp" />

	<div class="hero-wrap"
		style="background-image: url('<%=contextPath%>/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Good <span>Drink</span> for Good <span>Moments</span>.
						</h1>
						<p>
							<a href="<%=Noform%>prprList" class="btn btn-primary py-2 px-4">Shop
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-intro">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-4 d-flex">
					<div class="intro d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-support"></span>
						</div>
						<div class="text">
							<h2>Online Support 24/7</h2>
							<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex">
					<div class="intro color-1 d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-cashback"></span>
						</div>
						<div class="text">
							<h2>Money Back Guarantee</h2>
							<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex">
					<div class="intro color-2 d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-free-delivery"></span>
						</div>
						<div class="text">
							<h2>Free Shipping &amp; Return</h2>
							<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 img img-3 d-flex justify-content-center align-items-center"
					style="background-image: url(<%=contextPath%>/images/about.jpg);"></div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
					<div class="heading-section">
						<span class="subheading">Since 1905</span>
						<h2 class="mb-4">Desire Meets A New Taste</h2>

						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						<p class="year">
							<strong class="number" data-number="116">0</strong> <span>Years of Experience In Business</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Our Delightful offerings</span>
					<h2>Tastefully Yours</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-1.jpg);"></div>
						<h3>Brandy</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-2.jpg);"></div>
						<h3>Gin</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-3.jpg);"></div>
						<h3>Rum</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-4.jpg);"></div>
						<h3>Tequila</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-5.jpg);"></div>
						<h3>Vodka</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-6.jpg);"></div>
						<h3>Whiskey</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center" id="viewAll">
			<div class="col-md-4">
				<a href="<%=Noform%>prprList"
					class="btn btn-primary d-block">View All Products&nbsp&nbsp<span
					class="fa fa-long-arrow-right"></span>
				</a>
			</div>
		</div>

	<section class="ftco-section testimony-section img"
		style="background-image: url(<%=contextPath%>/images/bg_4.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<h2 class="mb-3">Introduction to Alcohol</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">The etymology of the word "Vodka" comes from the Russian word "Voda", which means 
									"small water". Vodka is a distilled liquor that is mixed with other beverages such as cocktails and juice.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-1.jpg)"></div>
										<div class="pl-3">
											<p class="name">Vodka</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Rum, also known as rum, is a liquor that is distilled 
									after fermenting the remaining residue, molasses or cane juice, from sugar cane juice.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-2.jpg)"></div>
										<div class="pl-3">
											<p class="name">Rum</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">It is a liquor made through distillation and ripening by sprouting 
									or grinding grains such as barley, rye, wheat, corn, and oats into water, malt, and yeast.<br></p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-3.jpg)"></div>
										<div class="pl-3">
											<p class="name">Whiskey</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">It is a colorless, transparent liquor with rye and other ingredients
									 and a unique scent of dusongja.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-4.jpg)"></div>
										<div class="pl-3">
											<p class="name">Gin</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Brandy in broad sense is a generic name for liquor made by distillation of fruit liquor.
									In a narrow sense, wine is distilled and aged in an oak barrel.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-5.jpg)"></div>
										<div class="pl-3">
											<p class="name">Brandy</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Mexico's main ingredient is blue sermons, which inhabit only the area
									 surrounding Tequila in the Mexican state of Jalisco.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-5.jpg)"></div>
										<div class="pl-3">
											<p class="name">Tequila</p>
										</div>
									</div>
								</div>
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