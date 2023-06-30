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
         <style>
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;
        }
        
        .resource {
            
            background-color: #fff;
            max-width: 480px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            
        }
        
        .dropdown-menu {
            display: none;
            position: absolute;
            min-width: 160px;
            z-index: 1;
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
        }
        
        .dropdown:hover .dropdown-menu {
            display: block;
        }
        
        .dropdown-menu a {
            display: block;
            padding: 10px;
            color: rgb(8, 135, 175);
            text-decoration: none;
        }
        
        .dropdown-menu a:hover {
            background-color: rgb(8, 135, 175);
            color: white;
        }
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            border: 2px solid #ddd;
            
            
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
            min-height: 450px;
        }
        
        label {
            display: block;
            margin-top: 10px;
            margin-left: 70px;
            color: #333;
        }
        textarea {
            height: 80px;
            width: 300px;
            border: 1px solid #ccc;
            padding: 5px;
            margin-left: 70px;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 300px;
            padding: 5px;
            border: 1px solid #ccc;
            margin-left: 70px;
        }
        
        input[type="submit"],
        input[type="reset"],
        input[type="button"] {
            margin-top: 20px;
            background-color: #ff7f50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 70px;
        }
        input[type="submit"]:hover,
        input[type="reset"]:hover,
        input[type="button"]:hover {
            background-color: #ff6347;
            margin-left: 70px;
        }
        .sbtn .button {
          display: inline-block;
          padding: 10px 20px;
        /*  background-color: #4CAF50;*/
          color: #FFFFFF;
          font-size: 16px;
          text-align: center;
          text-decoration: none;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }

        .sbtn.button:hover {
          background-color: #45a049;
        }

        .sbtn .button:active {
          background-color: #3e8e41;
        }
       .nav li,.nav a{
            font-weight: 400;
            font-size: 20px;
            color:rgb(8,135,175);
            text-decoration: none;
            background-color: white;
            padding-top: 15px;
        }
        header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            height: 70px;   
        }

        .nav li{
            display: inline-block;

        }
        .nav a{
            padding: 20px;
        }

        ul :hover {
            background-color: rgb(8,135,175);
            color: white;
        }
            
        .sidebar {
          position:relative;
          top: 250px;
          bottom: 0;
          left: 0;
          box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
          width: 200px;
          height: 600px;
          
        }

        @media (max-width: 991.98px) {
          .sidebar {
            width: 100%;
          }
        }
        .position-sticky a:active{
            color: red;
        }
        .footer{
            display: flex;
            height: 250px;
            width: 100%;
            background-color:rgb(26,54,88);
            bottom: 0px;  

        }
        .footer li, a{
            color: white;
            list-style: none;
            text-decoration: none;
            padding :5px;
        }
        .foot1 , .foot2, .foot3{
            padding: 50px;
            color:white;

        }
        .foot2  a, .foot3 a{
            list-style: none;
            text-decoration: none;
            color: white;
        }
        .foot1 {
            display: inline-block;
            width: 40%;
            margin-left: 50px;
            list-style: none;
            text-decoration: none;

        }
        .foot2{
            display: inline-block;
            width: 30%;
            text-align: center;

        }
        .foot3{
            display: inline-block;
            width: 30%;  
            text-align: center;
        }

        .copyright{
            width: 100%;
            background-color: rgb(26,54,88);
            color: white;
            padding: 5px;
        }
        

        
    </style>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    
  <link href="https://getbootstrap.com/docs/4.0/components/collapse/">
 <div class="main-div">
  <div>
      <header>
        <a href="HomePage.jsp" ><img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px;"></a>
        <nav>
            <ul class="nav">

             
                
                <li><a href="HomePage.jsp">Home</a></li>
                
                <li class="dropdown">
      <a href="http://localhost:8080/LMS_EduMe/HomePage.jsp#wave" class="dropbtn">Grades</a></li>
                <li class="dropdown">
      <a href="TeacherPanel.jsp">Teach On EduMe &#9662;</a>
      
    </li> 
                <li><a href="SignUpnew.html" >SignUp</a></li>
                <li><a href="SignIn.jsp" >SignIn</a></li>
                <%
                 //session = request.getSession();
             String username = (String) session.getAttribute("username");
             if (username!=null)
                          { 
                          %>
                          <li class="dropdown"><a href="#" ><%= username%></a>
                          <ul class="dropdown-menu">
 <%     
String action = request.getParameter("action");
  session.setAttribute("action", action);
    if (action != null && action.equals("logout")) {
        session.invalidate();
        response.sendRedirect("HomePage.jsp");
    }
    %>
                            <li><a href="?action=logout">Logout</a></li>
                        </ul></li>
                          <%
                            }
             %>
            </ul>
        </nav>
    </header>
            <hr style="color: black; margin-top: 15px; width: 100%;">

  <!-- Sidebar -->
  <header>
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
          <%String g = (String) session.getAttribute("Grade");
          %>
          <a href="#" class="list-group-item list-group-item-action py-2 ripple">
             <i class="fas fa-chart-line fa-fw me-3"></i><span><img src="/LMS_EduMe/img/graduating-student.png" width="40px" height="40px" alt="Loginicon"/></span></a
          </a>
          <a href="HomePage.jsp" class="list-group-item list-group-item-action py-2 ripple">
             <i class="fas fa-chart-line fa-fw me-3"></i><span>Home</span></a
          </a>

          <a href="Content.jsp?grade=<%=g%>"  class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-pie fa-fw me-3"></i><span>Syllabus</span>
          </a>
          <a href="PdfRetrieve.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-pie fa-fw me-3"></i><span>Resources</span>
          </a>

          
          <a href="Test.jsp?grade=<%=g%>" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-bar fa-fw me-3"></i><span>Test</span></a>
          <a href="ViewScore.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-globe fa-fw me-3"></i><span>Result</span></a>
          <a href="Profile.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-line fa-fw me-3"></i><span>Your Progress</span></a
          </a>
          <a href="Help.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-calendar fa-fw me-3"></i><span>Help</span></a>
      </div>
    </div>
  </nav>
</header>
             
        <h1 style="margin-left: 620px; color: rgb(232,108,58); ">View Resources</h1>
        <form action="http://localhost:8080/LMS_EduMe/pdfRetrieve" method="post">
            <div class="formdiv">
            <%
            String un = (String)session.getAttribute("username");
    if (un == null) {
    %>
    <script>
        alert("You must be logged in to access this page!");
        window.location.href = "SignIn.jsp"; // Replace with the login page URL
    </script>
    <% } else { %>
            <div class="resource">
                
            Enter grade : <input type="text" name="t1"><br>
            Enter subject : <input type="text" name="t2"><br>
            <input type="submit" name="submit" value="Submit">
            </div>
            </div>
            
            
            <div class="footer">
        <div class="foot1">
            <img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px; border-radius: 25px;"><br><br>
            <h4>Unlock your true potential through the power of education with EduMe</h3>
        </div>
        <div class="foot2">
            <h4>Quick Links</h3><br>
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">About Us</a></li>
                </ul>
        </div>
        <div class="foot3">
            <h4>Socials</h3><br>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Instagram</a></li>
                    <li><a href="#">LinkedIn</a></li>
                </ul>
        </div>
    </div>       
    <div class="copyright">
        <hr>
        <p>© Copyright 2023 | Designed by Sakshi Narvekar and Rupali Vaje</p>
    </div>
        </form>
    </body>
</html>
<% } %>
