<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

	<div class="container">
		<h1>Add a Todo</h1>

		<form:form method="post" modelAttribute="todo">
			<form:hidden path="id"/>
			
			<fieldset class="form-group">
				<form:label path="desc">Description</form:label> 
				<form:input path="desc" type="text" class="form-control" required="required" placeholder="Your Todo"></form:input>
				<form:errors path="desc" cssClass="text-warning" />
			</fieldset>
			
			<fieldset class="form-group">
				<form:label path="targetDate">Target Date</form:label> 
				<form:input path="targetDate" type="text" class="form-control" required="required" placeholder="Enter your date in dd/MM/yyyy format"></form:input>
				<form:errors path="targetDate" cssClass="text-warning" />
			</fieldset>
			
			<fieldset class="form-check form-switch">
				<form:label path="done" class="form-check-input">Completed </form:label> 
				<form:checkbox path="done" class="form-check-input" />
				<form:errors path="done" cssClass="text-warning" />
			</fieldset>
			
			<input type="submit" class="btn btn-success" value="Submit" />
		</form:form>
	</div>

	<%@ include file="common/footer.jspf" %>