<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	<table class="table table-striped">
		<caption><spring:message code="todo.caption" /></caption>
		<thead>
			<tr>
				<th>Description</th>
				<th>Target Date</th>
				<th>Is Completed?</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
			<!-- for(Todo todo: todos) -->
			<c:forEach items="${ todos }" var="todo">
				<tr>
					<td>${ todo.desc }</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value= "${ todo.targetDate }" /></td>
					<td>${ todo.done ? 'Yes' : 'No' }</td>
					<td><a href="/update-todo?id=${ todo.id }" class="btn btn-primary">Edit</a></td>
					<td><a href="/delete-todo?id=${ todo.id }" class="btn btn-danger">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>	
	<%-- ${ todos } --%>
	<br>
	<div>
		<a href="/add-todo" class="btn btn-success">Add</a>
	</div>
</div>	
	
<%@ include file="common/footer.jspf" %>
