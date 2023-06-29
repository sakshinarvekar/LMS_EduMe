<%-- 
    Document   : videocontent
    Created on : Jun 23, 2023, 4:40:47 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Video Content</title>
        <style>
            @import url("https://fontawesome.com/");
         @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        /* Button Styles */
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
       
         
       
         *{
            margin: 0px;
            padding: 0px;
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
            
            .sidebar {
          position: relative;
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
        
        .subject-main{
            margin-top: -87px;
            margin-left: 100px;
            background-color: rgb(238,247,247);
            min-height: 800px;
            height:max-content;
            
        }
        
        .subject-container{
            min-height: max-content;
            
            padding-left: 300px;
            padding-right: 200px;
            padding-bottom: 50px;
            padding-top: 50px;
            
        }
        .subject-container h2{
            margin-right: 150px;
            background-color:rgb(3,190,147);
            color: white;
            border-radius: 50px;
        }
        
        .subject-container img,h4{
            text-align: center;
            align-content: center;
            margin:20px 26px;
        }

        .subject-container a{
            text-decoration: none;
            color: rgb(232,108,58);
        }
        .card h4  :hover{
            color:rgb(8,135,175);
        }

        .card h4{
            cursor: pointer;
        }

        .engbanner, .mathbanner, .scibanner{
            display: none; 
            width: 900px; 
            height: 230px; 
            border-radius: 30px; 
            background-size: cover;
            background-position: center;
            margin-top: 50px;
            margin-left: -70px;
        }
        .engbanner{ 
            background-image:url('img/englishbg.png');  
        }
        
        .mathbanner{
            background-image:url('img/mathbg.png'); 
        }
        
        
        .scibanner{ 
            background-image:url('img/sciencebg.png');  
        }
        
        .footer{
            position: relative;
            display: flex;
            height: 250px;
            width: 100%;
            background-color:rgb(26,54,88);
            bottom: 0px; 
            margin-bottom: 0px;

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
        .vidcontent{
            min-height: 600px;
            height: max-content;
            margin-top: 0px;
        }
        .vidcontent h3{
            margin-top: -50px;
        }
        .vidcontent h2{
            font-weight: bold;
        }
        .vidcontent #video{
            margin-top: -50px;
        }
        
        .progress-bar {
            width: 100%;
            height: 20px;
            background-color: #f1f1f1;
            border-radius: 4px;
        }
        
        .progress-bar-fill {
            height: 100%;
            background-color: #4CAF50;
            border-radius: 4px;
            width: 0;
            transition: width 0.2s ease-in-out;
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
            <div class="vidcontent">
                
<%!
        String c,cn,f;  
        
%>           

<%
    //String g = (String)session.getAttribute("Grade");
    String s = (String)session.getAttribute("Subject");
//    List storedValue = (List) session.getAttribute("Chap");
    String clicklink = request.getParameter("link");
    int id = 0;
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");

    Statement st = con.createStatement();

    String query = "SELECT * FROM content WHERE grade = '"+g+"' AND sub = '"+s+"' AND chp_no = '"+clicklink+"' ";

    ResultSet rs = st.executeQuery(query);
    while (rs.next()) {
    
        id = rs.getInt("id");
        c = rs.getString("chp_no");
        cn = rs.getString("chp_name");
        f = rs.getString("video");


         out.println("<center><h3 style='color:rgb(232,108,58)'> Chapter "+c+" : </a></center>");
         out.println("<center><h2 style='color:rgb(8,135,175) '>"+cn+" </a></center>");
         out.print("<center><video id='video' controls ontimeupdate='updateProgressBar()' style=\"height:600px; width:700px; \""
                        + "<source src=/LMS_EduMe/videos/"+f+" type='video/mp4'></video></center>");
//                        out.println("<center><div class='progress-bar'>");
//                        out.println("<div class='progress-bar-fill'></div>");
//                        out.println("</div></center>");
         
         out.println("<br/>");
    }

    rs.close();
    st.close();
    con.close();
%>
<%
   Integer chapname = (Integer) session.getAttribute("chapname");
   if (chapname != null) {
       chapname = 100 / chapname;
   } else {
       chapname = 100 / 5;   // Default value if "chapname" attribute is not set !!!!!! nantr change karuya ha
   }
   %>
    
    <script>
        var video = document.getElementById('video');
        var progressBarFill = document.querySelector('.progress-bar-fill');
        var currentTime = 0;
        var duration = 0;
        var progress = 0;
        var isVideoPlaying = false;
        var updateTimer = null;
        var chapnamelist;
        if (video) {
            video.addEventListener('play', function () {
                isVideoPlaying = true;
                updateTimer = setInterval(updateProgressBar, 1000); // Update progress every second
            });

            video.addEventListener('pause', function () {
                if (isVideoPlaying) {
                    isVideoPlaying = false;
                    clearInterval(updateTimer); // Stop updating progress
                    saveProgressToServer();
                }
            });
        }

        function updateProgressBar() {
            if (video) {
                currentTime = video.currentTime;
                duration = video.duration;
                chapnamelist = <%=chapname%>; 
                progress = (currentTime / duration) * chapnamelist;
                progressBarFill.style.width = progress + '%';
            }
        }

        function saveProgressToServer() {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<%= request.getContextPath()%>/videocontent.jsp?link=<%=request.getParameter("link")%>', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        // Request completed successfully
                        console.log('Progress saved to the server');
                    } else {
                        // Request encountered an error
                        console.error('Error occurred while saving progress');
                    }
                }
            };
            xhr.send('progress=' + progress);
        }
    </script>
 
 </div>

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
         
        </form>
            <%
                String u = (String) session.getAttribute("username");
    String n = request.getParameter("cname");
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Retrieve the progress value from the request parameter
        String progressParam = request.getParameter("progress");
        Double progress = null;
        
        if (progressParam != null && !progressParam.isEmpty()) {
            progress = Double.parseDouble(progressParam);
        }

        // Database connection details
        String jdbcUrl = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246";
        String user = "sql12629246";
        String password = "nSsVYGGiJc";

        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Create a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, user, password);

            // Prepare the SQL statement to insert or update the progress value
            //String sql = "SELECT * FROM content WHERE grade =? AND sub = ? ";
           
//            String sql = "Replace INTO video_progress (chap_id,progress,subject) VALUES (?,?)";
          String sql= "REPLACE INTO video_progress (id, progress, subject, grade, username) Values (?, ?, ?, ?, ?) ";
                              
            stmt = conn.prepareStatement(sql);
            out.print(n);
            if (progress != null) {
                stmt.setInt(1, id);
                stmt.setDouble(2, progress);
                stmt.setString(3, s);
                stmt.setString(4, g); 
                stmt.setString(5,u);
            }
            else {
                // Handle the case when progress is null
                stmt.setNull(1, Types.DOUBLE);
                stmt.setNull(2, Types.DOUBLE);
                stmt.setNull(3, Types.VARCHAR);
                stmt.setNull(4, Types.VARCHAR);
                stmt.setNull(5, Types.VARCHAR);
                
            }

            // Execute the SQL statement
            stmt.executeUpdate();

            // Send a response indicating the progress was saved
            response.getWriter().write("Progress saved successfully");
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Send a response indicating an error occurred
            response.getWriter().write("Error occurred while saving progress");
        } finally {
            // Close the database resources
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
    }
    
%>
    </body>
</html>
