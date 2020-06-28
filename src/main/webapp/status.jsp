<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item active">Table users output</li>
    </ul>
</nav>
<div class="container-fluid">
    <a href="/data">Back to the list</a> </br> >
</div>
<%
			ArrayList<String> std = (ArrayList<String>) request.getAttribute("errorList");
			for (String s : std) {
		%>
            <%=s%>
		<%}%>
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
