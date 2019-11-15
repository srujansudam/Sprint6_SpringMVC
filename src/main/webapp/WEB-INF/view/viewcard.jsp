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
<c:when test="${card==null or card.size()==0 }">
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
<th colspan="2">Approve/Decline</th>
</tr>
<c:forEach var="card" items="${card}">
<tr>
<td>${card.cardNumber}</td>
<td>${card.nameOnCard }</td>
<td>${card.dateOfExpiry}</td>
<td>${card.cardStatus}</td>
<td colspan="2">&nbsp;<input type="submit" name="decision" value="Approve"
formaction="accept">&nbsp;&nbsp;
<input type="submit" name="decision" value="Decline"
formaction="accept">&nbsp;</td>
</tr>

</c:forEach>

</table>
</c:otherwise>
</c:choose>


</body>
</body>
</html>