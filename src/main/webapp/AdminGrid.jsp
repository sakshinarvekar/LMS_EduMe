<%-- 
    Document   : AdminGrid
    Created on : Jun 28, 2023, 2:03:21 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post" >
            Enter Grade : <input type="text" name="t1"><br><!-- comment -->
            Enter Subject : <input type="text" name="t2"><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
<%
    
    try
    {
        String g = request.getParameter("t1");
        String s = request.getParameter("t2");
        if(g!=null)
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");

    Statement st = con.createStatement();

    String sqlQuery = "SELECT * FROM content WHERE grade LIKE ? AND sub LIKE ?";

            PreparedStatement stmt = con.prepareStatement(sqlQuery);
            stmt.setString(1, "%" + g + "%");
            stmt.setString(2, "%" + s + "%");
            ResultSet rs = stmt.executeQuery();
            
            out.print("<table border=1 width=50%");
            out.print("<tr>");
            out.print("<th> Grade </th>");
            out.print("<th> Subject </th>");
            out.print("<th> chapter no </th>");
            out.print("<th> Chapter name </th>");
            out.print("<th> Video </th>");
            out.print("</tr>");
            while (rs.next()) {

                int id = rs.getInt("id");
                g = rs.getString("grade");
                s = rs.getString("sub");
                String c = rs.getString("chp_no");
                String cn = rs.getString("chp_name");
                String v = rs.getString("video");



                out.print("<tr>");
                //out.print("<td>"+i+"</td>");
                out.print("<td>"+g+"</td>");
                out.print("<td>"+s+"</td>");
                out.print("<td>"+c+"</td>");
                out.print("<td>"+cn+"</td>");
                out.print("<td><video controls style=\"height:100px; width:150px;\""
                        + "<source src=/LMS_EduMe/videos/"+v+" type='video/mp4'></video></td>");
                //out.print("<td><input type='submit' value='Edit'>"+ ""+ "</td>");
                //out.print("<td><input type='submit' value='Delete'>" +""+"</td>");
                out.print("<td>"
                                + "<form action='edit.jsp' method='post'>"
                                + "<input type='hidden' name='id' value='" + id + "'>"
                                + "<input type='submit' value='Edit'>"
                                + "</form>"
                                + "<form action='delete.jsp' method='post'>"
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
        }
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>