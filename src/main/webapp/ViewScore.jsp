<%-- 
    Document   : ViewScore
    Created on : Jun 28, 2023, 9:33:46 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EduMe | View Score</title>
    </head>
    <body>
        <div class="scorediv">
            <form method="post" action="">
                <h3>Your Scores : </h3>
                <%
                    String u = (String)session.getAttribute("username");
                    String g = (String)session.getAttribute("grade");
                    String s = (String)session.getAttribute("selectedsub");
                    String c = (String)session.getAttribute("selectedChapter");
                    
                    try
                    {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                        Statement st = con.createStatement();
                       
                        ResultSet rs = st.executeQuery("Select * from score where username='"+u+"'  ");
                        

                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                %>
            </form>
        </div>
    </body>
</html>
