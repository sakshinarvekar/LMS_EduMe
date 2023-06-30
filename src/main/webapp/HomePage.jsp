<%-- 
    Document   : HomeP
    Created on : 22-Jun-2023, 4:30:26 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduMe | Home Page</title>
        <style>
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;
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
        
        .dropdown:hover 
        .dropdown-menu {
            display: block;
          }

        .dropdown-menu {
          
          position: absolute;
          background-color: #f9f9f9;
          padding: 10px;
        }

        .dropdown-menu li {
          margin-bottom: 5px;
        }

        .dropdown-menu a {
          color: black;
          text-decoration: none;
        }

        .left_container h2{
            font-weight: 700;
            font-size: 40px;
            text-decoration: none;


        }
        .left_container h4{
            font-weight: 500;
            font-size: 23px;
        }

        .explore_btn{
            color: white;
            background-color: rgb(232,108,58);
            border-radius: 30px;
            margin-left: 80px;
            text-decoration: none;
            font-weight: 400;
            font-size: 40px;
        }
        .left_container h3 :hover{
            color: white;
            background-color:rgb(8,135,175);
        }

        .container1{
            display: flex;
            align-items: center;
            padding: 50px;
            background-color: white;
            color: rgb(33, 59, 105); 
        }

        .left_container{
            float: left;
        }
        .right_container{
            float: right;
        }

        .container2{

            background-color: rgb(254,248,237);
            height: 550px;
            align-items: center;
            display: block;
        }
        .wave1{
            display: block;
        }

        .container2 h3{
            text-align: center;
            font-weight: 800;
            font-size: 35px;
            color: rgb(33, 59, 105);
        }
        .container2 h5{
            text-align: center;
            font-weight: 600;
            font-size: 30px;
            color: rgb(33, 59, 105);
        }

        .main_con{
            color: rgb(33, 59, 105);
            text-align: center;
            font-weight: 400;
            font-size: 20px;
            align-items: center;
            display: flex;
            padding: 30px 250px;
        }
        .con1,.con2,.con3{
            padding:50px;
        }

        .container3{
            height: 400px;
            align-items: center;
            display: block;
            margin-top: 0;
            background-color: rgb(238,247,247);
        }

        .grade-container{
            margin: 0 200px;

        }
        .grade-container h2{
            color : rgb(232,108,58);
            text-align: center;
            font-weight: 900;
            text-shadow: 1px 1px 1px rgb(224, 157, 68);
        }
        .card {
            display: flex;
            background-color: rgb(254,248,237) ;
        }
        .card  img{
            margin-top: 10px;
            margin-left: 10px;
            display: inline;
        }
        .card h3{
            margin-top: -55px;
            margin-left: 150px;
        }
        .card h3  :hover{
            color:rgb(26,54,88);
        }
        .card a{
            text-decoration: none;
            /* color: rgb(33, 59, 105); */
            color : rgb(232,108,58);
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


          /* Style for the navigation bar */
        nav ul {
          list-style-type: none;
          margin: 0;
          padding: 0;
          background-color: #f1f1f1;
        }

        nav ul li {
          display: inline-block;
        }

        nav ul li a {
          display: block;
          padding: 10px 20px;
          text-decoration: none;
          color: #333;
        }

        /* Style for the dropdown menu */
        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f9f9f9;
          min-width: 160px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        }

        .dropdown-content a {
          color: #333;
          padding: 12px 16px;
          text-decoration: none;
          display: block;
        }

        .dropdown:hover .dropdown-content {
          display: block;
        }


        </style>
    </head>
    <body>
        <form action="" method="post">
    <header>
        <a href="HomePage.jsp" ><img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px;"></a>
        <nav>
            <ul class="nav">

             
                
                <li><a href="HomePage.jsp">Home</a></li>
                
                <li class="dropdown">
      <a href="http://localhost:8080/LMS_EduMe/HomePage.jsp#wave" class="dropbtn">Grades</a></li>
                <li class="dropdown">
      <a href="TeacherLogin.jsp">Teach On EduMe &#9662;</a>
      
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
        response.sendRedirect("/LMS_EduMe-master/HomePage.jsp");
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
    <div class="container1">
        <div class="left_container">
            <h2>When learning starts with EduMe, it never stops</h2><br>
            <h4>Ignite a love for learning that leads to lifelong achievement.
                <br> Discover EduMe’s family and school solutions to engage, excite, and challenge every child.</h4><br><br>
            <h3 style="height: 40px;"><a class="explore_btn" href="#wave"> Explore now </a></h3>
        </div>
        <div class="right_container">
            <video data-v-34ae34ce class="vid" autoplay loop muted style="height:600px; width:700px;">
                <source src="/LMS_EduMe/img/BrainPOP.mp4" type='video/mp4'/>
            </video>
        </div>
    </div>
    <img class="wave1" src="/LMS_EduMe/img/wave.svg" >
    <div class="container2">
        <h3>EduMe is proven to deliver higher achievement <br>and bigger smiles too</h3><br>
        <h5>So many reasons to start</h5>

        <div class="main_con">
            <div class="con1">
                <img src="/LMS_EduMe/img/con1.png" style="height: 100px; width: 100px;"><br>
                <p>We inspire kids to connect deeply to any topic by making it relatable, entertaining, and easy to understand.</p>
            </div>
            <div class="con2">
                <img src="/LMS_EduMe/img/con2.png" style="height: 100px; width: 100px;"><br>
                <p>Research shows that BrainPOP boosts standardized test scores in ELA, Math, and Science</p>
            </div>
            <div class="con3" >
                <img src="/LMS_EduMe/img/con3.png" style="height: 100px; width: 100px;"><br>
                <p>We’ve delivered powerful learning experiences to 6+ million educators and 300+ million students</p>
            </div>
        </div>
    </div>
    <img class="wave1" src="/LMS_EduMe/img/wave.svg" style="transform: rotate(180deg);">
    <img class="wave2" id="wave" src="/LMS_EduMe/img/bluewave.svg">
    <div class="container3"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <div class="grade-container" id="box"    data-aos="fade-up" data-aos-duration="1500">
            <h2>Choose your grade now </h2><br><br>
            <div class="row">
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/number-5.png" style="height: 75px; width: 75px;" alt="">
                        <h3><a href="Content.jsp?grade=5" >Grade 5</a></h3>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/six.png" style="height: 75px; width: 75px;" alt="">
                        <h3 style="color: rgb(26,54,88);"><a href="Content.jsp?grade=6" >Grade 6</a></h3>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/seven.png" style="height: 75px; width: 75px;" alt="">
                        <h3><a href="Content.jsp?grade=7" >Grade 7</a></h3>
                    </div>
                </div>  
            </div>
            <br><br><br>
            <div class="row">
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/number-8.png" style="height: 75px; width: 75px;" alt="">
                        <h3><a href="Content.jsp?grade=8" >Grade 8</a></h3>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/number-9.png" style="height: 75px; width: 75px;" alt="">
                        <h3 style="color: rgb(26,54,88);"><a href="Content.jsp?grade=9" >Grade 9</a></h3>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 100px; width: 300px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="img/number-10.png" style="height: 75px; width: 75px;" alt="">
                        <h3><a href="Content.jsp?grade=10">Grade 10</a></h3>
                    </div>
                </div>
                <br><br><br>
            </div> 
        </div>         
    </div>
    <img class="wave2" src="/LMS_EduMe/img/bluewave.svg" style="transform: rotate(180deg);">
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