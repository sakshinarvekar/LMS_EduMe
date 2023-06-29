<%-- 
    Document   : AdminPanel
    Created on : Jun 28, 2023, 12:27:48 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EduMe Admin Panel</title>
  <style>
    /* CSS for sidebar */
    @import url("https://fontawesome.com/");
    @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
    *{
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
        font-family: 'PT Sans Caption', sans-serif;
    }
    body {
      margin: 0;
      padding: 0;
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
    
    /* CSS for page content */
    h1 {
      color: #333;
    }
    
    .card-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    
    .card {
      flex-basis: calc(33.33% - 20px);
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
    }
    
    .card-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    
    .card-content {
      font-size: 24px;
      margin-left: 200px;
    }
    
    .gifdiv{
        margin-left: 450px;
        
    }
  </style>
  <script>
    // JavaScript for sidebar active item
    function setActive(element) {
      var items = document.getElementsByClassName('active');
      for (var i = 0; i < items.length; i++) {
        items[i].classList.remove('active');
      }
      element.classList.add('active');
    }
  </script>
</head>
<body>
  <div id="sidebar">
      <h2>Hello Admin</h2><br>
    <img src="/LMS_EduMe/img/admin.png" alt="Admin Image">
    <ul>
        <li onclick="setActive(this)"><a href="AdminGrid.jsp">Manage Content</a></li>
      <li onclick="setActive(this)"><a href="#">Manage Teachers</a></li>
      <li onclick="setActive(this)"><a href="#">Manage Student</a></li>
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
     <%! int uniqueUsernames;
         int uniqueTeacher;
         int totalvideo;
     %>
     
  <%
         ///For counting no. of students
      
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(DISTINCT username) AS uniqueUsernames FROM SignUp");
            while(rs.next())
            {
                uniqueUsernames = rs.getInt("uniqueUsernames");
                //out.print("Total unique usernames: " + uniqueUsernames);
            }
            rs.close();
            st.close();
            con.close();
           }
    catch(Exception e)
    {
    out.print(e);
    }
    ///For counting no. of teachers
    try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(DISTINCT username) AS uniqueTeacher FROM Teachers");
            while(rs.next())
            {
                uniqueTeacher = rs.getInt("uniqueTeacher");
               // out.print("Total unique usernames: " + uniqueTeacher);
            }
            rs.close();
            st.close();
            con.close();
           }
    catch(Exception e)
    {
    out.print(e);
    }
         ///For counting no. of videos
    try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT COUNT(DISTINCT chp_name) AS totalvideo FROM content");
            while(rs.next())
            {
                totalvideo = rs.getInt("totalvideo");
                //out.print("Total unique usernames: " + totalvideo);
            }
            rs.close();
            st.close();
            con.close();
           }
    catch(Exception e)
    {
    out.print(e);
    }   

%>
  <div id="content">
    <h1>Welcome to the EduMe Admin Panel</h1>
    
    <div class="card-container">
      <div class="card">
        <h2 class="card-title">Total Students</h2>
        <img src="/LMS_EduMe/img/graduated.png" alt="User Image" style="width: 50px; height: 50px;">
        <h2 class="card-content"><%= uniqueUsernames %></h2>
      </div>
    
      <div class="card">
        <h2 class="card-title">Total Teachers</h2>
        <img src="/LMS_EduMe/img/teacher.png" alt="Teacher Image" style="width: 50px; height: 50px;" >
        <h2 class="card-content"><%= uniqueTeacher%></h2>
      </div>
    
      <div class="card">
        <h2 class="card-title">Total Videos</h2>
        <img src="/LMS_EduMe/img/video-marketing.png" alt="Student Image" style="width: 50px; height: 50px;">
        <h2 class="card-content"><%= totalvideo%></h2>
      </div>
    </div>
  </div>
    <div class="gifdiv">
        <img src="/LMS_EduMe/img/admin.gif" style="border-radius: 40px;">
    </div>
</body>
</html>
