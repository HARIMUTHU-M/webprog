<%@ page import="java.sql.*" %>
<% 
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "user");
        
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM bankuser WHERE name = '" + name + "' AND password = '" + password + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()){
            //display user login success message
            out.println("<h1>Login successful</h1>");
            out.println("<h3>Redirecting to home page ... </h3>");
            //Direct to home page along with user name after 2 seconds
            response.setHeader("Refresh", "2; URL=user.jsp?name=" + name);

        }else{
            //display user login failed message
            out.println("<h1>Login failed</h1>");
            response.setHeader("Refresh", "2; URL=login.jsp");
        }
        
        con.close();
    }catch(Exception e){
        out.println("Login failed..");
        //Redirect to login page after 5 seconds
        response.setHeader("Refresh", "2; URL=login.jsp");
    }
%>