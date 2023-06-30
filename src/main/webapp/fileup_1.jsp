<%-- 
    Document   : fileup
    Created on : 08-Jun-2023, 7:28:45 pm
    Author     : Abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        
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
            background-color: rgb(238,247,247);
        }
        
         h1 {
            text-align: center;
            color: rgb(232,108,58);
/*            margin-top: 50px;*/
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
            
            
        
        form {
            
            background-color: #fff;
            max-width: 480px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            
        }
        
        label {
            color: #333;
            display: block;
            margin-top: 10px;
            margin-left: 70px;  
        }

        input[type="text"]
        {
            width: 300px;
            padding: 5px;
            border: 1px solid #ccc;
            margin-left: 70px;
        }
        
        input[type="submit"],
        input[type="button"],
        input[type="reset"]{
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
        input[type="button"]:hover,
        input[type="reset"]:hover{
            background-color: #ff6347;
            margin-left: 70px;
        }
        
        input[type="file"] {
            background-color: white;
            color: #000000;
            cursor: pointer;
            padding: 8px;
            margin-left: 70px;
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
    <div class="formdiv">
    <h1 ">Upload Content</h1>
    <form action="img" method="post" enctype="multipart/form-data">
         <label for="grade">Enter grade:</label>
        <input type="text" name="grade" required><br> 
        <label for="sub">Enter subject name:</label>
        <input type="text" name="sub" required><br> 
        <label for="chapterno">Enter chapter no.:</label>
        <input type="text" name="chapterno" required><br> 
        <label for="chaptername">Enter chapter name:</label>
        <input type="text" name="chaptername" required><br> 
        <input type="file" name="video" required/><br />
        <input type="submit" value="Upload" />
        <input type="reset" value="Reset" />
<!--        Enter grade : <input type="text" name="grade"><br> 
        Enter subject name : <input type="text" name="sub"><br> 
        Enter chapter no. : <input type="text" name="chapterno"><br> 
        Enter chapter name : <input type="text" name="chaptername"><br> 
        <input type="file" name="video" /><br />
        <input type="submit" value="Upload" />-->
    </form>
    </div>
</body>
</html>
