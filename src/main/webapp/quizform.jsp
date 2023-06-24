<%-- 
    Document   : quizform
    Created on : Jun 24, 2023, 6:26:15 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Quiz</title>
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
        
        h1 {
            text-align: center;
            color: rgb(232,108,58);
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
        input[type="button"]:hover {
            background-color: #ff6347;
            margin-left: 70px;
        }
        
        .formdiv{
            margin-top: 20px;
            
        }
        
    </style>
</head>
<body>
    <h1>Create Quiz</h1>
    
    <%-- Form to enter quiz details and questions --%>
    
    
    <div class="formdiv"> 
    <form action="" method="post">
        <label for="grade">Grade:</label>
        <input type="text" name="grade" required><br>
        
        <label for="subject">Subject:</label>
        <input type="text" name="subject" required><br>
        
        <label for="chapter">Chapter:</label>
        <input type="text" name="chapter" required><br>
        
        <label for="question">Question:</label>
        <textarea name="question" required></textarea><br>
        
        <label for="option1">Option 1:</label>
        <input type="text" name="option1" required><br>
        
        <label for="option2">Option 2:</label>
        <input type="text" name="option2" required><br>
        
        <label for="option3">Option 3:</label>
        <input type="text" name="option3" required><br>
        
        <label for="option4">Option 4:</label>
        <input type="text" name="option4" required><br>
        
        <label for="correctOption">Correct Option:</label>
        <input type="number" name="correctOption" min="1" max="4" required><br>
        
        <input type="submit" value="Save Question">
        </div>
    </form>

    
    <%-- Code to handle form submission and save the question to the database --%>
    <%@ page import="java.io.PrintWriter" %>

</body>
</html>

<%
           
    try
    {
     String grade = request.getParameter("grade");
            String subject = request.getParameter("subject");
            String chapter = request.getParameter("chapter");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            int correctOption = Integer.parseInt(request.getParameter("correctOption"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
        Statement st = con.createStatement();
        st.execute("insert into quiz values(default, '"+grade+"','"+subject+"','"+chapter+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+correctOption+"');");              
//               out.print("value inserted");
        out.println("<script type=\"text/javascript\">"); // Start the script tag 
        out.println("alert('Inserted successfully!!');"); // JavaScript code to generate an alert box 
        out.println("window.location.href = 'quizform.jsp';");
        out.println("</script>");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
    out.print(e);
    }
    

%>

