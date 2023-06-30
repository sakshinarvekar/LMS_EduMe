<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
<%@ page import="javax.servlet.http.Part" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Resources</title>
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
            background-color: rgb(238,247,247);
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
            display: block;
            margin-top: 10px;
            margin-left: 70px;
            color: #333;
        }
        textarea {
            height: 80px;
            width: 300px;
            border: 1px solid #ccc;
            padding: 5px;
            margin-left: 70px;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 300px;
            padding: 5px;
            border: 1px solid #ccc;
            margin-left: 70px;
        }
        
        input[type="submit"],
        input[type="reset"],
        input[type="button"] {
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
        input[type="reset"]:hover,
        input[type="button"]:hover {
            background-color: #ff6347;
            margin-left: 70px;
        }
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


    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Caretutor</h2>
        <img src="/LMS_EduMe/img/teacher.jpg" height="50px" width="50px" alt="Vector Image">
        <ul>
            <li><a href="TeacherpPanel.jsp">Dashboard</a></li>
            <li><a href="quizform.jsp">Add Quiz</a></li>
            <li><a href="PdfUpload.jsp">Add Resources</a></li>
            <li><a href="TeacherLogin.jsp">Sign In</a></li>
            <li><a href="TeacherRegister.jsp">Sign Up</a></li>
        </ul>
    </div>
    
    <h1 style="margin-left: 620px; color: rgb(232,108,58); ">Upload Resources</h1>
    <form action="http://localhost:8080/LMS_EduMe/pdfupload" method="post" enctype="multipart/form-data">
        <label for="grade">Grade:</label>
        <input type="text" name="grade" required><br><br>
        
        <label for="subject">Subject:</label>
        <input type="text" name="subject" required><br><br>
        
        <label for="chapter_name">Chapter Name:</label>
        <input type="text" name="chapter_name" required><br><br>
        
        <label for="file_name">File Name:</label>
        <input type="text" name="file_name" required><br><br>
        
        <label for="file">PDF File:</label>
        <input type="file" name="file" required><br><br>
        
        <input type="submit" value="Upload">
        <input type="reset" value="Reset">
    </form>
</body>
</html>

