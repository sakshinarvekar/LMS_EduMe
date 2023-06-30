<%-- 
    Document   : Test
    Created on : Jun 24, 2023, 1:07:26 PM
    Author     : bhaktisunilnarvekar
--%>
<%@page import="java.util.*"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
          @import url("https://fontawesome.com/");
         @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
       
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
            .chapter {
            color: #08578F;
            font-size: 24px;
            font-weight: bold;
        }

        .chapter-link {
            color: #087DAF;
            font-size: 22px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .chapter-link:hover {
            color: #ff6347;
        }
        .contentlist{
            margin-top: 50px;
            margin-left: 150px;
            background-color: white;
            width:500px;
            height:max-content;
            text-align: center;
            border-radius: 30px;
            box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
            
        .hidden-score {
        display: none;
    }
        }
        .drophead{
            margin-right: 250px;
        }
        .drophead h2{
            
            margin-top : 30px;
            color:rgb(232,108,58);
        }
        
        .quizdropdown{
            min-height: 600px;
            text-align: center;
            margin-left: 350px;
        }
        
        .quizdropdown h1{
            background-color:rgb(3,190,147);
            color: white;
            width:400px;
            border-radius: 50px;
            margin-left: 220px;
            margin-bottom: 30px;
           
        }
        .quizdropdown h3{
            color:rgb(26,54,88);
            
        }
        
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: rgb(3,190,147);
            color: #FFFFFF;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 350px;
          }

          .button:hover {
            background-color: #45a049;
          }

          .button:active {
            background-color: #3e8e41;
          }
          #video-container {
            width: 640px;
            height: 480px;
            border: 1px solid #ccc;
        }
/*        teachonedume dropdownlist css start*/
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
        
        .abc{
            background-color:rgb(238,247,247);
            margin-top: -87px;
     
        }
/*        end*/
        </style>
        <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-peer/simplepeer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
            
    </head>
    <body>
        
        <form id="testForm" action="" method="post">
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
                <li><a href="#wave" >Grades</li>
                <li class="dropdown">
                        <a href="TeacherPanel.jsp">Teach On EduMe &#9662;</a>
                        
                    </li> 
                <li><a href="SignUpnew.html" >SignUp</a></li>
                <li><a href="sign.html" >SignIn</a></li>
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
      </header><hr style="color: black; margin-top: 15px; width: 100%;">
      </div>
            
  <!-- Sidebar -->
  <header>
  <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
          <a href="#" class="list-group-item list-group-item-action py-2 ripple">
             <i class="fas fa-chart-line fa-fw me-3"></i><span><img src="/LMS_EduMe/img/graduating-student.png" width="40px" height="40px" alt="Loginicon"/></span></a
          </a>
          <a href="HomePage.jsp" class="list-group-item list-group-item-action py-2 ripple">
             <i class="fas fa-chart-line fa-fw me-3"></i><span>Home</span></a
          </a>

          <a href="Content.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-pie fa-fw me-3"></i><span>Syllabus</span>
          </a>
          <a href="PdfRetrieve.jsp" class="list-group-item list-group-item-action py-2 ripple">
              <i class="fas fa-chart-pie fa-fw me-3"></i><span>Resources</span>
          </a>

          <%String g = (String) session.getAttribute("Grade");
          %>
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
          <%
            String un = (String)session.getAttribute("username");
    if (un == null) {
    %>
    <script>
        alert("You must be logged in to access this page!");
        window.location.href = "SignIn.jsp"; // Replace with the login page URL
    </script>
    <% } else { %>
    
    
          <div class="abc" >
            <div class="quizdropdown">
<!--                <center>-->
<br><br>
                    <h1>Apply Filter : </h1>
                    <div class="drophead">
                    <select class="form-control1" name="subject"  onchange="this.form.submit()" style="width:250px; height: 40px;">
                        <option value=""<% if ("".equals(session.getAttribute("selectedsub"))) out.print("selected"); %> >Select Subject</option>
                        <%
                            String g = (String) session.getAttribute("Grade");
                            //out.print(g);
                            
                            String selectedSubject = request.getParameter("subject");
                            
                            session.setAttribute("selectedsub", selectedSubject);

                            try {
                                String query = "select distinct sub from content";
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                String subject = rs.getString("sub");
//                                    out.print(subject);
//                                    
%>
           <%-- if ("subject".equals(request.getParameter("subject"))) out.print("selected"); --%>
                       <option value="<%=subject%>"<% if (subject.equals(request.getParameter("subject"))) { %>selected="selected"<% } %>><%= subject%></option>        
                        <%                          }
                                rs.close();
                                st.close();
                                con.close();
                            } catch (Exception e) {
                                out.print(e);
                            }


                        %>
                    </select>

                    <select class="form-control2" name="chapters"  onchange="this.form.submit()"  style="width:250px; height: 40px;">
                        <option  value="">Select Chapter</option><br><br>
                        
                        <%
                            String selectedChapter = request.getParameter("chapters");                            
                            String s = (String)session.getAttribute("selectedsub");
                            session.setAttribute("selectedChapter", selectedChapter);
                            String c = (String)session.getAttribute("selectedChapter");

                            try {
                                String query = "select chp_name from content where grade='"+g+"' AND sub='"+selectedSubject+"'";
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String chaptername = rs.getString("chp_name");
                                    //out.print(chaptername);                                    
%>
                        <option value="<%= chaptername %>" <% if (chaptername.equals(request.getParameter("chapters"))) { %>selected="selected"<% } %>><%= chaptername %></option>
                        
                        <%
                                }
                                rs.close();
                                st.close();
                                con.close();
                            } catch (Exception e) {
                                out.print(e);
                            }
                        %>
                    </select><br> 
                   
    <%
    //String selectedChapter = request.getParameter("chapters");
    //String selectedSub = request.getParameter("subject");
    
    //out.print("<h4>"+"Selected Subject: " + s + "</h4>");
    //out.print("<h4>"+"Selected Chapter: " + selectedChapter+"</h4><br>");
    //out.print("<br>");
