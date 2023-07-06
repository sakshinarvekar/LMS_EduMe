<%-- 
    Document   : StudentSupport
    Created on : Jul 1, 2023, 1:32:56 AM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EduMe | Student Support </title>
        <style>
        
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: rgb(238,247,247);
        }
            table {
            border-collapse: separate;
            border-spacing: 0;
            width: 70%;
            border: 2px solid #ddd;
            margin-left: 250px;
            
            
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: rgb(8,135,175);
            color: white;
            
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .formdiv{
           text-align: center;
           
           
        }
        
        #sidebar {
      width: 250px;
      background-color: #333;
      height: 100vh;
      position: fixed;
      left: 0;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
    }
    
    #sidebar a{
        color:white;
        text-decoration: none;
    }
    
    #sidebar img {
      width: 100px;
      margin-bottom: 20px;
    }
    
    #content {
      margin-left: 250px;
      padding: 20px;
    }
     h2 {
            background-color: rgb(232, 108, 58);
            color: white;
            padding: 10px;
        }

        form {
            display: inline;
        }
    
    ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    
    ul li {
      padding: 10px;
      cursor: pointer;
    }
    
    ul li:hover {
      background-color: #555;
    }
    
    .active {
      background-color: #555;
    }
        </style>
    </head>
    <body>
          <div id="sidebar">
      <h2>Hello Admin</h2><br>
    <img src="/LMS_EduMe/img/admin.png" alt="Admin Image">
    <ul>
        <li onclick="setActive(this)"><a href="AdminPanel.jsp">Dashboard</a></li>
        <li onclick="setActive(this)"><a href="AdminGrid.jsp">Manage Content</a></li>
        <li onclick="setActive(this)"><a href="fileup_1.jsp">Upload Content</a></li>
      <li onclick="setActive(this)"><a href="TeacherRD.jsp">Manage Teachers</a></li>
      <li onclick="setActive(this)"><a href="StudentRD.jsp">Manage Student</a></li>
      <li onclick="setActive(this)"><a href="StudentSupport.jsp">Student Support</a></li>
      <li onclick="setActive(this)"><a href="?action=logout">Logout</a></li>
        <% 
    String action = request.getParameter("action");
    if (action != null && action.equals("logout")) 
    {
        response.sendRedirect("HomePage.jsp");
    }
     %>
    </ul>
  </div>
       
        <form>
            
            <div style="formdiv" align="center"><br><br>
                <h2 style="width:300px; margin-left:150px; text-align: center; ">Queries</h2><br><br>
            <%
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * from help");
                        out.print("<table border=1 >");
                        out.print("<tr>");
                        out.print("<th> Username </th>");
                        out.print("<th> Grade </th>");
                        out.print("<th> Query </th>");
                        out.print("</tr>");
                        while (rs.next()) 
                        {
                            int id = rs.getInt("id");
                            String uname = rs.getString("username");
                            String grade = rs.getString("grade");
                            String query = rs.getString("query");

                            
                            out.print("<tr>");
                            out.print("<td>"+uname+"</td>");
                            out.print("<td>"+grade+"</td>");
                            out.print("<td>"+query+"</td>");

                            out.print("</tr>");
                        }
                        out.print("</table>");
         }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
    
    
    

%>
            </div>
        </form>
        
    </body>
</html>
