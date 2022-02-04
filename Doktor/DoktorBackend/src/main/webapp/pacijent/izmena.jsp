<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="sidenav">
		<a href="/Doktor/index.jsp">Moj Doktor</a> 
		<a href="/Doktor/lekovi/getSveLekove">Prikazi lekove</a> <!-- DOZVOLE --> 
		<a href="/Doktor/spec/getSveSpec">Prikazi specijalizacije</a> <!-- DOZVOLE -->
		<a href="/Doktor/doktor/getSveDoktore">Prikazi doktore</a> <!-- DOZVOLE -->
		<security:authorize access="isAuthenticated()">
			<a href="/Doktor/auth/logout">Odjava</a>
		</security:authorize>
	</div>

	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">
			<!-- TREBA NAM id IZ LOGOVANJA DA U placeholder unesemo prethodno npr. -->
		</div>
	</div>
</body>
</html>