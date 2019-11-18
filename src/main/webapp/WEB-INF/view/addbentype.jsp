<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>Add Beneficiary type</title>
</head>
<body>
	
	<h1 align="center">Choose type of account:</h1>

	<a href="samebank" >
		<button style="margin-left: 510; height: 100px; font-weight: 700; width: 100px">In IBS</button>
	</a>
&nbsp;&nbsp;&nbsp;
	<a href="otherbank">
		<button style="height: 100px; font-weight: 700;">In Other Banks</button>
	</a>

<div style="margin-top: 300">
		<div align="center" style="font-size: large;">
			<jsp:include page="/remnav" /></div>
		<div align="center" style="font-size: large;">
			<jsp:include page="/bennav" /></div>
	</div>
</body>
</html>