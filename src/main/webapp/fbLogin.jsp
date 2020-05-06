<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
String user_name = (String) request.getParameter("user_name");
String user_email = (String) request.getParameter("user_email");
%>
<html lang="en">
<head>
<title>Facebook login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
	function signOut() {
		FB.logout(function(response) {
		});
	}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item"><%=user_name%></li>
			<li class="nav-item">      </li>
			<li class="nav-item"><%=user_email%></li>
		</ul>
	</nav>
	<br>
	<div class="container-fluid">
		<a href="/data">Show database</a> </br> <a href="/" onclick="signOut();">Sign
			out</a> </br>
	</div>

</body>
</html>