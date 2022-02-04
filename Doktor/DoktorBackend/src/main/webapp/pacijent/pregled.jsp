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
<title>Zakazivanje pregleda</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="sidenav">
		<a href="/Doktor/index.jsp">Moj Doktor</a> 
		<security:authorize access="isAuthenticated()">
			<a href="/Doktor/pacijent/pacijent.jsp">Izmeni podatke</a><!-- DOZVOLE -->
			<a href="/Doktor/lekovi/getSveLekove">Prikazi lekove</a>
			<a href="/Doktor/spec/getSveSpec">Prikazi specijalizacije</a>
			<a href="/Doktor/doktor/getSveDoktore">Prikazi doktore</a>
			<a href="/Doktor/admin/admin.jsp">Dodaj lek ili specijalizaciju</a>

			<a href="/Doktor/auth/logout">Odjava</a>
		</security:authorize>
	</div>

	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">
			
			<form action="/Doktor/pacijent/zakazi" method="post">
				<label for="examination">Unesite datum i vreme za zakazivanje pregleda:</label> 
					<input id="examination" type="datetime-local" name="examinationdate">
					<input type="submit" value="Zakazi">
			</form>

		
		</div>
	</div>
</body>
</html>