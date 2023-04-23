import javax.servlet.*;
import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import java.sql.*;

public class Test extends HttpServlet {

    public void init() throws ServletException {}


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try{
            //Import driver for PostgreSQL
            Class.forName("org.postgresql.Driver");
            //Connect to database
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "user");
            //Create statement
            Statement stmt = conn.createStatement();
            //Execute query
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            //Iterate through result set
            out.println("<table border=1>");
            out.println("<tr><th>Name</th><th>Age</th></tr>");
            while(rs.next()){
                String name1 = rs.getString("name");
                int age1 = rs.getInt("age");
                out.println("<tr><td>" + name1 + "</td><td>" + age1 + "</td></tr>");
            }
            //Close connection
            conn.close();
        }catch(Exception e){
           out.println(e);
        }
    }

    public void destroy() {}

    public static void main(String[] args) {
        System.out.println("Hello World!!");
    }

}