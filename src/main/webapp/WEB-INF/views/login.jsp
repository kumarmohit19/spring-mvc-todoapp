<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
	<p>
		<font color="red">${error}</font>
	</p>
	<form method="post" action="/login">
		<fieldset class="form-group">
			<label class="form-label">Enter your email</label>
			<input class="form-control" type="email" name="email" placeholder="Email" value="${requestScope.email}" /> 
		</fieldset>		
		<fieldset class="form-group">
			<label class="form-label">Enter your password</label>
			<input class="form-control" type="password" name="password" placeholder="Password" value="${requestScope.password}" />
		</fieldset>	
			 <input type="submit" class="btn btn-success" value="Submit" />
	</form>
</div>

<%@ include file="common/footer.jspf" %>