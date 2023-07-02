
<%@page import="com.twilio.rest.chat.v1.service.User"%>
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
        @import url("https://fontawesome.com/");
            @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
            *{
                margin: 0px;
                padding: 0px;
                box-sizing: border-box;
                font-family: 'PT Sans Caption', sans-serif;
            }
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
    .progress-bar {
    position: relative;
    width: 70%;
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    height: 30px;
}
.progress-div{
    margin-left: 300px;
}
.progress-bar-fill {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    background-color: #4caf50;
}

.progress-bar-text {
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    line-height: 30px;
    color: #000;
    font-weight: bold;
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
     <div class="form-div">
         <h2 style="width:300px; margin-left:70px; text-align: center; margin-top: 100px;">Manage Students</h2>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
    Statement st = con.createStatement();
    String retrievalQuery = "SELECT DISTINCT username, email, mobile FROM SignUp";
    ResultSet rs = st.executeQuery(retrievalQuery);

    out.print("<table border=1 width=50%");
    out.print("<tr>");
    out.print("<th>Username</th>");
    out.print("<th>Email</th>");
    out.print("<th>Mobile No</th>");
    out.print("<th>Action</th>");
    out.print("<th>View Progress</th>");
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
                + "<input type='hidden' name='username' value='" + username + "'>"
                + "<input type='submit' name='delete' value='Delete'>"
                + "</form>"
                + "</td>");
        out.print("<td>"
                + "<form action='' method='post'>"
                + "<input type='hidden' name='username' value='" + username + "'>"
                + "<input type='submit' value='View Progress'>"
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

if (request.getMethod().equals("POST")&& request.getParameter("delete") != null) {
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

if (request.getMethod().equals("POST")) {
    try {
        String username = request.getParameter("username");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
        PreparedStatement ps = con.prepareStatement("SELECT subject, ROUND(SUM(progress), 2) AS total_progress FROM video_progress WHERE username = ? GROUP BY subject");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
     
        boolean hasRecords = false; // Flag to check if progress records are found

        while (rs.next()) {
            double progress = rs.getDouble("total_progress");
            String subject = rs.getString("subject");

            // Calculate the progress percentage
            int progressPercentage = (int) progress;

            // Display progress bar and text
            
            out.print("</br>");
            out.print("</br>");
            out.print("<p>" + subject + "</p>");
            out.print("<div class='progress-div'>");
            out.print("<div class='progress-bar'>");
            out.print("<div class='progress-bar-fill' style='width: " + progressPercentage + "%'></div>");
            out.print("<div class='progress-bar-text'>" + progressPercentage + "%</div>");
            out.print("</div>");
            out.print("</div>");
            hasRecords = true;
            
            }

            if (!hasRecords) {
                out.print("<p>No progress records found.</p>");
            }
        

        con.close();
        ps.close();
    } catch (Exception e) {
        // Handle the exception appropriately (e.g., logging, error response, etc.)
        e.printStackTrace();
    }
}
%>

     </div>
     </body>
</html>
