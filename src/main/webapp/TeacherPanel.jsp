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
        .sidebar {
    /* existing styles */
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

.sidebar .logo {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.sidebar .logo img {
    width: 50px;
    height: 50px;
    margin-right: 10px;
    border-radius: 50%;
}

.sidebar .logo h2 {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
}

.sidebar hr {
    width: 80%;
    margin: 20px 0;
    border: none;
    border-top: 1px solid #DDD;
}

/* Rest of the CSS code */

    </style>
</head>
<body>
    <%
    String e = (String) session.getAttribute("email");
    if (e == null) {
    %>
    <script>
        alert("You must be logged in to access this page!");
        window.location.href = "TeacherLogin.jsp"; // Replace with the login page URL
    </script>
    <% } else { %>
    <!-- Your existing HTML code here -->
    <!-- ... -->
    <div class="sidebar">
        <h2>Caretutor</h2>
        <img src="/LMS_EduMe/img/teacher.jpg" height="50px" width="50px" alt="Vector Image">
        <ul>
            <li><a href="TeacherLogin.jsp">Sign In</a></li>
            <li><a href="TeacherRegister.jsp">Sign Up</a></li>
            <li><a href="quizform.jsp">Add Quiz</a></li>
        </ul>
    </div>
    
    
    <div class="content">
        <h1>Welcome, Teacher!</h1>
        <div class="box">
            <div class="gifdiv">
        <img src="/LMS_EduMe/img/tecahergif.gif" style="border-radius: 40px;width:1000px;height:600px;">
    </div>
        </div>
        
            <div class="logged-info">
        <div class="dropdown">
            <%
   // String e = (String) session.getAttribute("email");
             if (e!=null )
             {
             %>
             <a href ="#" class="dropbtn"><%= e%></a>
            <div class="dropdown-content">
                <%
   String action = request.getParameter("action");
    if (action != null && action.equals("logout")) {
        session.invalidate();
        response.sendRedirect("TeacherpPanel.jsp");
    }

%>
            
<!--                <a href="#">Profile</a>-->
                <a href="TeacherPanel.jsp?action=logout">Logout</a>
                <%
                    }
              %>
            </div>
        </div>
    </div>
            <% } %>
</body>
</html>
