<%@page import="com.cg.ibs.rm.ui.Status"%>
<%@page import="com.cg.ibs.rm.ui.Type"%>
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

	<h2 align="center">You have the following beneficiaries:</h2>


	<c:choose>
		<c:when
			test="${savedBeneficiaries==null or savedBeneficiaries.size()==0 }">
			<p>
				<strong>No Records Available</strong>
			</p>
		</c:when>
		<c:otherwise>
		<div align="center">
			<table border="1">
				<tr>
					<th>Beneficiary Account No</th>
					<th>Beneficiary Account Name</th>
					<th>Bank IFSC Code</th>
					<th>Bank Name</th>
					<th>Account Type</th>
					<th>Current Status</th>
					<th>Modify</th>
					<th>Delete</th>
				</tr>
				<%
					String status = Status.PENDING.toString();
				%>
				<c:forEach var="beneficiary" items="${savedBeneficiaries}">
					<tr>
						<td>${beneficiary.accountNumber}</td>
						<td>${beneficiary.accountName}</td>
						<td>${beneficiary.ifscCode}</td>
						<td>${beneficiary.bankName}</td>
						<td>${beneficiary.type}</td>
						<td>${beneficiary.status}</td>
						<td><form action="modifybeneficiary">
								<input type="hidden" name="accountNumber"
									value="${beneficiary.accountNumber}"> <input
									type="submit" name="modify" value="Modify"
									onclick="myFunction()" />
							</form></td>
						<td>
							<form action="deleteben">
								<input type="hidden" name="accountNumber"
									value="${beneficiary.accountNumber}"> <input
									type="submit" name="delete" value="Delete"
									onclick="myFunction2()" />
							</form>
							<div>
								<script>
									function myFunction() {
										alert("Are you sure you want to modify?");
									}

									function myFunction2() {
										alert("Are you sure you want to delete?");
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
	<form>
		<div></div>
	</form>
<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/bennav" /></div>
	</div>

</body>
</body>
</html>