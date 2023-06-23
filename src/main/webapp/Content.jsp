<%-- 
    Document   : Content
    Created on : 22-Jun-2023, 4:42:08 pm
    Author     : rupal
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        .active {
/*            color: red;*/
            font-weight: bold;
            cursor: pointer;
        }
/*        #accordion{
            display: none;
        }

        */
        
        </style>
        <script>
        function toggleContent(hyperlinkId) {
            var linkDiv = document.getElementById('linkDiv');
            var messageDiv = document.getElementById('messageDiv');
            var sampleDiv = document.getElementById('sampleDiv');
            
            // Hide the previous content
            linkDiv.style.display = 'none';
            messageDiv.style.display = 'none';
            sampleDiv.style.display = 'none';
            
            // Show the content based on the selected hyperlink
            if (hyperlinkId === 'link1') {
                linkDiv.style.display = 'block';
            } else if (hyperlinkId === 'link2') {
                messageDiv.style.display = 'block';
            } else if (hyperlinkId === 'link3') {
                sampleDiv.style.display = 'block';
            }
            
            // Toggle the active class for the selected hyperlink
            var hyperlinks = document.getElementsByClassName('toggleHyperlink');
            for (var i = 0; i < hyperlinks.length; i++) {
                if (hyperlinks[i].id === hyperlinkId) {
                    hyperlinks[i].classList.add('active');
                } else {
                    hyperlinks[i].classList.remove('active');
                }
            }
        }
    </script>
    </head>
    <body>
        <form method="post" action="">
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
                <li><a href="/Grade5.jsp" >Grades</a></li>
                <li><a href="#" >Teach On EduMe</a></li>
                <li><a href="Signupnew.html" >SignUp</a></li>
                <li><a href="sign.html" >SignIn</a></li>
                <li><a href="#" >Account</a></li>
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
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-line fa-fw me-3"></i><span>Home</span></a
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-line fa-fw me-3"></i><span>User Profile</span></a
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>Syllabus</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-bar fa-fw me-3"></i><span>Test</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-globe fa-fw me-3"></i><span>Result</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-building fa-fw me-3"></i><span>Logout</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-calendar fa-fw me-3"></i><span>Help</span></a
        >
        
      </div>
    </div>
  </nav>
</header>
  <% 
        String[] hyperlinkTexts = {"English", "Maths", "Science"};
    %>
      
      <div class="subject-main">
          <div class="subject-container" id="box"    data-aos="fade-up" data-aos-duration="1500">
              <h2 style="text-align:center;">Start Learning </h2><br><br>
            <div class="row">
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 180px; width: 155px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/eng.png" style="height: 100px; width: 100px;" alt="">
                        <h4><a href="Content.jsp?grade=<%=request.getParameter("grade")%>&sub=English" id="link1"  class="toggleHyperlink" onclick="toggleContent('link1');"><%= hyperlinkTexts[0] %></a></h4>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 180px; width: 155px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/tools.png" style="height: 100px; width: 100px;" alt="">
                        <h4><a id="link2" href="Content.jsp?grade=<%=request.getParameter("grade")%>&sub=Maths" class="toggleHyperlink" onclick="toggleContent('link2');"><%= hyperlinkTexts[1] %></a></h4>
                    </div>
                </div>
                <div class="col-md-4 py-3 py-md-0">
                    <div class="card" style="height: 180px; width: 155px; background-color: rgb(254,248,237); box-shadow: 0.3rem 0.3rem 0 0 rgba(0,0,0,.1);">
                        <img src="/LMS_EduMe/img/science.png" style="height: 100px; width: 100px;" alt="">
                        <h4><a id="link3" href="Content.jsp?grade=<%=request.getParameter("grade")%>&sub=Science" class="toggleHyperlink" onclick="toggleContent('link3');"><%= hyperlinkTexts[2] %></a></h4>
                    </div>
                </div>  
            </div>
                    <div class="engbanner" id="linkDiv"></div>
                    <div class="mathbanner" id="messageDiv" ></div>
                    <div class="scibanner" id="sampleDiv"></div>
                    <div id="linkDiv"></div>
  
                    <div id="messageDiv" ></div>
           
                    <div id="sampleDiv"></div>
                    </div> 
                    
                    <div class="contentdiv" style="margin-left: 250px;">
  <%!
  String g,s,c,cn;
  
  %> 
  
  
 <%
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744","sql12627744","aeUIku5cCL");
           

    String selectedClass = request.getParameter("sub");
     String selectedGrade = request.getParameter("grade");
     
     
     
    String sql = "SELECT * FROM content WHERE grade =? AND sub = ? ";
    PreparedStatement statement = con.prepareStatement(sql);
    statement.setString(1,selectedGrade);
    statement.setString(2,selectedClass);
    

    ResultSet rs = statement.executeQuery();

//    List<String> chaptername = new ArrayList<>();
    
    int count=1;
    while (rs.next()) {
        int id = rs.getInt("id");
         g = rs.getString("grade");
         s = rs.getString("sub");
         c = rs.getString("chp_no");
         cn = rs.getString("chp_name");
         
//         chaptername.add(cn);
        
         out.println("<p>Chapter : " +c+"</p>");
         out.println("<a href='videocontent.jsp?link="+count+"'>"+cn+" </a><br>");
         out.println("<br/>");
         count++;
         
    }

         session.setAttribute("Grade", request.getParameter("grade"));
         session.setAttribute("Subject",request.getParameter("sub"));
         
    
    
    rs.close();
    statement.close();
    con.close();
%>
                    
              </div>
                    
                     
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
            <p>© Copyright 2023 | Designed by Sakshi Narvekar and Rupali Vaje...</p>
        </div>
        </div>
      
    </div>
    </form>
    </body>
</html>
     
