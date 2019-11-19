<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bankadmin</title>
</head>
<body>
<marquee style="font-size:xx-large; font-weight: 800; background-color: aliceblue; margin-top: 100"><font color="black">WELCOME ADMIN!</font></marquee>
<div align="center" style="font-size: x-large; margin-top:100">
	<a href="cardRequests">Credit Card Requests</a>
	<span>|</span>
	<a href="beneficiaryRequests">Beneficiary Requests</a>
	<span>|</span>
	<a href="chooseidentity">Exit</a>
	<span>|</span></div>
	<div align="center" style="font-size: x-large; margin-top:300">
	<jsp:include page="/bankadminnav" /></div>
</body>
</html>