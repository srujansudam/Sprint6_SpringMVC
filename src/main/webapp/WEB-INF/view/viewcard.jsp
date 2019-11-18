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

	<h2 align="center">You have the following credit cards:</h2>


	<c:choose>
		<c:when test="${savedCards==null or savedCards.size()==0 }">
			<p>
				<strong>No Records Available</strong>
			</p>
		</c:when>
		<c:otherwise>
		<div align="center">
			<table border="1" >
				<tr>
					<th rowspan="1.5">Card Number</th>
					<th rowspan="1.5">Card Name</th>
					<th rowspan="1.5">Card Expiry</th>
					<th rowspan="1.5">Card Status</th>
					<th rowspan="1.5">Delete</th>
				</tr>
				<c:forEach var="card" items="${savedCards}">
					<tr>
						<td >${card.cardNumber}</td>
						<td>${card.nameOnCard }</td>
						<td>${card.dateOfExpiry}</td>
						<td>${card.cardStatus}</td>
						<td>
							<form action="deletecard">
								<input type="hidden" name="cardNumber"
									value="${card.cardNumber}"> <input type="submit"
									name="delete" value="Delete" onclick="myFunction2()" />
							</form> <script>
								function myFunction2() {
									alert("Are you sure you want to delete?");
								}
							</script>
						</td>
					</tr>

				</c:forEach>

			</table>
			</div>
		</c:otherwise>
	</c:choose>

<div align="center" style="font-size: x-large; margin-top: 100px">
	  <jsp:include page="/cardnav" />
	  <jsp:include page="/remnav" />
	
	</div>
</body>
</body>
</html>