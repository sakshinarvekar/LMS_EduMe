<%-- 
    Document   : signup
    Created on : 02-Jul-2023, 5:45:50 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://kit.fontawesome.com/c807f93a6d.js" crossorigin="anonymous"></script>
  <style>
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
        
/*         *{
        margin: 0px;
        padding: 0px;
        box-sizing: border-box;
        font-family: 'PT Sans Caption', sans-serif;
    }*/
      .btn {
      text-align: center;
    }

    .btns {
      height: 30px;
      width: 168px;
    }

    .main {
      height: 560px;
      width: 350px;
      background-color: #ECF2FF;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(50%,-50%);
      text-align: center;
      border-radius: 8px;
      padding-bottom: 10px;
    }

    input {
      height: 30px;
      font-weight: bold;
      background-color: #D2DAFF;
    }

    .login_table input {
      height: 33px;
    }

    hr {
      border: 3px solid #0954aa;
      margin: 5px 5px 0px 5px;
    }

    .main h1 {
      color: #0954aa;
      position: relative;
    }

    .main h1::after {
      content: '';
      width: 30px;
      height: 4px;
      border-radius: 3px;
      background: #3E54AC;
      position: absolute;
      bottom: -12px;
      left: 50%;
      transform: translateX(-50%);
    }

    .btns {
      border-style: none;
      border-radius: 6px;
      background-color: #0954aa;
      border-color: #CCCCFF;
      font-weight: bold;
      color: #FFFFFF;
      border-spacing: inherit;
    }

    .container {
/*      background-image: url("E-learn.jpg");*/
    }

    .login_image {
/*      opacity: 0.5;*/
    }

    .button {
      display: inline-block;
      padding: 10px 20px;
      background-color: #0954aa;
      color: #FFFFFF;
      font-size: 16px;
      text-align: center;
      text-decoration: none;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      
    }

    .button:hover {
      background-color:#0954a3 ;
    }

    .button:active {
      background-color: #3e8e41;
    }
  </style>
</head>
<body>
<div class="login_image">
  <img src="/LMS_EduMe/img/family.png" alt="alt" width="800" height="650">
</div>
<form id="form1" action="http://localhost:8080/LMS_EduMe/SignUp" method="post">
    
  <br>
  <div class="container">
    <div class="main">
      <hr>
      <br>
      <h1 style="font-family: 'PT Sans Caption', sans-serif">Sign Up</h1>
      <div>
        <table align="center" class="login_table" style="height: 167px; font-family: 'PT Sans Caption', sans-serif;">
            <tr>
                <td>
                <div class="form-group">
                <input type="radio" name="userType" value="student" onclick="showForm('studentForm')"> Student
                <input type="radio" name="userType" value="teacher" onclick="showForm('teacherForm')"> Teacher
                </div>
                </td>
            </tr>
            <tr>
                <td>
     <div class="form-group" id="studentForm" style="display: none;">
                </td>
            </tr>
          <tr>
            <td style="font-size: large">&nbsp;</td>
          </tr>
          <div class="form-group" id="studentForm" style="display: none;">
              <tr>
            <td style="background-color: #FFFFFF">
                  <div>
                <i class="fa-solid fa-user-tie"></i>
                <input type="text" name="t1" placeholder="Username" style="border-style: inherit;font-family: 'PT Sans Caption', sans-serif;" required>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-size: large">&nbsp;</td>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF">
              <div>
                <i class="fa-solid fa-envelope"></i>
                <input type="text" name="t2" placeholder="Email" style="border-style: hidden;font-family: 'PT Sans Caption', sans-serif;" required>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-size: large">&nbsp;</td>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF">
              <div>
                <i class="fa-solid fa-unlock-keyhole"></i>
                <input type="password" name="t3" placeholder="Password" style="border-style: hidden;font-family: 'PT Sans Caption', sans-serif;" required>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-size: large">&nbsp;</td>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF">
              <div>
                <i class="fa-solid fa-unlock-keyhole"></i>
                <input type="password" name="t4" placeholder="Confirm Password" style="border-style: hidden;font-family: 'PT Sans Caption', sans-serif;" required>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-size: large">&nbsp;</td>
          </tr>
          <tr>
            <td style="background-color: #FFFFFF">
              <div>
                <i class="fa-solid fa-mobile"></i>
                <input type="text" name="t5" placeholder="Mobile No" style="border-style: hidden; font-family: 'PT Sans Caption', sans-serif;" required >
              </div>
            </td>
          </tr>
          </div>
          <div></div><!-- comment -->
        </table>
        <br>
        <br>
        <div class="btn">
            <input type="submit" class="button" value="Sign up" style="background-color:#0954aa;">
        </div>
        <p style="font-family: 'PT Sans Caption', sans-serif">Already have an account?<a href="sign.html">SignIn here</a>
        </p>
      </div>
    </div>
  </div>
</form>
</body>
</html>
