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
<script
	src="https://www.paypal.com/sdk/js?client-id=Af4i2F2tALHoW5npuuYJnlMcM8_Wko67i2X2tWGrcYsAexuFLLr_OvShhHSUrNJ02trtbh0HqIB54Aju&currency=USD"></script>
</head>
<body class="">
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
	<div class="container w-75 my-3 mx-auto d-block">
		<div class="row">
			<div class="col">
				<table class="table my-3  w-75  mx-auto table-borderless">

					<thead class="my-3">


					</thead>
					<tbody>
						<c:if test="${user_id ne null}">
							<h6>${thisuser.userName} this is your cart.</h6>
						</c:if>
						<%-- <h1>${cart_id}</h1> --%>
						<c:forEach var="purchase" items="${allpurchases}">
							<tr>
								<td><img class="imgeonsmall rounded-pill"
									src="${purchase.product.image}"></td>
								<td><h5>${purchase.product.name}</h5>
									<h6>$ ${purchase.product.price}</h6></td>
								<td>
									<h6>Amount</h6>
									<h6 class="text-center ">${purchase.amountof}</h6>
								</td>
								<td><a class="text-success navalink"
									href="/delete/${purchase.product.id}/${cart_id}"><i
										class=" textsmt fa-solid fa-trash"></i></a></td>
										
								<%-- <td><a class="text-success navalink"
									href="/update/${purchase.product.id}/${cart_id}"><i class="fa-solid fa-minus"></i></a></td>
							</tr> --%>
						</c:forEach>

					</tbody>
				</table>
				<hr>
				<div class="d-flex">
					<h2 class=" my-3  w-50  mx-auto text-center">TOTAL</h2>
					<h2 class=" my-3  w-50  mx-auto text-center">$ ${total}</h2>
				</div>



				<div class="d-flex my-3   w-75  mx-auto ">

					<div class="d-block my-3  w-50  mx-auto ">
						<button type="button" class="btn btn-primary  mx-auto"
							onclick="location.href='http://localhost:8080/allcandies';">Add more products</button>
					</div>
					<!-- 
					<div class="d-block my-3  w-50  mx-auto ">
						<button type="button" class="btn btn-secondary    mx-auto">Proceed
							to payment</button>
					</div> -->
				</div>

			</div>

			<div class="col">

				<div id="paypal-button-container"></div>
				<script>
      paypal.Buttons({
        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: ${total} // Can also reference a variable or function
              }
            }]
          });
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
          return actions.order.capture().then(function(orderData) {
            // Successful capture! For dev/demo purposes:
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
            const transaction = orderData.purchase_units[0].payments.captures[0];
            alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);
            // When ready to go live, remove the alert and show a success message within this page. For example:
            // const element = document.getElementById('paypal-button-container');
            // element.innerHTML = '<h3>Thank you for your payment!</h3>';
            // Or go to another URL:  actions.redirect('thank_you.html');
          });
        }
      }).render('#paypal-button-container');
    </script>

				<%-- 
				<form:form
					class="w-75 mx-auto d-block my-3 p-3 border bggreenlight bg-opacity-75 text-white"
					action="/register" method="post" modelAttribute="newUser">
					<form:errors path="*" class="text-danger" />
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
					<input type="submit" value="Submit" class="btn  my-3 btn-success" />

				</form:form> --%>

			</div>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>

	<div class=" navbar bgnavbar  w-75 mx-auto d-flex my-3 p-3 opacity-75 ">

	</div>

</body>

 <script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js"
	integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script> 

</html>