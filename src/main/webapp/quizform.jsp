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

       
        
        
        form {
            
            background-color: #fff;
            max-width: 420px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-top: 0px;
            
            
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
        .back{
            display:flex;
           margin-top: -37px;
            background-color: #ff7f50;
            color: #fff;
            border: none;
        
            border-radius: 3px;
            cursor: pointer;
            width: 145px;
            height:40px;
            text-decoration: none;
            margin-left: 250px;
            
        .back:hover {
            background-color: #ff6347;
            margin-left: 70px;
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
        <input type="text" name="correctOption"  required><br>
        
        <input type="submit" value="Save Question">
        <a href="TeacherpPanel.jsp" class="back" >Back to HomePage</a>
        </div>
    </form>

    
    <%-- Code to handle form submission and save the question to the database --%>
   
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
            String correctOption = request.getParameter("correctOption");
            
            if (grade!=null)
            {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
        Statement st = con.createStatement();
        st.execute("insert into quiz values(default, '"+grade+"','"+subject+"','"+chapter+"','"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+correctOption+"');");              
               //out.print("value inserted");
        out.println("<script type=\"text/javascript\">"); // Start the script tag 
        out.println("alert('Inserted successfully!!');"); // JavaScript code to generate an alert box 
        out.println("window.location.href = 'quizform.jsp';");
        out.println("</script>");
        st.close();
        con.close();
            }
        
    }
    catch(Exception e)
    {
    out.print(e);
    }
    

%>

