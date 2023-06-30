<%--
    Document   : ProgressBar
    Created on : 28-Jun-2023, 6:53:54 pm
    Author     : rupal
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <style>
        
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
/*        progress bar start*/
/*        .progress-bar {
            width: 70%;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            height: 30px;
        }
        .progress-bar-fill {
            height: 100%;
            background-color: #4caf50;
        }
        .progress-bar-text {
            text-align: center;
            line-height: 30px;
            color: #000;
            font-weight: bold;
        }*/
/*        end*/
/*body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;*/
/*    margin-left: 200px;
    padding: 0;*/


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

h1, p {
    text-align: center;
}

    </style>
</head>
<body>
      <form action="" method="post">
          
        
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">    
  <link href="https://getbootstrap.com/docs/4.0/components/collapse/">
 <div class="main-div">
  <div>
      <header>
        <a href="homepage.html" ><img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px;"></a>
        <nav>
            <ul class="nav">

                <li><a href="homepage.html" >Home</a></li>
                <li><a href="#wave" >Grades</li>
                <li class="dropdown">
                    <a href="#">Teach On EduMe &#9662;</a>
                    <ul class="dropdown-menu">
                        <li><a href="TeacherLogin.jsp">SignIn</a></li>
                        <li><a href="TeacherRegister.jsp">SignUp</a></li>
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
      </header><hr style="color: black; margin-top: 15px; width: 100%;">
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

    <% 
    String user = (String) session.getAttribute("username");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
        Statement st = con.createStatement();
        //ResultSet rs = st.executeQuery("SELECT subject, SUM(progress) AS total_progress FROM video_progress WHERE username = '" + user + "' GROUP BY subject");
            ResultSet rs = st.executeQuery("SELECT subject, ROUND(SUM(progress), 2) AS total_progress FROM video_progress WHERE username = '"+user+"' GROUP BY subject");
        while (rs.next()) {
            double progress = rs.getDouble("total_progress");
            String subject = rs.getString("subject");

            // Calculate the progress percentage
            int progressPercentage = (int) (progress);

            // Display progress bar and text
            out.print("<p>" + subject + "</p>");
            out.print("<div class='progress-div'>");
            out.print("<div class='progress-bar'>");
            out.print("<div class='progress-bar-fill' style='width: " + progressPercentage + "%'></div>");
            out.print("<div class='progress-bar-text'>" + progressPercentage + "%</div>");
            out.print("</div>");
            out.print("</div>");
        }

        st.close();
        con.close();
    } catch (Exception e) {
        out.print(e);
    }
    %>
      </form>
</body>
</html>
