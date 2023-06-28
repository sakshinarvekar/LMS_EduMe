<%-- 
    Document   : edit
    Created on : Jun 28, 2023, 4:31:39 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <h2>Edit Record</h2>
        <%
            try {
                String id = request.getParameter("id");
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                Statement st = con.createStatement();
                String sqlQuery = "SELECT * FROM content WHERE id = ?";
                PreparedStatement stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String grade = rs.getString("grade");
                    String subject = rs.getString("sub");
                    String chapterNo = rs.getString("chp_no");
                    String chapterName = rs.getString("chp_name");
                    String video = rs.getString("video");

                    %>
                    <form action="edit.jsp" method="post">
                        <input type="hidden" name="id" value="<%= id %>">
                        Grade: <input type="text" name="grade" value="<%= grade %>"><br>
                        Subject: <input type="text" name="subject" value="<%= subject %>"><br>
                        Chapter No: <input type="text" name="chapterNo" value="<%= chapterNo %>"><br>
                        Chapter Name: <input type="text" name="chapterName" value="<%= chapterName %>"><br>
                        Video: <input type="text" name="video" value="<%= video %>"><br>
                        <input type="submit" value="Update">
                    </form>
                    <%
                        if (request.getMethod().equals("POST")) {
            // Retrieve the form values
            

            // Define the connection parameters
            String url = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246";
            String username = "sql12629246";
            String password = "nSsVYGGiJc";

            // Declare the connection object
            Connection conn = null;

           // try {
                // Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Create the connection
                conn = DriverManager.getConnection(url, username, password);

                // Perform the update operation
                String updateQuery = "UPDATE your_table SET column1 = ?, column2 = ? WHERE id = ?";
                //st.execute("update user set name= '"+name+"' where id = '"+id+"'  ");
                //PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
               // updateStmt.setString(1, columnName1);
                //updateStmt.setString(2, columnName2);
                //updateStmt.setInt(3, id);

               // int rowsAffected = updateStmt.executeUpdate();

                // Check the number of rows affected
               // if (rowsAffected > 0) {
                    out.println("Update successful!");
              //  } else {
                    out.println("Update failed!");
                }
               // } else {
                    out.println("Record not found!");
                }

                rs.close();
                st.close();
                con.close();
          //  } catch (Exception e) {
          //      out.print(e);
            }
        %>
    </body>
</html>
