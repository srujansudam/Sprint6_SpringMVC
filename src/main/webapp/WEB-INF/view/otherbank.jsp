<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h2 style="background-color: aliceblue; font-family: sans-serif; font-size: x-large;">Enter the following details</h2>
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
	<form method=post>
		<div>
Type of
		Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="type">
				<option value="MYACCOUNTINOTHERBANKS">MY ACCOUNT IN OTHER
					BANKS</option>
				<option value="OTHERSACCOUNTINOTHERBANKS">OTHERS ACCOUNT IN
					OTHER BANKS</option>
			</select>
		</div>
		<div style="margin-top: 20">
			<label>Account Number:</label> <input id="a" type="password"
				name="accountNumber" required pattern="^[0-9]{11}$" />
		
			<label>Confirm Account Number:</label> <input id="b" type="text"
				name="accountNumber1" required pattern="^[0-9]{11}$" />
		</div>

		<div style="margin-top: 20">
			<label>Account Holder's Name:</label> <input type="text"
				name="accountName" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>
		<div style="margin-top: 20">
			<label>IFSC Code:</label> <input type="text" name="ifscCode" />
		</div>
		<div style="margin-top: 20"> 
			<label>Bank Name:</label> <input type="text" name="bankName" />
		</div>
		<div style="margin-top: 20">
		<input type="submit" value="Submit" onclick="return check()"> </div>
	</form>
<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/bennav" /></div>
	</div>

</body>
</html>