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

    </style>
</head>
<body>
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

