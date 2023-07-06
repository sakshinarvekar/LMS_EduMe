<%-- 
    Document   : TeacherRetrieve
    Created on : 29-Jun-2023, 7:34:06 pm
    Author     : rupal
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
        Statement st = con.createStatement();
        String retrievalQuery = "SELECT DISTINCT id, username, mobile_no, gmail FROM Teachers";
        ResultSet rs = st.executeQuery(retrievalQuery);

        out.print("<table border=1 width=50%");
        out.print("<tr>");
        out.print("<th>id</th>");
        out.print("<th>username</th>");
        out.print("<th>mobile_no</th>");
        out.print("<th>gmail</th>");
        out.print("<th>Action</th>");
        out.print("</tr>");

        while (rs.next()) {
            String id = rs.getString("id");
            String username = rs.getString("username");
            String mobileNo = rs.getString("mobile_no");
            String gmail = rs.getString("gmail");

            out.print("<tr>");
            out.print("<td>" + id + "</td>");
            out.print("<td>" + username + "</td>");
            out.print("<td>" + mobileNo + "</td>");
            out.print("<td>" + gmail + "</td>");
            out.print("<td>"
                    + "<form action='' method='post'>"
                    + "<input type='hidden' name='id' value='" + id + "'>"
                    + "<input type='submit' value='Delete'>"
                    + "</form>"
                    + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");

        rs.close();
        st.close();
        con.close();
    } catch (Exception e) {
        out.print(e);
    }

    if (request.getMethod().equals("POST")) {
        try {
            String id = request.getParameter("id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
            String deletionQuery = "DELETE FROM Teachers WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(deletionQuery);
            stmt.setString(1, id);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Record deleted successfully!");
            } else {
                out.println("Record not found or could not be deleted!");
            }

            stmt.close();
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
    }
%>
</body>
</html>
