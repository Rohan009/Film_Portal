<%-- 
    Document   : registerfail
    Created on : Feb 11, 2017, 3:13:38 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang=de>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Media</title>


<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/simple-sidebar.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="js/jquery-1.11.1.min.js">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.min.js">

</head>
    <body>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page" align="center">
			<h1>
				Register
			</h1>
			<br />
			Register Fail,
			<br />
			<br />
			<br />
			<br />
			<br />
			<form action="servlet/RegisterServlet" method="post"
				name="registerform">
				<table>
					<tr>
						<td>
							User Name
						</td>
						<td>
							<input type="text" name="username">
						</td>
					</tr>
					<tr>
						<td>
							Password
						</td>
						<td>
							<input type="password" name="password">
						</td>
					</tr>
					<tr>
						<td>
							Account Number
						</td>
						<td>
							<input type="text" name="accno">
						</td>
					</tr>
					<tr>
						<td>
							First Name
						</td>
						<td>
							<input type="text" name="firstname">
						</td>
					</tr>
					<tr>
						<td>
							Last Name
						</td>
						<td>
							<input type="text" name="lastname">
						</td>
					</tr>
					<tr>
						<td>
							Address
						</td>
						<td>
							<textarea rows="5" cols="20" name="address"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							City
						</td>
						<td>
							<input type="text" name="city">
						</td>
					</tr>
					<tr>
						<td>
							Phone
						</td>
						<td>
							<input type="text" name="phone">
						</td>
					</tr>
					<tr>
						<td>
							E-Mail
						</td>
						<td>
							<input type="text" name="email">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="Register">
						</td>
						<td>
							<input type="reset" name="Reset">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<!-- end latest-post -->
		<!-- start recent-posts -->
		<!-- end recent-posts -->
		<!-- end content -->
		<!-- start sidebar -->
		<div id="sidebar">
		</div>
		<!-- end sidebar -->
		<!-- end page -->
		<div id="footer">
			<p id="legal">
				
			</p>
		</div>
		<div
			style="font-size: 0.8em; text-align: center; margin-top: 1.0em; margin-bottom: 1.0em;">
			
		</div>
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("registerform");
frmvalidator.addValidation("username", "req", "Please enter the UserName");
frmvalidator.addValidation("username", "maxlen=15",
		"Max length for UserName is 15");
frmvalidator.addValidation("username", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("password", "req", "Please enter the Password");
frmvalidator.addValidation("password", "maxlen=15",
		"Max length for Password is 15");

frmvalidator.addValidation("firstname", "req", "Please enter the FirstName");
frmvalidator.addValidation("firstname", "maxlen=10",
		"Max length for UserName is 10");
frmvalidator.addValidation("firstname", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("lastname", "req", "Please enter the lastName");
frmvalidator.addValidation("lastname", "maxlen=10",
		"Max length for LastName is 10");
frmvalidator.addValidation("lastname", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("address", "req", "Please enter the Address");
frmvalidator.addValidation("address", "maxlen=25",
		"Max length for Address is 10");

frmvalidator.addValidation("city", "req", "Please enter the City");
frmvalidator.addValidation("city", "maxlen=10", "Max length for City is 10");
frmvalidator.addValidation("city", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("email", "req", "Please enter the Email");
frmvalidator.addValidation("email", "email", "Invalid Email");

frmvalidator.addValidation("phone", "req", "Please enter the Phone");
frmvalidator.addValidation("phone", "numeric", "PhoneNumber should be digit");
frmvalidator.addValidation("phone", "maxlen=10", "Max length for Phone is 10");
frmvalidator.addValidation("phone", "minlen=10", "Max length for Phone is 10");

frmvalidator.addValidation("accno", "req", "Please enter the Account Number");
frmvalidator.addValidation("accno", "numeric", "AccountNumber should be digit");
frmvalidator.addValidation("accountnumber", "maxlen=8",
		"AccoutNumber shold be 8 digits");

history.go(1);
</script>
	</body>
</html>
