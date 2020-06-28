<%@page import="java.util.ArrayList"%>
<%@ page import="pkiapp.InvoicesDatabaseOutput" %>
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

	<table class="table table-dark">
		<thead>
		<tr>
			<th scope="col">Id</th>
			<th scope="col">Title</th>
			<th scope="col">AuthorId</th>
			<th scope="col">Created</th>
		</tr>
		</thead>
		<tbody>
		<%
			ArrayList<InvoicesDatabaseOutput> std = (ArrayList<InvoicesDatabaseOutput>) request.getAttribute("data");
			for (InvoicesDatabaseOutput s : std) {
		%>
		<tr>
			<td><%=s.getId()%></td>
			<td><%=s.getTitle()%></td>
			<td><%=s.getAuthorId()%></td>
			<td><%=s.getCreated()%></td>
		</tr>
		<%}%>
		</tbody>
	</table>
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
</head>
</html>
