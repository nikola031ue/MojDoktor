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
<title>Moj Doktor</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="sidenav">
		<a href="/Doktor/auth/loginPage">Prijavi se</a>
		<a href="/Doktor/pacijent/pacijentPage">Pacijent</a>
		<security:authorize access="isAuthenticated()">
			<a href="/Doktor/pacijent/pacijent.jsp">Izmeni podatke</a><!-- DOZVOLE -->
			<a href="/Doktor/lekovi/getSveLekove">Prikazi lekove</a>
			<a href="/Doktor/spec/getSveSpec">Prikazi specijalizacije</a>
			<a href="/Doktor/doktor/getSveDoktore">Prikazi doktore</a>
			<a href="/Doktor/admin/admin.jsp">Dodaj lek ili specijalizaciju</a>

			<a href="/Doktor/auth/logout">Odjava</a>
		</security:authorize>
	</div>

	<!-- <a href="/Doktor/auth/loginPage">Prijavi se</a>
	<a href="/Doktor/admin.jsp">Dodaj lek ili specijalizaciju</a>
	 -->
	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">
		</div>
	</div>
</body>
</html>