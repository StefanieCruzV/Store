<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍭PicaLicious</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" /> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="">
	<nav
		class="navbar bgnavbar w-75 mx-auto d-block opacity-75 my-3 p-3  rounded-pill">
		<div class="container-fluid">
			<a class="navbar-brand navbartitle" href="/"> 
				🍭PicaLicious
			</a>
			<form class="d-flex" role="search">
				
				<c:if test="${user_id eq null}">
					<a class="text-success navalink" href="/log">Login</a>
				</c:if>
				<c:if test="${user_id ne null}">
					<a class="text-success navalink" href="/logout">Logout</a>
				</c:if>
				
					<a
					class="text-success navalink" href="/showpurchase"><i
					class="fa-solid fa-cart-shopping"></i></a>
			</form>
		</div>
	</nav>

	<div class=" w-75 mx-auto d-block my-3 p-3 ">
		<div class="container  p-3 ">
			<div
				class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3  justify-content-evenly align-items-center">


				<c:forEach var="product" items="${allproduct}">
					<div class="col">
						<div class="card" style="width: 15rem;">
							<div
								class=" card  border-0 justify-content-evenly align-items-center">
								<img class="imgeonem my-3 " src="${product.image }">
								<h5 class="card-title">${product.name}</h5>
							</div>
							<div class="card-body bcolor1">

								<h3 class="card-text "> $ ${product.price }</h3>

								<div class="d-grid gap-2">
									<button class="btn btn-primary" type="button"
									 onclick="location.href='http://localhost:8080/showcandiebyid/${product.id}';">View options</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>




			</div>
		</div>
	
	</div>
	<div class=" navbar bgnavbar  w-75 mx-auto d-flex my-3 p-3 opacity-75 ">

	</div>




</body>
</html>