<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body><div align="center">
	  <h2> ${exception}</h2>
	  <h2>Going back to Home Page.</h2>
	  </div>
	  <div style="margin-top: 100">
	<jsp:include page="/chooseidentity" />
	</div>
</body>
</html>