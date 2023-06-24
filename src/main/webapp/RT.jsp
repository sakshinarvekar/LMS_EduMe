<%-- 
    Document   : RT
    Created on : 24-Jun-2023, 5:58:43 pm
    Author     : rupal
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
  <title>Quiz Test</title>
  <script>
    // Timer countdown function
    function countdown(minutes) {
      var seconds = 60;
      var mins = minutes;

      function tick() {
        var counter = document.getElementById("timer");
        var currentMinutes = mins - 1;
        seconds--;
        counter.innerHTML =
          currentMinutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
        if (seconds > 0) {
          setTimeout(tick, 1000);
        } else {
          if (mins > 1) {
            countdown(mins - 1);
          } else {
            // Submit the form when the time is up
            document.getElementById("quizForm").submit();
          }
        }
      }

      tick();
    }
  </script>
</head>
<body onload="countdown(10)">
  <h1>Quiz Test</h1>
  <div id="timer"></div>

  <form method="post" action="" id="quizForm">
    <%@ page import="java.sql.*" %>
    <%
      // Establish a database connection
      Connection connection = null;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744","sql12627744","aeUIku5cCL");
      } catch (Exception e) {
        e.printStackTrace();
      }

      // Fetch the questions and options from the database
      String query = "SELECT q.*, o.option_text " +
                     "FROM questions q " +
                     "JOIN options o ON q.question_id = o.question_id " +
                     "ORDER BY q.question_id";
      ResultSet resultSet = null;

      try {
        Statement statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

        // Variables to track question changes
        int currentQuestionId = -1;
        boolean firstOption = true;

        // Process each question
        while (resultSet.next()) {
          int questionId = resultSet.getInt("question_id");
          String subject = resultSet.getString("subject");
          String grade = resultSet.getString("grade");
          String chapter = resultSet.getString("chapter");
          String questionText = resultSet.getString("question_text");
          String optionText = resultSet.getString("option_text");
          String correctAnswer = resultSet.getString("correct_answer");

          // Display the question details once per question
          if (questionId != currentQuestionId) {
            currentQuestionId = questionId;
            out.println("<h3>Subject: " + subject + "</h3>");
            out.println("<h3>Grade: " + grade + "</h3>");
            out.println("<h3>Chapter: " + chapter + "</h3>");
            out.println("<p>" + questionText + "</p>");
            out.println("<br>");
            firstOption = true;
          }

          // Display the options
          out.println("<input type=\"radio\" name=\"question" + questionId + "\" value=\"" + optionText + "\">" + optionText + "<br>");

          // Store the correct answer in a hidden field for validation
          if (firstOption) {
            out.println("<input type=\"hidden\" name=\"correctAnswer" + questionId + "\" value=\"" + correctAnswer + "\">");
            firstOption = false;
          }
        }
      } catch (SQLException ex) {
        ex.printStackTrace();
      } finally {
        if (resultSet != null) {
          resultSet.close();
        }
      }
    %>
    <input type="submit" value="Submit">
  </form>
</body>
</html
