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
<title>Pacijent</title>
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
			
			<!-- UNETI NEKI TEKST KAO UPUTSTVO ZA KORISCENJE I ISPIS PODATAKA ZA PACIJENTA -->
			
			<form action="/Doktor/pacijent/izlistajDoktore" method="get">
			<table>
				<tr>
					<td>Izaberi specijalizaciju</td>
					<td><select name="idSpecijalizacija">
							<c:forEach items="${specijalizacije}" var="sp">
								<option value="${sp.idSpecijalizacija}">${sp.naziv}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="Izaberi specijalizaciju"  /></td>
				</tr>
			</table>
			</form>
			<br><br>
			<c:if test="${! empty doktori }">
				<table border="1">
						<th>Ime doktora</th>
						<th>Prezime doktora</th>
						<th>Zakazivanje</th>
						<c:forEach items="${doktori }" var="d">
							<tr>
								<td>${d.ime }</td>
								<td>${d.prezime }</td>
								<td><a href="/Doktor/pacijent/pregled.jsp?idDoktor=${d.idDoktor}">Zakazi pregled</a></td>
							</tr>
						</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>