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
        <h1 style="margin-left: 620px; color: rgb(232,108,58); ">View Resources</h1>
        <form action="http://localhost:8080/LMS_EduMe/pdfRetrieve" method="post">
            Enter grade : <input type="text" name="t1"><br>
            Enter subject : <input type="text" name="t2"><br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </body>
</html>
