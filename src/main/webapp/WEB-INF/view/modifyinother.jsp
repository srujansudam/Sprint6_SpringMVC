<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/remnav" />
<jsp:include page="/bennav" />
	<h3>Enter Details</h3>
	<form method=post action="modifyinother">
	<div>
		
			<select name="type">
				<option value="${beneficiary.type}">${beneficiary.type}</option>
			</select>
	</div>
	<div>
		<label>Account Number:</label> <input type="number"
				name="accountNumber1" value="${beneficiary.accountNumber}" disabled="disabled"/>
				<input type="hidden"
				name="accountNumber" value="${beneficiary.accountNumber}" />
	</div>

	<div>
		<label>Account Holder's Name:</label> <input type="text"
			name="accountName" pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
	</div>
	<div>
		<label>IFSC Code:</label> <input type="text" name="ifscCode" />
	</div>
	<div>
		<label>Bank Name:</label> <input type="text" name="bankName" />
	</div>
	<input type="submit" value="MODIFY">
</form>

</body>
</html>