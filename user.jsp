<%@ page import="java.sql.*" %>
<% String msg = ""; %>
<% String name = request.getParameter("name"); %>

<%
    try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "user");
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM bankuser WHERE name = '" + name + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()){
            msg = "<h2>Your balance is: " + rs.getFloat("balance") + "</h2>";
        }else{
            msg = "<h2>Balance not found</h2>";
        }
        con.close();
    }catch(Exception e){
        out.println(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
</head>
<body>
    <nav>
        <ul>
            <a href="user.jsp?name=<%= name %>">User Details</a><br>
            <!-- <a href="balance.jsp?name=<%= name %>">View balance</a><br> -->
            <a href="deposit.jsp?name=<%= name %>">Deposit</a><br>
            <a href="withdraw.jsp?name=<%= name %>">Withdraw</a><br>
            <a href="login.jsp">Logout</a>
        </ul>
    </nav>
    <% out.println("<h1>Welcome " + name + "</h1>"); %>
    <% out.println(msg); %>


    
</body>
</html>

