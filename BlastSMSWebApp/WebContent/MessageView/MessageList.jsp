<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages Page</title>
</head>
<body>
	<div class="row">
		<div class="container">
			<h3 class="text-center">Messages</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new"
					class="btn btn-success">Add Message</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Status</th>
						<th>Group</th>
						<th>Sender</th>
						<th>Recipient</th>
						<th>Title</th>
						<th>Date Sent</th>
					</tr>
				</thead>
				<tbody>					
					<c:forEach var="message" items="${listMessage}">

						<tr>
							<td><c:out value="${message.status}" /></td>
							<td><c:out value="${message.group}" /></td>
							<td><c:out value="${message.sender}" /></td>
							<td><c:out value="${message.recipient}" /></td>
							<td><c:out value="${message.title}" /></td>
							<td><c:out value="${message.date_sent}" /></td>

							<td><a href="edit?id=<c:out value='${message.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${message.id}' />">Delete</a></td>

						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>