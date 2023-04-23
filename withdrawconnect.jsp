<%@ page import="java.sql.*" %>

<%
    String name = request.getParameter("name");
    float amount = Float.parseFloat(request.getParameter("amount"));

    try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "user");
        
        Statement stmt = con.createStatement();

        //Check of balance is sufficient for withdrawal 
        String sql = "SELECT balance FROM bankuser WHERE name = '" + name + "'";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        float balance = rs.getFloat("balance");
        if(balance < amount){
            out.println("<h1>Insufficient balance</h1>");
            out.println("<h3>Redirecting to home page ... </h3>");
            response.setHeader("Refresh", "2; URL=user.jsp?name="+name);
            return;
        }

        //sql query to update the amount withdrawn 
        String sql1 = "UPDATE bankuser SET balance = balance - " + amount + " WHERE name = '" + name + "'";
        stmt.executeUpdate(sql1);

        con.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    //display withdraw success message
    out.println("<h1>Withdrawn successful</h1>");
    out.println("<h3>Redirecting to home page ... </h3>");

    //redirect to home page after 2 seconds with name as a parameter 
    response.setHeader("Refresh", "2; URL=user.jsp?name=" + name);
%>


