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
<title>Registrujte se</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#chosen").on('change', function() {

			$opt = $("#opt");
			$(this).val() == '2' ? $opt.show() : $opt.hide();
		});
	});
</script>
</head>
<body>
	<div class="sidenav">
	<a href="/Doktor/index.jsp">Moj Doktor</a>
		<security:authorize access="isAuthenticated()">
			<a href="/Doktor/auth/logout">Odjava</a>
		</security:authorize>
	</div>
	<div class="main">
		<div class="center" style="font-size: 20px; text-align: center;">
			<!-- /auth/register ??????????????????????-->
			<form action="register" method="POST">
				<table>
					<tr>
						<td>Ime</td>
						<td><input type="text" name="ime" placeholder="Unesite ime"
							required></td>
					</tr>
					<tr>
						<td>Prezime</td>
						<td><input type="text" name="prezime"
							placeholder="Unesite Prezime" required></td>
					</tr>
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
						<td>Uloga</td>
						<td><select name="idUloga" id="chosen">
								<c:forEach items="${uloge}" var="u">
									<option value="${u.idUloga}">${u.naziv}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr id="opt">
						<td>Specijalizacija</td>
						<td><select name="idSpecijalizacija">
								<c:forEach items="${specijalizacije}" var="s">
									<option value="${s.idSpecijalizacija}">${s.naziv}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<!-- <td><input type="hidden" name="username" placeholder="Unesite korisnicko ime" required></td> -->
						<td><input type="submit" value="Registruj se"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>