<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ProductInsertForm</title>
	
	<!-- Font Icon -->
	<link rel="stylesheet"
		href="<%=contextPath %>/fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="<%=contextPath %>/vendor/nouislider/nouislider.min.css">
	
	<!-- Main css -->
	<link rel="stylesheet" href="<%=contextPath %>/css/css/style.css">
	
	<style type="text/css">
	#button1 {
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		margin-right: -4px;
		border: 1px solid skyblue;
	}
	button.btn.btn-danger{
	    margin: -70px -109px;
	}
}
	</style>
	
	<script type="text/javascript">
		
		var checkSubmit = false;
	
		function save() {
			
		}
	
	</script>

</head>

<body>
	<div class="main">
		<div class="container">
			<div class="signup-content">
				<div class="signup-img">
					<img src="<%=contextPath%>/images/solid.png" alt="">
					<div class="signup-img-content">
						<h2>Product Registration</h2>
						<p>Please enter the product to add !</p>
					</div>
				</div>
				<div class="signup-form">
               <form method="POST" class="register-form" id="register-form" 
                  action="<%=YesForm%>" enctype="multipart/form-data">
               <input type="hidden" id="command" name="command" value="prInsert">
                  <button type="button" class="btn btn-danger" style="border-radius: 30px; float: right;" onclick="location.href='<%=Noform%>prList'">
                     <b>X</b>
                  </button>
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="pname" class="required">Pname</label> 
									<input
										type="text" name="pname" id="pname" value="${bean.pname}" />
										<span class="err form-control-static">${errpname}</span>
								</div>
								<div class="form-input">
									<label for="brand" class="required">Brand</label> <input
										type="text" name="brand" id="brand" value="${bean.brand}" />
										<span class="err form-control-static">${errbrand}</span>
								</div>
								<div class="form-input">
									<label for="image" class="required">Image</label> <input
										type="file" name="image" id="image" value="${bean.image}"/>
										<span class="err form-control-static">${errimage}</span>
								</div>
								<div class="form-input">
									<label for="stock" class="required">Stock</label> <input
										type="text" name="stock" id="stock" value="${bean.stock}"/>
										<span class="err form-control-static">${errstock}</span>
								</div>
								<div class="form-input">
									<label for="name" class="required">Price</label> <input
										type="number" name="price" id="price" value="${bean.price}"/>
										<span class="err form-control-static">${errprice}</span>
								</div>
							</div>
							<div class="form-group">
								<div class="form-input">
									<label for="name" class="required">Date</label> <input
										type="date" name="date" id="date" value="${bean.date}"/>
										<span class="err form-control-static">${errdate}</span>
								</div>
								<div class="form-input">
									<label for="alcohol" class="required">Alcohol</label> <input
										type="number" name="alcohol" id="alcohol" value="${bean.alcohol}"/>
										<span class="err form-control-static">${erralcohol}</span>
								</div>
								<div class="form-input">
									<label for="volume" class="required">Volume</label> <input
										type="number" name="volume" id="volume" value="${bean.volume}"/>
										<span class="err form-control-static">${errvolume}</span>
								</div>
								<div class="form-input">
									<label for="content" class="required">Content</label> <input
										type="text" name="content" id="content" value="${bean.content}"/>
										<span class="err form-control-static">${errcontent}</span>
								</div>
								<div class="form-input">
									<div class="label-flex">
										<label for="Category">Category</label>
									</div>
									<select class="form-control" name="category" id="category" value="${bean.category}">
										<option value="-">--select type --</option>
										<option value="brandy">Brandy</option>
										<option value="gin">Gin</option>
										<option value="rum">Rum</option>
										<option value="tequila">Tequila</option>
										<option value="vodka">Vodka</option>
										<option value="whiskey">Whiskey</option>
									</select>
									<span class="err form-control-static">${errcategory}</span>
								</div>
							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="Register" class="submit" id="submit" name="submit" onclick=""/>
							<input type="reset" value="Reset" class="submit" id="reset" name="reset" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/nouislider/nouislider.min.js"></script>
	<script src="../vendor/wnumb/wNumb.js"></script>
	<script src="../vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="../vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="../js/signup.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>