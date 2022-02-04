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
<title>Prijava</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="sidenav">
	<a href="/Doktor/index.jsp">Moj Doktor</a>
		<security:authorize access="isAuthenticated()">
			<a href="/Doktor/auth/logout">Odjava</a>
		</security:authorize>
	</div>

	<c:url var="loginUrl" value="/auth/login" />
	<c:if test="${not empty param.error }">
		<div class="alert alert-danger">
			<p>Pogresni podaci.</p>
		</div>
	</c:if>
	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">
			<form action="${loginUrl}" method="POST" accept-charset="utf-8">
				<table>
					<tr>
						<td>Korisnicko ime</td>
						<td><input type="text" name="username"
							placeholder="Unesite korisnicko ime" required></td>
					</tr>
					<tr>
						<td>Sifra</td>
						<td><input type="password" name="password"
							placeholder="Unesite sifru" required></td>
					</tr>
					<tr>
						<td>Zapamti me:</td>
						<td><input type="checkbox" name="remember-me"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Prijava"></td>
					</tr>
					<tr>
						
					</tr>
				</table>
				<br>
				<br> Nemate nalog? <a href="/Doktor/auth/registerUser">Registrujte
					se</a>
			</form>
		</div>
	</div>
</body>
</html>