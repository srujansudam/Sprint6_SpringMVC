
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Home Page</title>
</head>

<body>
<marquee style="font-size:xx-large; font-weight: 800"><font color="black">WELCOME USER!</font></marquee>

	<form method="post" action="userinput">
		<div align="center">
			Enter User-Name:<br> <input type="text" name="userId" required><br> Enter
			Password:<br> <input type="password" name="password" required><br>
			<button>LOGIN</button>

		</div>
	</form>
</body>
</html>