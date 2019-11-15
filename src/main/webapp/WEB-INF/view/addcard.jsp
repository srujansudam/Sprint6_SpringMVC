<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>Enter the following details</h3>
	<form action="saveCard">
	<div>
			<label>UserId:</label>
			<input type="text" name="userId" required />
		</div>
	<div>
			<label>Card Number:</label>
			<input type="number" name="cardNumber" required maxlength="16" />
		</div>
		<div>
			<label>Credit Card SCore:</label>
			<input type="number" name="creditScore" />
		</div>
		<div>
			<label>Credit Card Limit:</label>
			<input type="number" name="creditLimit" />
		</div>
		<div>
			<label>Income:</label>
			<input type="number" name="income" />
		</div>
		<div>
			<label>Name on Card:</label>
			<input type="text" name="nameOnCard" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>
		<div>
			<label>CVV Number:</label>
			<input type="text" name="cvvNum" />
		</div>
		<div>
			<label>Credit Card Pin:</label>
			<input type="text" name="currentPin" />
		</div>
		<div>
			<label>Credit Card Type:</label>
			<input type="text" name="cardType" />
		</div>
		<div>
			<label>Expiry Date:</label>
			<input type="date" name="dateOfExpiry" required pattern="^((0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/([12][0-9]{3}))$" />
		</div>
		<div>
			
			<input type="submit" value="SUBMIT"/>
		</div>
			
	</form>
<jsp:include page="/cardnav" />
</body>
</html>