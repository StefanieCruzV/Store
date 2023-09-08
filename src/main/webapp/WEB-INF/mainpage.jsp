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

<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="bgtotal">

	<nav
		class="navbar bgnavbar w-75 mx-auto d-block my-3 p-3 opacity-75 rounded-pill">
		<div class="container-fluid">
			<a class="navbar-brand navbartitle" href="/"> 🍭PicaLicious </a>
		<form class="d-flex" role="search"> 

				<a class="text-success navalink" href="/allcandies">All Candies
				</a>


				<c:if test="${user_id eq null}">
					<a class="text-success navalink" href="/log">Login</a>
				</c:if>
				<c:if test="${user_id ne null}">
					<a class="text-success navalink" href="/logout">Logout</a>
				</c:if>
						</form>
		</div>
	</nav>

	<div class=" w-75 mx-auto d-block my-3 p-3 ">
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="/allcandies"><img src="/img/o.png"
						class="d-block w-100 honeimage" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href="/allcandies"><img src="/img/e.jpeg"
						class="d-block w-100 honeimage" alt="..."></a>
				</div>
				<div class="carousel-item">
					<a href="/allcandies"><img src="/img/oo.png"
						class="d-block w-100 honeimage" alt="..."></a>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

	</div>
	<div
		class="navbar bggreenlight  w-50 mx-auto d-block my-3 p-3 opacity-75 rounded-pill  ">
		<h3 class="text-black text-center">INTERNATIONAL CANDY MEXICAN
			TASTE</h3>
	</div>

	<div class="  w-50 mx-auto d-flex my-3 p-3   ">
		<div class=" w-50 mx-auto d-block my-3 p-3  ">
			<a href="/showcandiebyid/8"><img class="imgeonemm rounded-pill "
				src="/img/l.jpeg" alt=""></a>
		</div>
		<div class=" w-50 mx-auto d-block my-3 p-3  ">
			<div
				class="navbar bgnavbardos  mx-auto d-block my-3 p-3 opacity-75    ">
				<h3 class="text-white text-center smalett">YOU WON'T BE ABLE TO
					CHOOSE A FAVORITE</h3>
			</div>
			<div class="mx-auto d-block my-3 p-3  ">
				<button type="button" class="btn  mx-auto btn-light"
					onclick="location.href='http://localhost:8080/allcandies';">Shop
					now</button>
			</div>
		</div>
	</div>



	<div
		class="navbar bggbluelight  w-25 mx-auto d-block my-3 p-3 opacity-75   rounded-pill    ">
		<h3 class="text-white text-center">Our Favorites</h3>
	</div>

	<div class=" container w-75 mx-auto d-flex my-3 p-3 ">
		<c:forEach var="product" items="${allproduct}">
			<div class="   mx-auto d-block my-3  ">
				<a href="/showcandiebyid/${product.id}"><img class="imgeonem "
					src="${product.image}" alt=""></a>

			</div>
		</c:forEach>

	</div>






	<div class=" navbar bgnavbar  w-75 mx-auto d-flex my-3 p-3 opacity-75 ">
		<div class="  mx-auto d-block my-3  ">
			<h3 class=" text-center">Receive our incredible
				promotions</h3>
		</div>
			<form class="d-flex" role="search"> 
					<a class="text-success navalink" href="/log">Create an acount</a>
			</form>
		</div>




</body>
</html>