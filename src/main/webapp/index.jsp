<%@ page import="java.time.Instant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<h2>Hello, Embedded Tomcat!!!</h2>
<a href="hello-java">Hello Java Servlet</a><br/>
<a href="hello-xml">Hello Xml Servlet</a>
<p>Here I will write hell. do u mind it!!</p>
<p><%=Instant.now()%></p>
<p><c:out value="${Instant.now()}"/></p>
</body>
</html>
