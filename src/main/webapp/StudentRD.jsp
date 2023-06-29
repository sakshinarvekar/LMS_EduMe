<%-- 
    Document   : StudentRD
    Created on : 29-Jun-2023, 8:10:57 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: rgb(238,247,247);
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 100px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: rgb(8, 135, 175);
            color: white;
        }
        h2 {
            background-color: rgb(232, 108, 58);
            color: white;
            padding: 10px;
        }

        form {
            display: inline;
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
        <li onclick="setActive(this)"><a href="AdminGrid.jsp">Manage Content</a></li>
      <li onclick="setActive(this)"><a href="TeacherRD.jsp">Manage Teachers</a></li>
      <li onclick="setActive(this)"><a href="StudentRD.jsp">Manage Student</a></li>
      <li onclick="setActive(this)"><a href="#">Student Support</a></li>
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
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
        Statement st = con.createStatement();
        String retrievalQuery = "SELECT DISTINCT  username,email,mobile FROM SignUp";
        ResultSet rs = st.executeQuery(retrievalQuery);

        out.print("<table border=1 width=50%");
        out.print("<tr>");
        out.print("<th>Username</th>");
        out.print("<th>Email</th>");
        out.print("<th>Mobile No</th>");
        out.print("<th>Action</th>");
        out.print("</tr>");

        while (rs.next()) {
            String username = rs.getString("username");
            String email = rs.getString("email");
            String mobileno = rs.getString("mobile");

            out.print("<tr>");
            out.print("<td>" + username + "</td>");
            out.print("<td>" + email + "</td>");
            out.print("<td>" + mobileno + "</td>");
            out.print("<td>"
                    + "<form action='' method='post'>"
                    + "<input type='hidden' name='id' value='" + username+ "'>"
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
            String username = request.getParameter("username");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
            String deletionQuery = "DELETE FROM SignUp WHERE username = ?";
            PreparedStatement stmt = con.prepareStatement(deletionQuery);
            stmt.setString(1, username);
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
