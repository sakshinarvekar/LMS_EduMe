<%-- 
    Document   : videocontent
    Created on : Jun 23, 2023, 4:40:47 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Video Content</title>
    </head>
    <body>
        <form action="" method="post">
            <div class="vidcontent">
                <h1>In video content  div</h1>
                <a href="videocontent.jsp?grade=<%=request.getParameter("grade")%>&sub=<%=request.getParameter("sub")%>&chp_name=<%=request.getParameter("chp_name")%> ">Click Here</a>
<%!
        String c,cn,f;  
        
%>           

<%
    List storedValue = (List) session.getAttribute("Chap");
    out.println("Stored Value: " + storedValue);
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744","sql12627744","aeUIku5cCL");
           

//     String selectedClass = request.getParameter("sub");
//     String selectedGrade = request.getParameter("grade");
     String selectedChap = request.getParameter("chp_name");
     
     
    //String sql = "SELECT * FROM content WHERE grade =? AND sub = ? AND chp_name = ? ";
    String sql = "SELECT * FROM content WHERE chp_name = ? ";
    PreparedStatement statement = con.prepareStatement(sql);
//    statement.setString(1,selectedGrade);
//    statement.setString(2,selectedClass);
    statement.setString(1,selectedChap);

    ResultSet rs = statement.executeQuery();

    while (rs.next()) {
        int id = rs.getInt("id");
         c = rs.getString("chp_no");
         cn = rs.getString("chp_name");
         f = rs.getString("video");


         out.println("<a href='videocontent.jsp?'> Chapter "+c+" : </a>");
         out.println("<a href='videocontent.jsp?'>"+cn+" </a>");
         out.print("<video controls style=\"height:600px; width:700px;\""
                        + "<source src=/LMS_EduMe/videos/"+f+" type='video/mp4'></video>");
         out.println("<br/>");
    }

    rs.close();
    statement.close();
    con.close();
%>                
           
            

 </div>
        </form>
    </body>
</html>
