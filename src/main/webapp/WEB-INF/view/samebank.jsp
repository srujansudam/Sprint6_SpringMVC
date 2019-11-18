
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
		Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="type">

			<option value="MYACCOUNTINIBS">MY ACCOUNT IN IBS</option>
			<option value="OTHERSACCOUNTINIBS">OTHERS ACCOUNT IN IBS</option>
		</select>
		<div>
			<label>Account Number:</label> <input id="a" type="password"
				name="accountNumber" required pattern="^[0-9]{11}$" />
		</div>
		<div>
			<label>Confirm Account Number:</label> <input id="b" type="text"
				name="accountNumber1" required pattern="^[0-9]{11}$" />
		</div>

		<div>
			<label>Account Holder's Name:</label> <input type="text"
				name="accountName" required pattern="^[a-zA-z]+([\\s][a-zA-Z]+)*$" />
		</div>

		<div>
			<input type="submit" value="Submit" onclick="return check()" onclick="myFunction()">
		</div>

	</form>

</body>
</html>