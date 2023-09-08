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
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="">
  <nav class="navbar bgnavbar  w-75 mx-auto d-block my-3 p-3 opacity-75 rounded-pill  ">
    <div class="container-fluid">
      <a class="navbar-brand navbartitle" href="/">
     <!--    <img src="/img/22.png" alt="Logo" class="d-inline-block align-text-top sizeima"> -->
       	🍭PicaLicious
      </a>
      <a class="text-success navalink" href="/allcandies">All Candies </a>
      	<a class="text-success navalink" href="/logout">Logout</a>
      <a
					class="text-success navalink" href="/showpurchase"><i
					class="fa-solid fa-cart-shopping"></i></a>
   
    </div>
  </nav>

	<div class="container w-75">
		<div class="row">
			<div class="col">


				<form:form
				 class="w-75 mx-auto d-block my-3 p-3 border bggreenlight bg-opacity-75 text-white"
					action="/register" method="post" modelAttribute="newUser">
					<%-- <form:errors path="*" class="text-danger" /> --%>
			            <h1 class="textsmt">Registration</h1>

					<div class="form-group">
						<label>User name:</label>
						<form:input path="userName" class="form-control" />
						<form:errors path="userName" class="text-danger" />
					</div>

					<div class="form-group">
						<label>Last name:</label>
						<form:input path="lastname" class="form-control" />
						<form:errors path="lastname" class="text-danger" />
					</div>

					<div class="form-group">
						<label>Adress:</label>
						<form:input path="address" class="form-control" />
						<form:errors path="address" class="text-danger" />
					</div>

					<div class="form-group">
						<label>City:</label>
						<form:input path="city" class="form-control" />
						<form:errors path="city" class="text-danger" />
					</div>

					<div class="form-group">
						<label>Zip Code:</label>
						<form:input path="code" class="form-control" />
						<form:errors path="code" class="text-danger" />
					</div>

					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>



					<div class="form-group">
						<label>Password:</label>
						<form:password path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />

					</div>
					<div class="form-group">
						<label> Confirm Password:</label>
						<form:password path="confirm" class="form-control" />
						<form:errors path="confirm" class="text-danger" />
					</div>

					<input type="submit" value="Submit" class="btn  my-3 btn-success" />

				</form:form>

			</div>
			

			<div class="col">

				<form:form
					 class="w-75 mx-auto d-block my-3 p-3 border bggreenlight bg-opacity-75 text-white" action="/login" method="post" modelAttribute="newLogin">
					<%-- <form:errors path="*" class="text-danger" /> --%>
					       <h1 class="textsmt">Login</h1>

					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:password path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>


					<input type="submit" value="Submit" class="btn  my-3  btn-primary " />
				</form:form>

			</div>
		</div>


	</div>

</body>
</html>