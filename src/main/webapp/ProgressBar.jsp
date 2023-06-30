<%--
    Document   : ProgressBar
    Created on : 28-Jun-2023, 6:53:54 pm
    Author     : rupal
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <style>
        .progress-bar {
            width: 70%;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            height: 30px;
        }
        .progress-bar-fill {
            height: 100%;
            background-color: #4caf50;
        }
        .progress-bar-text {
            text-align: center;
            line-height: 30px;
            color: #000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Profile Page</h1>
    <p>Your Progress</p>

    <% 
    String user = (String) session.getAttribute("username");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
        Statement st = con.createStatement();
        //ResultSet rs = st.executeQuery("SELECT subject, SUM(progress) AS total_progress FROM video_progress WHERE username = '" + user + "' GROUP BY subject");
            ResultSet rs = st.executeQuery("SELECT subject, ROUND(SUM(progress), 2) AS total_progress FROM video_progress WHERE username = '"+user+"' GROUP BY subject");
        while (rs.next()) {
            double progress = rs.getDouble("total_progress");
            String subject = rs.getString("subject");

            // Calculate the progress percentage
            int progressPercentage = (int) (progress);

            // Display progress bar and text
            out.print("<p>" + subject + "</p>");
            out.print("<div class='progress-bar'>");
            out.print("<div class='progress-bar-fill' style='width: " + progressPercentage + "%'></div>");
            out.print("<div class='progress-bar-text'>" + progressPercentage + "%</div>");
            out.print("</div>");
        }

        st.close();
        con.close();
    } catch (Exception e) {
        out.print(e);
    }
    %>
</body>
</html>
