
<%@page import="java.time.LocalDate"%>
<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cg.ibs.rm.model.AutoPayment"%>
<%@ page import="com.cg.ibs.rm.model.ServiceProvider"%>
<%@ page import="com.cg.ibs.rm.model.ServiceProviderId"%>
<%@ page import="com.cg.ibs.rm.service.AutoPaymentServiceImpl"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Add Auto payment</title>
<style type="text/css">
label {
	display: block;
}
</style>

</head>
<body>
	<h3>Enter the following details</h3>
	<form method="post">
		<div>
			<select name="accountNumber">
				<option>--SELECT ACCOUNT--</option>
				<c:forEach var="account" items="${accounts}">

					<option value="${account.accNo}">${account.accNo}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>Amount:</label> <input type="number" name="amount" />
		</div>
		<div>

			<label>Start date: <input type=date id=start
				name="dateOfStart" required></label><br>
		</div>
		<div>
			<label>End date: <input type=date id=end name="dateOfEnd"
				required></label><br>
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
		<br>
		<div>
			<select name="serviceName">
				<option>--SELECT SERVICE NAME--</option>
				<c:forEach var="serviceName" items="${serviceProviders}">
					<option value="${serviceName.nameOfCompany}">
						${serviceName.nameOfCompany}</option>
				</c:forEach>
			</select>
		</div>


		<div>
			<br> <input type="submit" value="SUBMIT" onclick="myFunction()" />
		</div>
		<div>
			<script>
				function myFunction() {
					alert("Are you sure you want to submit?");
				}
			</script>
		</div>
	</form>
<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/autopaymentnav" /></div>
	</div>
</body>
</html>