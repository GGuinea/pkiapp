<%@page import="pkiapp.DatabaseOutput"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
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
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item active">Table users output</li>
		</ul>
	</nav>
	<br>
	<div class="container-fluid">
		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Joined</th>
					<th scope="col">LastVisit</th>
					<th scope="col">Counter</th>
				</tr>
			</thead>
			<tbody>
			<%ArrayList<DatabaseOutput> std = (ArrayList<DatabaseOutput>)request.getAttribute("data"); 
           for(DatabaseOutput s : std){%> 
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
	</div>

</body>
</html>