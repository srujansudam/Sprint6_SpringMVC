<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h3>Enter Details</h3>
	<form method=post>
	<div>
		
			<select name="type">
				<option value="MYACCOUNTINOTHERBANKS">MY ACCOUNT IN OTHER
					BANKS</option>
				<option value="OTHERSACCOUNTINOTHERBANKS">OTHERS ACCOUNT IN
					OTHER BANKS</option>
			</select>
	</div>
	<div>
		<label>Account Number:</label> <input type="number"
			name="accountNumber" required maxlength="11" />
	</div>

	<div>
		<label>Account Holder's Name:</label> <input type="text"
			name="accountName" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
	</div>
	<div>
		<label>IFSC Code:</label> <input type="text" name="ifscCode" />
	</div>
	<div>
		<label>Bank Name:</label> <input type="text" name="bankName" />
	</div>
	<input type="submit" value="Submit">
</form>

</body>
</html>