%>
</div>
<!--<button onclick="enableScriptlet()">Take a Test</button>-->
<!--<button id="myButton" l onclick="enableScriptlet()" <%= request.getParameter("disabled") != null ? "disabled" : "" %>>Take a Test</button>-->
<!--<div id="scriptletCode" style="display: none;">-->
<!--<div id="scriptletCode" style="<%= request.getParameter("disabled") != null ? "display:block;" : "display:none;" %>">-->
<%! int score = 0;

%>
    <%
    
    try{
            //String Query="select * from quiz where sub='"+s+"' AND chp_name='"+selectedChapter+"' ";
            String Query = "SELECT * FROM quiz WHERE sub = '" + s + "' AND chp_name = '" + selectedChapter + "' ORDER BY RAND() LIMIT 5";
 
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(Query);
            int count = 1;
            
            
            List<String> answer = new ArrayList<>();
            List<String> selectedans = new ArrayList<>();
            while(rs.next())
            {
             int id = rs.getInt("id");
             String q = rs.getString("question");
             String o1 = rs.getString("option1");
             String o2 = rs.getString("option2");
             String o3 = rs.getString("option3");
             String o4 = rs.getString("option4");
             String a = rs.getString("correct_option");            
             answer.add(a);
             out.print("<div class='contentlist' >");
             out.print("<strong class='chapter'>Q."+count+"</strong>");
             out.print("<h3 class='chapter'>"+q+"</h3>");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o1+"'>"+o1+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o2+"'>"+o2+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o3+"'>"+o3+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o4+"'>"+o4+"");
             out.print("<br>");
             out.print("<hr style='width:95%; margin-left:12px;'/></div>");  
             count++;
             

            }
                    int counter = 1;
                    for(int i=0;i<answer.size();i++)
                     {
                     selectedans.add(request.getParameter("r"+counter));
                     counter++;
                     }
            
                    for(int i =0;i<answer.size();i++)
                        {
                            for(int j =0;j<selectedans.size();j++)
                            {
                            if(answer.get(i).equals(selectedans.get(j)))
                            {
                                score++; 
                                break;
                            }
                            
                            }
                        }
              
                       

               String btn = request.getParameter("Submit");
               if(btn!=null)
                {
               if (request.getMethod().equals("POST")) {
               {
                String user = (String) session.getAttribute("username");
             if (username != null) 
                {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");   
                    Statement stmt = con.createStatement();
                    stmt.execute("insert into result values(default,'"+user+"','"+g+"','"+s+"','"+c+"','"+score+"',CURRENT_TIMESTAMP)");
                    //out.print("Score inserted");
                    
                    
                    stmt.close();
                    conn.close();  
                
                
                }
               
                }
                }
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
<br><br>
<input type="submit" value="Submit" onclick="handleButtonClick()" name="Submit" class="button" > 
<br><br>
</div>
          </div>


             
             </div>
 
<!--    </center>-->
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
<script type="text/javascript">
        
        
//        function enableScriptlet() {
//            document.getElementById("scriptletCode").style.display = "block";
//        }
//       function enableScriptlet() {
//            document.getElementById("scriptletCode").style.display = "block";
//            document.getElementById("myButton").disabled = true;
//        }
       function handleButtonClick() {
            // Show success message using Swal.fire()
            Swal.fire({
              title: 'Good job!',
              text: 'You have successfully submitted the test!!',
              icon: 'success',
              confirmButtonText: 'OK'
            }).then((result) => {
              if (result.isConfirmed) {
                // Redirect to another page
                window.location.href = '/LMS_EduMe/ViewScore.jsp?';
                
              }
            });
        }
    </script>
    </body>

</html>
<%

session.setAttribute("name", score);

%>
<% } %>

