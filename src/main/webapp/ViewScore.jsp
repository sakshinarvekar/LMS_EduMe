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
        <style>
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            border: 2px solid #ddd;
            border-radius: 8px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .scorediv {
            width: 500px;
            margin: 20px auto;
        }
        h3 {
            text-align: center;
        }
    </style>
        </style>
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
                       
                        ResultSet rs = st.executeQuery("SELECT * FROM result WHERE username = '"+u+"' ORDER BY date DESC;");
                        out.print("<table border=1 >");
                        out.print("<tr>");
                        out.print("<th> Grade </th>");
                        out.print("<th> Subject </th>");
                        out.print("<th> Chapter Name </th>");
                        out.print("<th> Your score </th>");
                        out.print("<th> Date and Time </th>");
                        out.print("</tr>");
                        while (rs.next()) 
                        {
                            int id = rs.getInt("id");
                            String username = rs.getString("username");
                            String grade = rs.getString("grade");
                            String subject = rs.getString("sub");
                            String chp_name = rs.getString("chp_name");
                            int score = rs.getInt("score");
                            Timestamp date = rs.getTimestamp("date"); 
                            
                            out.print("<tr>");
                            out.print("<td>"+grade+"</td>");
                            out.print("<td>"+subject+"</td>");
                            out.print("<td>"+chp_name+"</td>");
                            out.print("<td>"+score+"</td>");
                            out.print("<td>"+date+"</td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
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
