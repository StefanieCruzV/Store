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
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bgtotal">
	<nav
		class="navbar bgnavbar w-75 mx-auto d-block my-3 p-3 opacity-75 rounded-pill">
		<div class="container-fluid">
			<a class="navbar-brand navbartitle" href="/"> <!--  <img
            src="/img/22.png"
            alt="Logo"
            class="d-inline-block align-text-top sizeima"
          /> --> 🍭PicaLicious
			</a>
			<form class="d-flex" role="search">

				<c:if test="${user_id eq null}">
					<a class="text-success navalink" href="/log">Login</a>
				</c:if>
				<c:if test="${user_id ne null}">
					<a class="text-success navalink" href="/logout">Logout</a>
				</c:if>
				<a class="text-success navalink" href="/showpurchase"><i
					class="fa-solid fa-cart-shopping"></i></a>
			</form>
		</div>
	</nav>

	<div class="container w-75">
		<div class="row">
			<div class="col p-3">
				<div
					class=" card  border-0 justify-content-between align-items-center">
					<img class="img imgeonemax eonem my-3 " style="width: 20rem"
						src="${product.image }">
						<h3 class="textcolpi my-3 ">Price: $ ${product.price }</h3> 
				</div>
				<!-- <img  class="imgeonemax my-3 " src="aaacc.jpeg"> -->
			</div>

			<div class="col">
				<h1 class="textcolpi ">${product.name}</h1>
				
				<p class=" textcolpi my-3 ">Description:   </p>
				<p class=" textcolpi my-3 ">${product.description }</p>


				<form:form action="/createpurchase" method="post"
					modelAttribute="purchase">
					<%-- 	<form:errors path="*" /> --%>
					<p>
						<form:label path="amountof">
							<h5 class="  textcolpi  ">Amount</h5>
						</form:label>
						<form:input class=" p-2" type="number" path="amountof"
							name="quantity" min="1" max="5" value="1" />
					</p>
					<input type="hidden" name="total" value="${product.price}">
					<input type="hidden" name="product" value="${product.id}">
					<%-- 			<input type="hidden" name="total" value="${book.user.id}"> --%>

					<!-- 	<input class="btn btn-primary" type="submit" value="Submit" /> -->

					<div class="d-grid gap-2">
						<button class="btn btn-primary" type="submit">Add to cart</button>
						<button class="btn btn-primary" type="button"
							onclick="location.href='http://localhost:8080/allcandies';">All
							candies</button>

					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- 
	<div
		class="navbar bgnavbar  w-25 mx-auto d-block my-3 p-3 opacity-75 rounded-pill   ">
		<h3 class="text-white text-center">You may also like</h3>
	</div>
	 -->

	<div
		class="navbar bggbluelight  w-25 mx-auto d-block my-3 p-3 opacity-75   rounded-pill    ">
		<h3 class="text-white text-center">You may also like</h3>
	</div>


	<div class=" w-75 mx-auto d-block my-3 p-3 ">
		<div class="container  p-3 ">
			<div
				class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3  justify-content-evenly align-items-center">


				<c:forEach var="product" items="${allproduct}">
					<div class="col">
						<div class="card   " style="width: 15rem;">
							<div
								class=" card   border-0 justify-content-evenly align-items-center">
								<img class="imgeonem my-3 " src="${product.image }">
								<h5 class="card-title">${product.name}</h5>
							</div>
							<div class="card-body bcolor1">

								<h3 class="card-text my-3">$ ${product.price }</h3>

								<div class="d-grid gap-2">
									<button class="btn btn-primary" type="button"
										onclick="location.href='http://localhost:8080/showcandiebyid/${product.id}';">View
										options</button>
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
<!-- 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js"
	integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

</html>