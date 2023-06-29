<%-- 
    Document   : PdfRetrieve
    Created on : Jun 29, 2023, 12:50:11 AM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="http://localhost:8080/LMS_EduMe/pdfRetrieve" method="post">
            Enter grade : <input type="text" name="t1"><br>
            Enter subject : <input type="text" name="t2"><br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>
