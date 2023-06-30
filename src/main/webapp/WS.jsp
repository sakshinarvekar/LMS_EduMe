<%-- 
    Document   : WS
    Created on : 25-Jun-2023, 1:55:50 am
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Women Safety</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #333;
      padding: 10px;
    }

    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }

    nav li {
      display: inline;
      margin-right: 10px;
    }

    nav a {
      color: #fff;
      text-decoration: none;
      padding: 5px;
      border-radius: 4px;
      transition: background-color 0.3s;
    }

    nav a:hover {
      background-color: #fff;
      color: #333;
    }

    .container {
      max-width: 800px;
      margin: 40px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #ff3366;
      text-align: center;
    }

    .section {
      margin-bottom: 30px;
    }

    .section h2 {
      color: #ff3366;
    }

    .section p {
      color: #333;
      line-height: 1.5;
    }

    .cta-button {
      display: inline-block;
      padding: 10px 20px;
      background-color: #ff3366;
      color: #fff;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      text-decoration: none;
      transition: background-color 0.3s;
      cursor: pointer;
    }

    .cta-button:hover {
      background-color: #cc0033;
    }

    .sos-button {
      display: block;
      margin: 0 auto;
      width: 120px;
      height: 120px;
    }
  </style>
</head>
<body>
  <header>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <a href="#" class="cta-button">Get Involved</a>
    </nav>
  </header>

  <div class="container">
    <h1>Women Safety</h1>

    <div class="section">
      <h2>Welcome to Women Safety</h2>
      <p>
        We are dedicated to empowering and safeguarding women. Our mission is to provide resources, support, and education to promote women's safety and well-being.
      </p>
    </div>

    <div class="section">
      <h2>Safety Tips</h2>
      <ul>
        <li>Always be aware of your surroundings</li>
        <li>Trust your instincts</li>
        <li>Carry emergency contact numbers</li>
        <li>Learn self-defense techniques</li>
        <li>Share your location with trusted friends or family members</li>
      </ul>
    </div>

    <div class="section">
      <h2>Get Involved</h2>
      <p>
        Join our community and take part in making a difference. Together, we can create a safer environment for women.
      </p>
      <a href="#" class="cta-button">Learn More</a>
    </div>
    
    <div class="section">
      <h2>Emergency SOS</h2>
      <a href="#" class="sos-button"><img src="sos_button.png" alt="SOS Button"></a>
    </div>
  </div>
</body>
</html>
