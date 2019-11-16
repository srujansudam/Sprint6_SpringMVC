<hr />
<nav>
<%@page import="com.cg.ibs.rm.ui.Status"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<h3>Enter the following details</h3>
	<form method="post">
		<div>
			<label>UserId:</label> <input type="text" name="userId" required />
		</div>
		<label>Choose Type of Account:</label> <select name="type">
			<option value="MYACCOUNTINIBS" >MY ACCOUNT IN IBS</option>
			<option value="MYACCOUNTINOTHERBANKS">MY ACCOUNT IN OTHER
				BANKS</option>
			<option value="OTHERSACCOUNTINIBS">OTHERS ACCOUNT IN IBS</option>
			<option value="OTHERSACCOUNTINOTHERBANKS">OTHERS ACCOUNT IN
				OTHER BANKS</option>
		</select>
		<div>
			<label>Account Number:</label> <input type="text"
				name="accountNumber" required pattern="^[0-9]{11}$" />
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
		<div>
			<input type="submit" value="SUBMIT" />
		</div>

	</form>
	
</nav>
<hr />