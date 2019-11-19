
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
<title>Modify Auto Payment</title>
</head>
<body>

	<h2
		style="background-color: aliceblue; font-family: sans-serif; font-size: x-large;">Enter
		the details to be modified:</h2>
	<form method=post action="modifyautopayment">

		<label>Service
			Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<input type="text" name="serviceName"
			value="${autoPayment.serviceName}" disabled="disabled" />
			<input type="hidden" name="spi"
			value="${spi}" />
		<%
			LocalDate date = LocalDate.now();
		%>
		<div>
			<label>Amount:</label> <input type="number" name="amount" />
		</div>
		<div>
			<label>Start date: <input type=date id=start
				name="dateOfStart" required min="${date}"></label><br>
		</div>
		<div>
			<label>End date: <input type=date id=end name="dateOfEnd"
				></label><br>
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
		<div style="margin-top: 20">
			<input type="submit" value="MODIFY" onclick="myFunction()">
		</div>

		<script>
			function myFunction() {
				alert("Are you sure you want to submit?");
			}
		</script>
	</form>
	<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/autopayment" /></div>
	</div>
</body>
</html>
