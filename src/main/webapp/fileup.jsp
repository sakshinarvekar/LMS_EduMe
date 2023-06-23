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
        <input type="file" name="image" />
        <br /><br>
        <input type="submit" value="Upload" />
    </form>
</body>
</html>
