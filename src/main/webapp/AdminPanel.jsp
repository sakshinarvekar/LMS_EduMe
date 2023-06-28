<%-- 
    Document   : AdminPanel
    Created on : Jun 28, 2023, 12:27:48 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EduMe Admin Panel</title>
  <style>
    /* CSS for sidebar */
    @import url("https://fontawesome.com/");
    @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
    *{
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
        font-family: 'PT Sans Caption', sans-serif;
    }
    body {
      margin: 0;
      padding: 0;
    }
    
    #sidebar {
      width: 250px;
      background-color: #333;
      height: 100vh;
      position: fixed;
      left: 0;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
    }
    
    #sidebar img {
      width: 100px;
      border-radius: 50%;
      margin-bottom: 20px;
    }
    
    #content {
      margin-left: 250px;
      padding: 20px;
    }
    
    ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    
    ul li {
      padding: 10px;
      cursor: pointer;
    }
    
    ul li:hover {
      background-color: #555;
    }
    
    .active {
      background-color: #555;
    }
    
    /* CSS for page content */
    h1 {
      color: #333;
    }
    
    .card-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    
    .card {
      flex-basis: calc(33.33% - 20px);
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
    }
    
    .card-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    
    .card-content {
      font-size: 16px;
    }
    
    .gifdiv{
        margin-left: 450px;
        
    }
  </style>
  <script>
    // JavaScript for sidebar active item
    function setActive(element) {
      var items = document.getElementsByClassName('active');
      for (var i = 0; i < items.length; i++) {
        items[i].classList.remove('active');
      }
      element.classList.add('active');
    }
  </script>
</head>
<body>
  <div id="sidebar">
    <img src="admin-image.png" alt="Admin Image">
    <ul>
      <li onclick="setActive(this)">Dashboard</li>
      <li onclick="setActive(this)">Courses</li>
      <li onclick="setActive(this)">Students</li>
      <li onclick="setActive(this)">Teachers</li>
      <li onclick="setActive(this)">Settings</li>
    </ul>
  </div>
  
  <div id="content">
    <h1>Welcome to the EduMe Admin Panel</h1>
    
    <div class="card-container">
      <div class="card">
        <h2 class="card-title">Total Users</h2>
        <img src="user-image.png" alt="User Image">
        <p class="card-content">1000</p>
      </div>
    
      <div class="card">
        <h2 class="card-title">Total Teachers</h2>
        <img src="teacher-image.png" alt="Teacher Image">
        <p class="card-content">50</p>
      </div>
    
      <div class="card">
        <h2 class="card-title">Total Students</h2>
        <img src="student-image.png" alt="Student Image">
        <p class="card-content">950</p>
      </div>
    </div>
  </div>
    <div class="gifdiv">
        <img src="/LMS_EduMe/img/admin.gif" style="border-radius: 40px;">
    </div>
</body>
</html>
