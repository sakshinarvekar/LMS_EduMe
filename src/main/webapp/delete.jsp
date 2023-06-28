<%-- 
    Document   : delete
    Created on : Jun 28, 2023, 4:33:30 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <h2>Delete Record</h2>
        <%
            try {
                String id = request.getParameter("id");
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                Statement st = con.createStatement();
                String sqlQuery = "DELETE FROM content WHERE id = ?";
                PreparedStatement stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, id);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Record deleted successfully!");
                } else {
                    out.println("Record not found or could not be deleted!");
                }

                st.close();
                con.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

