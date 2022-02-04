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
<title>Admin</title>
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
	<br>
	<br>

	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">

			<form action="/Doktor/spec/saveSpec" method="post">
				<table>
					<tr>
						<td>Specijalizacija</td>
						<td><input type="text" name="specijalizacija"
							placeholder="Unesite naziv specijalizacije" required></td>
						<td><input type="submit" value="Sacuvaj specijalizaciju"></td>
					</tr>
				</table>
			</form>
			<br>
			<c:if test="${! empty specijal }">${porukaSpec } id ${specijal.idSpecijalizacija }</c:if>
			<br> <br>
			<form action="/Doktor/lekovi/saveLek" method="post">
				<table>
					<tr>
						<td>Lek</td>
						<td><input type="text" name="lekNaziv"
							placeholder="Unesite naziv leka" required></td>
						<td><input type="submit" value="Sacuvaj lek"></td>
					</tr>
				</table>
			</form>
			<br> <br>
			<c:if test="${! empty lek }">
		${porukaLek } id ${lek.idLek }
	</c:if>
			<c:if test="${showLek}">
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Naziv leka</th>
						<th>Ukloni lek</th>
						<c:forEach items="${sviLekovi }" var="l">
							<tr>
								<td>${l.idLek }</td>
								<td>${l.naziv }</td>
								<td><a href="/Doktor/lekovi/deleteId?idLek=${l.idLek}">Obrisi</a></td>
							</tr>
						</c:forEach>
				</table>
			</c:if>

			<c:if test="${showSpec}">
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Naziv specijalizacije</th>
						<th>Ukloni specijalizaciju</th>
						<c:forEach items="${sveSpecijalizacije }" var="s">
							<tr>
								<td>${s.idSpecijalizacija }</td>
								<td>${s.naziv }</td>
								<td><a
									href="/Doktor/spec/deleteId?idSpecijalizacija=${s.idSpecijalizacija}">NIJE
										NAPRAVLJENO Obrisi</a></td>
							</tr>
						</c:forEach>
				</table>
			</c:if>

			<c:if test="${showDoc}">
				<table border="1">
					<tr>
						<th>ID</th>
						<th>Ime</th>
						<th>Prezime</th>
						<th>Specijalizacija</th>
						<th>Ukloni doktora</th>
						<c:forEach items="${sviDoktori }" var="s">
							<tr>
								<td>${s.idDoktor }</td>
								<td>${s.ime }</td>
								<td>${s.prezime }</td>
								<td>${s.specijalizacija.naziv }</td>
								<td><a
									href="/Doktor/doktor/deleteId?idDoktor=${s.idDoktor}">Obrisi</a></td>
							</tr>
						</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>