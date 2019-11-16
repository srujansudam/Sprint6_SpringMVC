<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bankadmin</title>
</head>
<body>
	<h2>Welcome Admin</h2>
	<jsp:include page="/bankadminnav" />
	<a href="cardRequests">Credit Card Requests</a>
	<span>|</span>
	<a href="beneficiaryRequests">Beneficiary Requests</a>
	<span>|</span>
	<a href="chooseidentity">Exit</a>
	<span>|</span>
</body>
</html>