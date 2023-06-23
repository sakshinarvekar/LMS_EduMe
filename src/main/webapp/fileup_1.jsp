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
</head>
<body>
    <h1>File Upload</h1>
    <form action="img" method="post" enctype="multipart/form-data">
        Enter id : <input type="text" name="id"><br> 
        Enter grade : <input type="text" name="grade"><br> 
        Enter subject name : <input type="text" name="sub"><br> 
        Enter chapter no. : <input type="text" name="chapterno"><br> 
        Enter chapter name : <input type="text" name="chaptername"><br> 
        <input type="file" name="video" /><br />
        <input type="submit" value="Upload" />
    </form>
</body>
</html>
