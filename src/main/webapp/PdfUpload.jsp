<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
<%@ page import="javax.servlet.http.Part" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload PDF</title>
</head>
<body>
    <h1>Upload PDF</h1>
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
    </form>
</body>
</html>

