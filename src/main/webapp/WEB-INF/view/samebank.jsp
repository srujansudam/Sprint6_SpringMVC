
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Add Beneficiary</title>
</head>
<body>

	<h2 style="background-color: aliceblue; font-family: sans-serif; font-size: x-large;">Enter the following details</h2>
	<script type="text/javascript">
	<script type="text/javascript">
		function check() {

			var a = document.getElementById("a").value;
			var b = document.getElementById("b").value;

			if (a != b) {
				alert("account numbers do not match");
				return false;
			} else {
				alert("Are you sure you want to submit?");
				return true;
			}
		}
		
	</script>
	<form method="post" id="samebank">
		Type of
		Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="type">

			<option value="MYACCOUNTINIBS">MY ACCOUNT IN IBS</option>
			<option value="OTHERSACCOUNTINIBS">OTHERS ACCOUNT IN IBS</option>
		</select>
		<div style="margin-top: 20">
			<label>Account Number(*):</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="a" type="password"
				name="accountNumber" required pattern="^[0-9]{11}$" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label>Confirm Account Number(*):</label> <input id="b" type="text"
				name="accountNumber1" required pattern="^[0-9]{11}$" />
		</div>

		<div style="margin-top: 20">
			<label>Account Holder's Name(*):</label> <input type="text"
				name="accountName" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>

		<div style="margin-top: 20">
			<input type="submit" value="Submit" onclick="return check()" onclick="myFunction()">
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