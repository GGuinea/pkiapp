<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <ul class="navbar-nav">
        <li class="nav-item active">Table users output</li>
    </ul>
</nav>
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="przykladowaLista" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Wybierz tabele
  </button>
    <div class="dropdown-menu" aria-labelledby="przykladowaLista">
        <%
        ArrayList<String> std1 = (ArrayList<String>) request.getAttribute("tableList");
        for (String s : std1) {
        %>
        <a class="dropdown-item" href="/<%=s%>"><%=s%></a>
      <%}%>
  </div>
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
