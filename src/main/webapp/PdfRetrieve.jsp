<%-- 
    Document   : PdfRetrieve
    Created on : Jun 29, 2023, 12:50:11 AM
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
        <form action="http://localhost:8080/LMS_EduMe/pdfRetrieve" method="post">
            Enter grade : <input type="text" name="t1"><br>
            Enter subject : <input type="text" name="t2"><br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>
<%--
    
    try
    {
        String g = request.getParameter("t1");
        String s = request.getParameter("t2");
        if(g!=null)
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");

    Statement st = con.createStatement();

    String sqlQuery = "SELECT * FROM pdf_files WHERE grade LIKE ? AND subject LIKE ?";

            PreparedStatement stmt = con.prepareStatement(sqlQuery);
            stmt.setString(1, "%" + g + "%");
            stmt.setString(2, "%" + s + "%");
            ResultSet rs = stmt.executeQuery();
            
            out.print("<table border=1 width=50%");
            out.print("<tr>");
            out.print("<th> Grade </th>");
            out.print("<th> Subject </th>");
            out.print("<th> Chapter name </th>");
            out.print("<th> File Name </th>");
            out.print("<th> File  </th>");
            out.print("</tr>");
            while (rs.next()) {

                int id = rs.getInt("id");
                g = rs.getString("grade");
                s = rs.getString("subject");
                String c = rs.getString("chapter_name");
                String fn = rs.getString("file_name");
                String f = rs.getString("file");



                out.print("<tr>");
                out.print("<td>"+g+"</td>");
                out.print("<td>"+s+"</td>");
                out.print("<td>"+c+"</td>");
                out.print("<td>"+fn+"</td>");
                out.print("<td>"+f+"</td>");        
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
--%>