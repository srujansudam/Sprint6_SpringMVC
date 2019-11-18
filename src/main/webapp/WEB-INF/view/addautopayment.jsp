
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
<style type="text/css">
label {
	display: block;
}
</style>

</head>
<body>
	<jsp:include page="/autopaymentnav" />
	<h3>Enter the following details</h3>
	<form method="post" action="/addautopayment">
		<div>
			<label>UserId:</label> <input type="text" name="userId" required />
		</div>
	<%-- <div>
		<label>Account</label> <select name="accountNumber">
		<c:forEach var="account" items="${accounts}">

				<option value="${accountNumber}">${account.accountNumber}</option>
			</c:forEach>	
			</select>
	</div> --%>
		<div>
			<label>Amount:</label> <input type="number" name="amount" />
		</div>
		<div>

			<label>Start date: <input type=date id=start
				name="dateOfStart" required></label>
		</div>
		<div>
			<label>End date: <input type=date id=end name="dateOfEnd"
				required></label>
		</div>

		<script>
			var start = document.getElementById('start');
			var end = document.getElementById('end');
			start.addEventListener('change', function() {
				if (start.value)
					end.min = start.value;
			}, false);
			end.addEventLiseter('change', function() {
				if (end.value)
					start.max = end.value;
			}, false);
		</script>
		<div>
			<label>Name of Service:</label> <input type="text" name="serviceName"
				required pattern="^[a-zA-z]+$" />
		</div>
		<div>
			<input type="submit" value="SUBMIT" />
		</div>

	</form>

</body>
</html>