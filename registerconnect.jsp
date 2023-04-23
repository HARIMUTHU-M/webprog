<%@ page import="java.sql.*" %>

<% 
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    float balance = 0;

    try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "user");
        
        String sql = "INSERT INTO bankuser (name, password, balance) VALUES (?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, password);
        pstmt.setFloat(3, balance);
        pstmt.executeUpdate();
        
        con.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    //display user create success message
    out.println("<h1>User created successfully</h1>");
    out.println("<h3>Redirecting to login page ... </h3>");

    //redirect to login page after 5 seconds
    response.setHeader("Refresh", "2; URL=login.jsp");

%>


