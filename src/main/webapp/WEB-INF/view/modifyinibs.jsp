<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>Enter Details</h3>
	<form  method="post" >
	Type of Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="type" >
			
			<option value="MYACCOUNTINIBS">MY ACCOUNT IN IBS</option>
			<option value="OTHERSACCOUNTINIBS">OTHERS ACCOUNT IN IBS</option>
	</select>
		<div>
			<label>Account Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="number"
				name="accountNumber" required maxlength="11" />
		</div>

		<div>
			<label>Account Holder's Name:</label> <input type="text"
				name="accountName" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>
	
		<input type="submit" value="Submit" >



	</form>
	

</body>
</html>