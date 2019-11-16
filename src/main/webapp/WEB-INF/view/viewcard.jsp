<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.cg.ibs.rm.model.CreditCard"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Credit Cards</title>
</head>
<body>
	<h2>You have the following credit cards:</h2>


	<c:choose>
		<c:when test="${savedCards==null or savedCards.size()==0 }">
			<p>
				<strong>No Records Available</strong>
			</p>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>Card Number</th>
					<th>Card Name</th>
					<th>Card Expiry</th>
					<th>Card Status</th>
					<th colspan="2">Delete</th>
				</tr>
				<c:forEach var="card" items="${savedCards}">
					<tr>
						<td>${card.cardNumber}</td>
						<td>${card.nameOnCard }</td>
						<td>${card.dateOfExpiry}</td>
						<td>${card.cardStatus}</td>
						<td>
							<form action="deletecard">
								<input type="hidden" name="accountNumber"
									value="${card.cardNumber}"> <input
									type="submit" name="delete" value="Delete" />
							</form>
						</td>
					</tr>

				</c:forEach>

			</table>
		</c:otherwise>
	</c:choose>


</body>
</body>
</html>