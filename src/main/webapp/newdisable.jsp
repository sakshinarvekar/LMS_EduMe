<%-- 
    Document   : newdisable
    Created on : 26-Jun-2023, 9:23:25 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
    <title>Quiz Test</title>
    <script>
        function enableTest() {
            document.getElementById("testForm").style.display = "block";
        }
        
        function filterChapters() {
            var subject = document.getElementById("subject").value;
            var chapterSelect = document.getElementById("chapter");
            
            // Disable the test while filtering chapters
            document.getElementById("testForm").style.display = "none";
            
            // Clear the previous chapter options
            chapterSelect.innerHTML = "";
            
            if (subject === "science") {
                chapterSelect.innerHTML += "<option value='chapter1'>Chapter 1</option>";
                chapterSelect.innerHTML += "<option value='chapter2'>Chapter 2</option>";
                chapterSelect.innerHTML += "<option value='chapter3'>Chapter 3</option>";
            } else if (subject === "maths") {
                chapterSelect.innerHTML += "<option value='chapter4'>Chapter 4</option>";
                chapterSelect.innerHTML += "<option value='chapter5'>Chapter 5</option>";
                chapterSelect.innerHTML += "<option value='chapter6'>Chapter 6</option>";
            } else if (subject === "english") {
                chapterSelect.innerHTML += "<option value='chapter7'>Chapter 7</option>";
                chapterSelect.innerHTML += "<option value='chapter8'>Chapter 8</option>";
                chapterSelect.innerHTML += "<option value='chapter9'>Chapter 9</option>";
            }
        }
    </script>
</head>
<body>
    <h1>Quiz Test</h1>
    
    <button onclick="enableTest()">Take Test</button>
    
    <form id="testForm" action="" method="post" style="display: none;">
        <label for="subject">Select a subject:</label>
        <select id="subject" name="subject" onchange="filterChapters()">
            <option value="science">Science</option>
            <option value="maths">Maths</option>
            <option value="english">English</option>
        </select>
        
        <label for="chapter">Select a chapter:</label>
        <select id="chapter" name="chapter">
            <option>Select a subject first</option>
        </select>
        
        <h2>Quiz Questions</h2>
        <ol>
            <li>
                <p>Question 1: What is the capital of France?</p>
                <input type="radio" name="q1" value="a"> a) Paris<br>
                <input type="radio" name="q1" value="b"> b) London<br>
                <input type="radio" name="q1" value="c"> c) Rome<br>
                <input type="radio" name="q1" value="d"> d) Berlin<br>
            </li>
            <li>
                <p>Question 2: Who painted the Mona Lisa?</p>
                <input type="radio" name="q2" value="a"> a) Leonardo da Vinci<br>
                <input type="radio" name="q2" value="b"> b) Vincent van Gogh<br>
                <input type="radio" name="q2" value="c"> c) Pablo Picasso<br>
                <input type="radio" name="q2" value="d"> d) Michelangelo<br>
            </li>
            <li>
                <p>Question 3: What is the chemical symbol for gold?</p>
                <input type="radio" name="q3" value="a"> a) Ag<br>
                <input type="radio" name="q3" value="b"> b) Au<br>
                <input type="radio" name="q3" value="c"> c) Fe<br>
                <input type="radio" name="q3" value="d"> d) Hg<br>
            </li>
        </ol>
        
        <input type="submit" value="Submit Quiz">
    </form>
</body>
</html>
<%-- This is a disabled scriptlet code --%>
<% 
    // Disabled scriptlet code
    String message = "This code is disabled";
%>
