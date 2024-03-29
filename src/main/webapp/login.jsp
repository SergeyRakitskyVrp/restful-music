<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<c:url value="/main.css"/>" rel="stylesheet" type="text/css" />
<title>Restful Music</title>
</head>
<body>
		<div id="content" align="center">
			<c:if test="${not empty param.authentication_error}">
				<h1>Woops!</h1>
				<p class="error">Your login attempt was not successful.</p>
			</c:if>
			<c:if test="${not empty param.authorization_error}">
				<h1>Woops!</h1>

				<p class="error">You are not permitted to access that resource.</p>
			</c:if>

			<h1>Login</h1>
			<p align="center">Restful Music has one account:</p>
			<p> username "user" with password "user".</p>
			<form action="<c:url value="/login.do"/>" method="post">
				<p>
					<label>Username: <input type='text' name='j_username'
						value="user"/></label>
				</p>
				<p>
					<label>Password: <input type='text' name='j_password'
						value="user"/></label>
				</p>

				<p>
					<input name="login" value="Login" type="submit"/>
				</p>
			</form>
		</div>
		
</body>
</html>