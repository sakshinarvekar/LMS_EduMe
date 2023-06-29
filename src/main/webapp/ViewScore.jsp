<%-- 
    Document   : ViewScore
    Created on : Jun 28, 2023, 9:33:46 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EduMe | View Score</title>
        <style>
        table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            border: 2px solid #ddd;
            border-radius: 8px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .scorediv {
            width: 500px;
            margin: 20px auto;
        }
        h3 {
            text-align: center;
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
            margin-left: 150px;
            background-color: white;
            width:500px;
            height:max-content;
            text-align: center;
            border-radius: 30px;
            box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
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
        .scorediv {
            width: 600px;
            margin: 20px auto;
            
        }
        h2 {
            background-color: rgb(232,108,58);
            color :white;
            border-radius:30px;
            text-align: center;
            width: 400px;
            align:center;
        }
            
    </style>
        </style>
    </head>
    <body>
        <form method="post" action="">
            <div>
        <header>
        <a href="homepage.html" ><img class="logo" src="/LMS_EduMe/img/EduMelogocrop.png" alt="logo" style="height: 50px; width: 200px; padding: 0px;"></a>
        <nav>
            <ul class="nav">
                <li><a href="homepage.html" >Home</a></li>
                <li><a href="#wave" >Grades</li>
                <li class="dropdown">
                    <a href="#">Teach On EduMe &#9662;</a>
<!--                    <ul class="dropdown-menu">
                        <li><a href="TeacherLogin.jsp">SignIn</a></li>
                        <li><a href="TeacherRegister.jsp">SignUp</a></li>
                    </ul>-->
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
        <a href="Test.jsp?grade=<%=request.getParameter("grade")%>" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-chart-bar fa-fw me-3"></i><span>Test</span></a
        >
        <a href="ViewScore.jsp" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-globe fa-fw me-3"></i><span>Result</span></a
        >
        <a href="#" class="list-group-item list-group-item-action py-2 ripple"
          ><i class="fas fa-calendar fa-fw me-3"></i><span>Help</span></a
        >
      </div>
    </div>
  </nav>
</header>

        <div class="scorediv">
            
            
                <h3>Your Scores : </h3>
                <%
                    String u = (String)session.getAttribute("username");
                    String g = (String)session.getAttribute("grade");
                    String s = (String)session.getAttribute("selectedsub");
                    String c = (String)session.getAttribute("selectedChapter");
                    
                    try
                    {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                        Statement st = con.createStatement();
                       
                        ResultSet rs = st.executeQuery("SELECT * FROM result WHERE username = '"+u+"' ORDER BY date DESC;");
                        out.print("<table border=1 >");
                        out.print("<tr>");
                        out.print("<th> Grade </th>");
                        out.print("<th> Subject </th>");
                        out.print("<th> Chapter Name </th>");
                        out.print("<th> Your score </th>");
                        out.print("<th> Date and Time </th>");
                        out.print("</tr>");
                        while (rs.next()) 
                        {
                            int id = rs.getInt("id");
                            //String username = rs.getString("username");
                            String grade = rs.getString("grade");
                            String subject = rs.getString("sub");
                            String chp_name = rs.getString("chp_name");
                            int score = rs.getInt("score");
                            Timestamp date = rs.getTimestamp("date"); 
                            
                            out.print("<tr>");
                            out.print("<td>"+grade+"</td>");
                            out.print("<td>"+subject+"</td>");
                            out.print("<td>"+chp_name+"</td>");
                            out.print("<td>"+score+"</td>");
                            out.print("<td>"+date+"</td>");
                            out.print("</tr>");
                        }
                        out.print("</table>");
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                %>
            
        </div>
                </form>
    </body>
</html>
