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
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        
        h1 {
            text-align: center;
            color: #333;
        }
        
        form {
            background-color: #fff;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        
        label {
            display: block;
            margin-top: 10px;
            color: #333;
        }
        textarea {
            height: 80px;
            width: 300px;
            border: 1px solid #ccc;
            padding: 5px;
        }
        
        input[type="text"],
        input[type="number"] {
            width: 300px;
            padding: 5px;
            border: 1px solid #ccc;
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
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #ff6347;
        }
        
    </style>
</head>
<body>
    <h1>Create Quiz</h1>
    
    <%-- Form to enter quiz details and questions --%>
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
    </form>
    
    <%-- Code to handle form submission and save the question to the database --%>
    <%@ page import="java.io.PrintWriter" %>
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String grade = request.getParameter("grade");
            String subject = request.getParameter("subject");
            String chapter = request.getParameter("chapter");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            int correctOption = Integer.parseInt(request.getParameter("correctOption"));
            
            String jdbcURL = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744";
            String username = "sql12627744";
            String password = "aeUIku5cCL";
            
            Connection connection = null;
            PreparedStatement statement = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, username, password);
                
                String query = "INSERT INTO quiz (grade, subject, chapter, question, option1, option2, option3, option4, correct_option) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                statement = connection.prepareStatement(query);
                statement.setString(1, grade);
                statement.setString(2, subject);
                statement.setString(3, chapter);
                statement.setString(4, question);
                statement.setString(5, option1);
                statement.setString(6, option2);
                statement.setString(7, option3);
                statement.setString(8, option4);
                statement.setInt(9, correctOption);
                
                int rowsAffected = statement.executeUpdate();
                
                if (rowsAffected > 0) {
    %>
    
    <h2>Question Saved Successfully</h2>
    
    <%
                } else {
    %>
    
    <h2>Failed to Save Question</h2>
    
    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close database resources
                if (statement != null) {
                    try {
                        statement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    %>
    <a href="quizform.jsp">Add another question</a> 
</body>
</html>
