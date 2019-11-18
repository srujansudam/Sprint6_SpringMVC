
<%@page import="java.time.LocalDate"%>
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cg.ibs.rm.service.CreditCardServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/remnav" />
	<jsp:include page="/cardnav" />
	<h3>Enter the following details</h3>
	<h3>Enter Details</h3>
	<script type="text/javascript">
		function check() {

			var a = document.getElementById("a").value;
			var b = document.getElementById("b").value;

			if (a != b) {
				alert("card numbers do not match");
				return false;
			} else {
				alert("Are you sure you want to submit?");
				return true;
			}

		}
	</script>

	<form method="post">
		<div>
			<label>Card Number:</label> <input id="a" type="password"
				name="cardNumber" required pattern="^[0-9]{16}$" />
		</div>
		<div>
			<label>Confirm Card Number:</label> <input id="b" type="text"
				name="cardNumber1" required pattern="^[0-9]{16}$" />
		</div>
		<div>
			<label>Credit Card Score:</label> <input type="number"
				name="creditScore" />
		</div>
		<div>
			<label>Credit Card Limit:</label> <input type="number"
				name="creditLimit" />
		</div>
		<div>
			<label>Income:</label> <input type="number" name="income" />
		</div>
		<div>
			<label>Name on Card:</label> <input type="text" name="nameOnCard"
				required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>
		<div>
			<label>CVV Number:</label> <input type="text" name="cvvNum" />
		</div>
		<div>
			<label>Credit Card Pin:</label> <input type="text" name="currentPin" />
		</div>
		<div>
			<label>Credit Card Type:</label> <input type="text" name="cardType" />
		</div>
		<div>
			<label>Expiry Date: MM-</label> <select name="month">

				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> <label>YYYY-</label> <select name="year">
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
				<option value="2027">2027</option>
				<option value="2028">2028</option>
				<option value="2029">2029</option>
				<option value="2030">2030</option>
				<option value="2031">2031</option>
				<option value="2032">2032</option>
				<option value="2033">2033</option>
				<option value="2034">2034</option>
				<option value="2035">2035</option>
				<option value="2036">2036</option>
				<option value="2037">2037</option>
				<option value="2038">2038</option>
				<option value="2039">2039</option>
				<option value="2040">2040</option>

			</select>
		</div>

		<div>
			<button onclick="return check()">SUBMIT</button>

		</div>

	</form>

</body>
</html>