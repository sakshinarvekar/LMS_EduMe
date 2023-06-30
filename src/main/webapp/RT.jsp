<%-- 
    Document   : RT
    Created on : 24-Jun-2023, 5:58:43 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Quiz Test</title>
</head>
<body>
  <h1>Quiz Test</h1>
  
  <form method="post" action="">
    <%@ page import="java.sql.*" %>
    <% 
      // Establish a database connection
      Connection connection = null;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
      } catch (Exception e) {
        e.printStackTrace();
      }
      
      // Fetch the questions and options from the database
      String questionQuery = "SELECT * FROM questions";
      String optionsQuery = "SELECT * FROM options WHERE question_id = ?";
      ResultSet questionResultSet = null;
      ResultSet optionsResultSet = null;
      PreparedStatement optionsStatement = null;
      
      try {
        // Retrieve the questions
        Statement questionStatement = connection.createStatement();
        questionResultSet = questionStatement.executeQuery(questionQuery);
        
        // Process each question
        while (questionResultSet.next()) {
          int questionId = questionResultSet.getInt("id");
          String questionText = questionResultSet.getString("question_text");
          
          // Retrieve the options for the current question
          optionsStatement = connection.prepareStatement(optionsQuery);
          optionsStatement.setInt(1, questionId);
          optionsResultSet = optionsStatement.executeQuery();
          
          // Display the question
          out.println("<h3>" + questionText + "</h3>");
          
          // Display the options
          while (optionsResultSet.next()) {
            int optionId = optionsResultSet.getInt("id");
            String optionText = optionsResultSet.getString("option_text");
            boolean isCorrect = optionsResultSet.getBoolean("is_correct");
            
            // Create radio buttons for each option
            out.println("<input type=\"radio\" name=\"question" + questionId + "\" value=\"" + optionId + "\">" + optionText + "<br>");
          }
          
          // Close the options result set and statement
          optionsResultSet.close();
          optionsStatement.close();
        }
        
        // Close the question result set and statement
        questionResultSet.close();
        questionStatement.close();
        
        // Close the database connection
        connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    %>
    
    <br>
    <input type="submit" value="Submit">
  </form>
</body>
</html>
