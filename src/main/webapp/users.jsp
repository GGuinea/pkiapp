<%@page import="java.util.ArrayList"%>
<%@ page import="pkiapp.UsersDatabaseOutput" %>
<!DOCTYPE html>
<html lang="en">
<body>
<%if (request.getAttribute("data") == null) {%>
<jsp:forward page="/index.jsp" />
<%}%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item active">Table users output</li>
	</ul>
	</nav>
<div class="container-fluid">

	<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
		<thead>
		<tr>
			<th class="th-sm">Id</th>
			<th class="th-sm">Name</th>
			<th class="th-sm">Joined</th>
			<th class="th-sm">LastVisit</th>
			<th class="th-sm">Counter</th>
		</tr>
		</thead>
		<tbody>
		<%
			ArrayList<UsersDatabaseOutput> std = (ArrayList<UsersDatabaseOutput>) request.getAttribute("data");
			for (UsersDatabaseOutput s : std) {
		%>
		<tr>
			<td><%=s.getId()%></td>
			<td><%=s.getName()%></td>
			<td><%=s.getCreateTime()%></td>
			<td><%=s.getLastVisitedTime()%></td>
			<td><%=s.getCounter()%></td>
		</tr>
		<%}%>
		</tbody>
	</table>
			<a href="newUser.jsp">Add new user</a> </br>
			<a href="deleteUser.jsp">Delete user</a> </br>
			<a href="modifyUser.jsp">Modify user</a> </br>
</div>
</body>
<head>
<title>Database output</title>
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
	<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
</head>
</html>
