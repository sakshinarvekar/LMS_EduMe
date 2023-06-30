<%-- 
    Document   : Help
    Created on : 28-Jun-2023, 11:28:06 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Help Form</title>
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
            background-color:rgb(238,247,247);
;
        }
        .main{
            margin-left: 100px;
            background-color:rgb(238,247,247);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }

        .container {
            
            margin: 0 auto;
            background-color: rgb(254,248,237);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            margin-bottom: 100px;
        }
        .container h2{
            margin-left: 150px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 3px;
        }
        

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group input[type="submit"]:active {
            background-color: #3e8e41;
        }
    
        .progress-bar {
            width: 70%;
            background-color: #f1f1f1;
            border: 1px solid #ccc;

            height: 40px;
            height: 30px;
            margin-left: 200px;
            
            

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
          position:absolute;
          top: 87px;
          bottom: 0;
          left: 0;
          box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
          width: 200px;
          height: 800px;
          
        }

        @media (max-width: 991.98px) {
          .sidebar {
            width: 100%;
          }
        }
        .position-sticky a:active{
            color: red;
        }
        /*      start dropdownlist for teanch onedume
        */
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
        
        .footer{
            position: relative;
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
        
        .profilediv{
            margin-top: -85px;
            margin-left: 200px;
            text-align: center;
            min-height: 600px;
            height:max-content;
            background-color:rgb(238,247,247);
            padding-top: 50px;
        }
        
        .profilediv h2{
            background-color: rgb(8,135,175); 
            color:white; 
            border-radius: 30px; 
            width: 300px; 
            margin-left: 400px;
            padding:10px;
            
            
        }
  </style>
</head>
<body>
  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    
  <link href="https://getbootstrap.com/docs/4.0/components/collapse/">
            <div>
        <header class="head">
        <a href="homepage.html" ><img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px;"></a>
        <nav>
            <ul class="nav">
                <li><a href="homepage.html" >Home</a></li>
                <li><a href="#wave" >Grades</li>
                <li class="dropdown">
                        <a href="#">Teach On EduMe &#9662;</a>
                        <ul class="dropdown-menu">
                            <li><a href="TeacherLogin.jsp">Sign In</a></li>
                            <li><a href="TeacherLogout.jsp">Sign Out</a></li>
                        </ul>
                    </li> 
                <li><a href="SignUpnew.html" >SignUp</a></li>
                <li><a href="sign.html" >SignIn</a></li>
                    <%
                        //session = request.getSession();
                        String username = (String) session.getAttribute("username");
                        if (username != null) {
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
      </header><hr style="color: black; margin-top: 15px; ">
      </div>
            <!-- Sidebar -->
  <header>
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
          <a href="#" class="list-group-item list-group-item-action py-2 ripple"
             ><i class="fas fa-chart-line fa-fw me-3"></i><span><img src="/LMS_EduMe/img/con2.png" width="40px" height="40px" alt="Loginicon"/></span></a
        </a>
        <a href="HomePage.jsp" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-line fa-fw me-3"></i><span>Home</span></a
        </a>
        <a href="Profile.jsp" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-line fa-fw me-3"></i><span>User Profile</span></a
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>Resources</span>
        </a>
        <%String g = (String)session.getAttribute("Grade");
        %>
        <a href="Test.jsp?grade=<%=g%>" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-bar fa-fw me-3"></i><span>Test</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-globe fa-fw me-3"></i><span>Result</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-calendar fa-fw me-3"></i><span>Help</span></a
        >
        
      </div>
    </div>
  </nav>
</header>
          
          <div class="container" style="width:500px; ">
    <h2>Help Form</h2>
    <form action="submit-help-form.php" method="post">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>
      </div>
        <div class="form-group">
        <label for="query">Query:</label>
        <textarea id="query" name="query" required></textarea>
      </div>
      <div class="form-group">
        <input type="submit" value="Submit" style="margin-left: 180px;">
        </div>
          </div>
      
    </form>
    <div>
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
        </div>
 
</body>
</html>
