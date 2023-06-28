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
        <%!
            String g, s, c, cn, v, id;
        %>
        <%
            try {
                id = request.getParameter("id");
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                Statement st = con.createStatement();
                String sqlQuery = "SELECT * FROM content WHERE id = ?";
                PreparedStatement stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, id);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    g = rs.getString("grade");
                    s = rs.getString("sub");
                    c = rs.getString("chp_no");
                    cn = rs.getString("chp_name");
                    v = rs.getString("video");
                    out.print(id);
                    %>
                    <form action="edit.jsp" method="post">
                        <input type="hidden" name="id" value="<%= id %>">
                        Grade: <input type="text" name="grade" value="<%= g %>"><br>
                        Subject: <input type="text" name="subject" value="<%= s %>"><br>
                        Chapter No: <input type="text" name="chapterNo" value="<%= c %>"><br>
                        Chapter Name: <input type="text" name="chapterName" value="<%= cn %>"><br>
                        Video: <input type="text" name="video" value="<%= v %>"><br>
                        <input type="submit" value="Update">
                    </form>
                    <%
                } else {
                    out.println("Record not found!");
                }

                rs.close();
                st.close();
                con.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>

        <%
            if (request.getMethod().equals("POST")) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                    Statement st = con.createStatement();
                    st.execute("UPDATE content SET grade= '" + request.getParameter("grade") + "', sub= '" + request.getParameter("subject") + "', chp_no= '" + request.getParameter("chapterNo") + "', chp_name= '" + request.getParameter("chapterName") + "', video= '" + request.getParameter("video") + "' WHERE id = '" + id + "'");
                    out.print("Record updated successfully");
                    st.close();
                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
