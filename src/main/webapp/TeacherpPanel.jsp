<%-- 
    Document   : TeacherpPanel
    Created on : 28-Jun-2023, 4:17:02 am
    Author     : rupal
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User-Friendly Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 200px;
            height: 100vh;
            background-color: #F5F5F5;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .sidebar h2 {
            margin-top: 20px;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }

        .sidebar img {
            width: 100px;
            height: 100px;
            margin-top: 10px;
            border-radius: 50%;
        }

        .sidebar ul {
            list-style-type: none;
            margin-top: 30px;
            padding: 0;
            width: 100%;
        }

        .sidebar li {
            padding: 10px;
            margin-bottom: 10px;
            text-align: center;
            transition: background-color 0.3s;
            font-weight: 800;
        }

        .sidebar li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            font-weight: bold;
        }

        .sidebar li:hover {
            background-color: #E0E0E0;
        }

        /* Content Styles */
        .content {
            margin-left: 250px;
            padding: 20px;
        }

        .content h1 {
            font-size: 24px;
            font-weight: bold;
        }

        .content img {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
        }

        .content .box {
            background-color: #FFF;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin-bottom: 20px;
        }

        .content .calendar {
            margin-bottom: 20px;
        }

        .content .photo-collection {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center items horizontally */
        }

        .content .photo {
            width: 150px;
            height: 150px;
            margin: 10px;
            background-color: #EEE;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .content .subject {
            font-size: 18px;
            font-weight: bold;
        }

        /* Logged Info Button */
        .logged-info {
            position: fixed;
            top: 10px;
            right: 10px;
            padding: 10px 20px;
            background-color: #333;
            color: #FFF;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
        }
        .logged-info {
            position: fixed;
            top: 10px;
            right: 10px;
        }

        .logged-info .dropdown {
            position: relative;
            display: inline-block;
        }

        .logged-info .dropdown-content {
            display: none;
            position: absolute;
            background-color: #FFF;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
        }
        .logged-info .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            cursor: pointer;
        }

        .logged-info .dropdown:hover .dropdown-content {
            display: block;
        }
        
    </style>
</head>
<body>
    <div class="sidebar">
         <%
    String username = (String) session.getAttribute("username");
             if (username!=null )
             {
             %>
        <h2><%= username%></h2>
        <img src="/LMS_EduMe/img/teacher.jpg" height="50px" width="50px" alt="Vector Image">
        <ul>
            <li><a href="TeacherLogin.jsp">Sign In</a></li>
            <li><a href="TeacherRegister.jsp">Sign Up</a></li>
            <li><a href="quizform.jsp">Add Quiz</a></li>
                            <%
   String action = request.getParameter("action");
    if (action != null && action.equals("logout")) {
        session.invalidate();
        response.sendRedirect("HomePage.jsp");
    }

%>
            <li><a href="?action=logout">Logout</a></li>
                         <%
                            }
             %>
        </ul>
    </div>
    <div class="content">
        <h1>Welcome, Teacher!</h1>
        <div class="box" align="center">
            <img src="/LMS_EduMe/img/tecahergif.gif" style="width:700px; height: 600px;" alt="Teacher Image">
        </div>
    </div>
</body>
</html>
