<!DOCTYPE html>
<html lang="en">
<body>
<nav class="navbar navbar-expand-sm">
    <ul class="navbar-nav">
        <li class="nav-item active">Delete user</li>
    </ul>
</nav>
<div class="container-fluid">
    <form action="${pageContext.request.contextPath}/modifyUser" method="post">
        <p>Insert user ID to delete:</p>
        <input type="text" name="id"/>
        <p>Insert new user name:</p>
        <input type="text" name="name"/>
        <input type="submit" name="submit" value="submit"/>
    </form>
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
