<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    <h1>Register</h1>
    <form action="registerconnect.jsp" method="post">
        <label for="name">Name</label>
        <input type="text" name="name" id="name" />
        <label for="password">Password</label>
        <input type="password" name="password" id="password" />
        <input type="submit" value="Register" />
    </form>
</body>
</html>

