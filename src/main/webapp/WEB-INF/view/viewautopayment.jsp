<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.cg.ibs.rm.model.CreditCard"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view Auto payment</title>
</head>
<body>
	<h2>You have the following autopayment services added:</h2>


	<c:choose>
		<c:when
			test="${savedAutopayemnts==null or savedAutopayemnts.size()==0 }">
			<p>
				<strong>No Records Available</strong>
			</p>

		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>Service Name</th>
					<th>Date of Start</th>
					<th>Date of End</th>
					<th>Amount</th>

					<th>Modify</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="autopayment" items="${savedAutopayemnts}">
					<tr>
						<td>${autopayment.serviceName}</td>
						<td>${autopayment.dateOfStart}</td>
						<td>${autopayment.dateOfEnd}</td>
						<td>${autopayment.amount}</td>


						<td>
							<form action="modifyautopayment">
								<input type="hidden" name="spi"
									value="${autopayment.serviceProviderId.spi}"> <input
									type="submit" name="modify" value="Modify"
									onclick="myFunction()" />
							</form>
						<td>
							<form action="deleteautopayment">
								<input type="hidden" name="spi"
									value="${autopayment.serviceProviderId.spi}"> <input
									type="submit" name="delete" value="Delete"
									onclick="myFunction2()" />
							</form> <script>
								function myFunction() {
									alert("Are you sure you want to modify?");
								}

								function myFunction2() {
									alert("Are you sure you want to delete?");
								}
							</script>
						</td>
					</tr>

				</c:forEach>

			</table>
		</c:otherwise>
	</c:choose>
	<form>
		<div></div>
	</form>
<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/autopaymentnav" /></div>
	</div>
</body>
</body>
</html>