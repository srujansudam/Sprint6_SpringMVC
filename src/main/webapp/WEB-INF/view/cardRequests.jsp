<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.cg.ibs.rm.model.CreditCard"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>unapprovedrequests</title>
</head>
<body>
	<jsp:include page="/rmadmin"></jsp:include>
	<h1 align="center" style="font-size: xx-large; background-color: aliceblue">Credit Cards</h1>
	<c:choose>
		<c:when test="${cards==null or cards.size()==0 }">
			<p align="center" style="font-size: x-large;">
				<strong>No Records Available!</strong>
			</p>
		</c:when>
		<c:otherwise>
		<div align="center">
			<table border="1" >
				<tr>
					<th>Card Number</th>
					<th>Card Name</th>
					<th>Card Expiry</th>
					<th>Card Status</th>
					<th>Request Time</th>
					<th colspan="2">Approve/Decline</th>
				</tr>
				<c:forEach var="card" items="${cards}">
					<tr>
						<td>${card.cardNumber}</td>
						<td>${card.nameOnCard }</td>
						<td>${card.dateOfExpiry}</td>
						<td>${card.cardStatus}</td>
						<td>${card.timestamp}</td>
						<td colspan="2">&nbsp;
							<form action="acceptCards">
								<input type="hidden" name="cardNumber"
									value="${card.cardNumber}"> <input type="submit"
									name="decision" value="Approve" onclick="myFunction()">&nbsp;&nbsp;
								<input type="submit" name="decision" value="Decline"
									onclick="myFunction2()"> &nbsp;
							</form>
							<div>
								<script>
									function myFunction() {
										alert("Are you sure you want to approve?");
									}

									function myFunction2() {
										alert("Are you sure you want to decline?");
									}
								</script>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</c:otherwise>
	</c:choose>
		<div align="center" style="font-size: x-large; margin-top:300">
	<jsp:include page="/bankadminnav" /></div>
</body>
</html>