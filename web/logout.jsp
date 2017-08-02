<%-- 
    Document   : logout
    Created on : Feb 11, 2017, 3:06:49 PM
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
				Login
			</h1>
			<br />
			SuccessFully Logged out.
			<br />
			<br />
			<br />
			<br />
			<br />
			<form action="servlet/LoginServlet" method="post" name="loginform">
				<table>
					<tr>
						<td>
							User Name
						</td>
						<td>
							<input type="text" name="username" />
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
							<input type="submit" value="Login">
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
var frmvalidator = new Validator("loginform");
frmvalidator.addValidation("username", "req", "Please enter the UserName");
frmvalidator.addValidation("username", "maxlen=15",
		"Max length for UserName is 15");
frmvalidator.addValidation("username", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("password", "req", "Please enter the Password");
frmvalidator.addValidation("password", "maxlen=15",
		"Max length for Password is 15");
history.go(1);
</script>
	</body>
</html>
