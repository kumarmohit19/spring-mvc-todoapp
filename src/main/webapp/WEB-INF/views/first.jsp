<%@ page import="java.util.Date,java.util.List" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>${title}</h2>
	<b>Buddy! This is working from jsp</b>
	<h5>${requestScope.batsmanName}</h5>
	<h5>${param.bestBatsman}</h5>
	<h4>${requestScope.bestBatsmanList}</h4>
	
	<h4>${requestScope.bestBatsmanList[4]}</h4>
	
	<h4>${sessionScope.bestBatsmanCenturiesMap}</h4>
	
	<h4>${sessionScope.bestBatsmanCenturiesMap.Sachin}</h4>
	
	<h4>${sessionScope.bestBatsmanCenturiesMap["Bradman"]}</h4>
	
	
	<p>${header.host}</p>
	
	<p>${paramValues.bestBatsman[0]}</p>
	
	<p>${param.bestBatsman}</p>
	
	
	<%--
	  	implicit variables in JSP:
	  	1. requestScope
	  	2. param
	  	3. sessionScope
	  	4. headerValues
	  	5. header
	  	6. paramValues
	   --%>
	   
	<%--
		out.println("<b>Printing with out.println</b>");
		int i = 5;
		out.println("<br>value of i "+i);
		out.println("<br>"+new Date().toString());
	--%>
	
	<%-- <%= new Date().toString()%>
	<%= i %>
	<%= request.getParameter("parameterName") %> --%>
	<%-- Comment --%>
	<!-- Comment -->
	
	<%-- <c:set var="dummyName" value ="dummyValue" />
	<c:out value="${dummyName}">No Name</c:out> --%>
	 
	 
	 <%-- <c:if test="${dummyName == null }">
	 	Empty
	 </c:if> 
	 --%>
	 
	 <%-- <c:choose>
	 	<c:when test="${dummyName == null }">
	 		Empty
	 	</c:when>
	 	<c:when test="${dummyName == 'dummyValue2' }">
	 		dummy value
	 	</c:when>
	 	<c:otherwise>
	 		Something else
	 	</c:otherwise>
	 </c:choose>
	 
	 <c:forEach var="headerValue" items="${header}">
	 	${headerValue.key}, ${headerValue.value}<br>
	 </c:forEach>
	 --%>
	 
	 
	  <c:set var="amountToBeFormatted" value ="1234561.24518" />
	  ${amountToBeFormatted}
	  <br>
	  Default:	  
	  <fmt:formatNumber value="${amountToBeFormatted}" type="currency"> </fmt:formatNumber>
	  
	  <br>
	  maxIntegerDigits="3":	  
	  <fmt:formatNumber value="${amountToBeFormatted}" type="number" maxIntegerDigits="3"> </fmt:formatNumber>
	  
	  <br>
	  maxFractionDigits="3":	  
	  <fmt:formatNumber value="${amountToBeFormatted}" type="number" maxFractionDigits="3"> </fmt:formatNumber>
	  
	  <br>
	  groupingUsed:"false":	  
	  <fmt:formatNumber value="${amountToBeFormatted}" type="number" groupingUsed="false"> </fmt:formatNumber>
	  
	  <br>
	  Pattern:"###.###E0":	  
	  <fmt:formatNumber value="${amountToBeFormatted}" type="number" pattern="###.###E0"> </fmt:formatNumber>
	  
	  
	  <br>
	  <br>
	  <br>
	  
	  <%-- <fmt:setLocale value="nl_NL"/> --%>
	  
	  <c:set var="today" value ="<%=new java.util.Date() %>" />
	  
	  <br>
	  type:"time":
	  <fmt:formatDate value="${today}" type="time"/>
	  
	  <br>
	  type:"date":
	  <fmt:formatDate value="${today}" type="date"/>
	  
	  <br>
	  type:"both":
	  <fmt:formatDate value="${today}" type="both"/>
	  
	  
	  
	   
	   
	   <!-- JSP - Java Server Pages 
	   		JSTL - JSP Standard Tag Library
	   -->
			  
</body>
</html>