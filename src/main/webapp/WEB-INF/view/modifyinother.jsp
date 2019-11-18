<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2
		style="background-color: aliceblue; font-family: sans-serif; font-size: x-large;">Enter
		the details to be modified:</h2>
	<form method=post action="modifyinother">
		<div>

			<select name="type">
				<option value="${beneficiary.type}">${beneficiary.type}</option>
			</select>
		</div>
		<div>
			<label>Account Number:</label> <input type="number"
				name="accountNumber1" value="${beneficiary.accountNumber}"
				disabled="disabled" /> <input type="hidden" name="accountNumber"
				value="${beneficiary.accountNumber}" />
		</div>

		<div style="margin-top: 20">
			<label>Account Holder's Name:</label> <input type="text"
				name="accountName" pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>
		<div style="margin-top: 20">
			<label>IFSC Code:</label> <input type="text" name="ifscCode" />
		</div>
		<div style="margin-top: 20">
			<label>Bank Name:</label> <input type="text" name="bankName" />
		</div>
		<div style="margin-top: 20">
			<input type="submit" value="MODIFY">
		</div>
	</form>
 <div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/bennav" /></div>
			</div>
			
</body>
</html>