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
<%!
        String c,cn,f;  
        
%>           

<%
    String g = (String)session.getAttribute("Grade");
    String s = (String)session.getAttribute("Subject");
//    List storedValue = (List) session.getAttribute("Chap");
    String clicklink = request.getParameter("link");

    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744","sql12627744","aeUIku5cCL");

    Statement st = con.createStatement();

    String query = "SELECT * FROM content WHERE grade = '"+g+"' AND sub = '"+s+"' AND chp_no = '"+clicklink+"' ";

    ResultSet rs = st.executeQuery(query);
    while (rs.next()) {
        int id = rs.getInt("id");
        c = rs.getString("chp_no");
        cn = rs.getString("chp_name");
        f = rs.getString("video");


         out.println("<p> Chapter "+c+" : </a>");
         out.println("<p>"+cn+" </a>");
         out.print("<video controls style=\"height:600px; width:700px;\""
                        + "<source src=/LMS_EduMe/videos/"+f+" type='video/mp4'></video>");
         out.println("<br/>");
    }

    rs.close();
    st.close();
    con.close();
%>                
           
            

 </div>
        </form>
    </body>
</html>
