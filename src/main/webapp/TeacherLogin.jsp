<%-- 
    Document   : TeacherLogin
    Created on : Jun 25, 2023, 3:23:19 AM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c807f93a6d.js" crossorigin="anonymous"></script>
    <title>EduMe | SignIn</title>
    <style>
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300,400,500,600,700,800&family=PT+Sans+Caption:wght@400,700&display=swap');

        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;
        }

        .btn {
            text-align: center;
        }

        .btns {
            height: 30px;
            width: 168px;
        }

        .main {
            height: 390px;
            width: 360px;
            background-color: #ECF2FF;
            top: 50%;
            left: 30%;
            text-align: center;
            border-radius: 8px;
            float: right;
            transform: translate(80%, 10%);
        }

        input {
            height: 26px;
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
            background: #0954aa;
            position: absolute;
            bottom: -12px;
            left: 50%;
            transform: translateX(-50%);
        }

        .btns {
            border-style: none;
            border-radius: 10px;
            background-color: #0954aa;
            border-color: #CCCCFF;
            font-weight: bold;
            color: #FFFFFF;
            border-spacing: inherit;
        }

        .login_main {
            display: flex;
            align-items: center;
            padding: 18px;
        }

        .login_image {
            float: left;
            transform: translate(20%, 5%);
            margin-top: 20px;
        }

        .login_form {
            float: right;
        }
         
   
    body {
      margin: 0;
      padding: 0;
    }
    
    
    </style>
</head>
<body>
   
    
<form action="" method="post" onsubmit="return validateForm()">
    <div class="login_main">
        <div class="login_image">
            <img src="/LMS_EduMe/img/prof.jpg" alt="img" width="700" height="600">
        </div>
        <div class="login_form">

            <br />
            <br />
            <div class="main">

                <hr/>
                <br />
                <h1 style="font-family: 'PT Sans Caption', sans-serif">Sign In</h1>

                <div align="center">
                    <table class="login_table">
                        <tr>
                            <td style="font-size: large ;font-family: 'PT Sans Caption', sans-serif">&nbsp;</td>

                        </tr>
                        <tr>

                            <td style="background-color: #FFFFFF">
                                <div><i class="fa-solid fa-user-tie"></i>
                                    <input name="t1" id="username" type="text" placeholder="Username"
                                           style="border-style: inherit;font-family: 'PT Sans Caption', sans-serif" required>
                                </div>
                            </td>


                        </tr>
                        <tr>
                            <td style="font-size: large">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="font-size: large">&nbsp;</td>

                        </tr>
                        <tr>
                            <td style="background-color: #FFFFFF">
                                <div><i class="fa-solid fa-unlock-keyhole"></i>
                                    <input name="t2" id="password" type="password" placeholder="Password"
                                           style="border-style: hidden;font-family: 'PT Sans Caption', sans-serif" required>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td style="font-size: large">&nbsp;</td>

                        </tr>
                    </table>

                    <div class="btn">
                        <input type="submit" class="btns" value="Sign in" style="font-family: 'PT Sans Caption', sans-serif">
                    </div>
                    <br>
                    <p style="font-family: 'PT Sans Caption', sans-serif">Don't have an account? <a
                                href="TeacherRegister.jsp">SignUp</a></p>
                </div>
            </div>

        </div>

    </div>
</form>
<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        if (username === "") {
            alert("Please enter your username");
            return false;
        }

        if (password === "") {
            alert("Please enter your password");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
<%
    try {
        String un, pass;
        String dbun = "";
        String dbpass = "";

        un = request.getParameter("t1");
        if (un != null) {
            pass = request.getParameter("t2");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Teachers where username = '" + un + "' And password= '" + pass + "'; ");

            while (rs.next()) {
                dbun = rs.getString("username");
                dbpass = rs.getString("password");
            }

            if (dbun.equals(un) && dbpass.equals(pass)) 
            {
                session.setAttribute("username", un);
                response.sendRedirect("/LMS_EduMe/TeacherpPanel.jsp");
            } 
            else {
                out.println("<script type=\"text/javascript\">"); // Start the script tag 
                        out.println("alert('Incorrect Password');"); // JavaScript code to generate an alert box 
                        out.println("window.location.href ='TeacherLogin.jsp';");
                        out.println("</script>");
            }

            st.close();
            con.close();
        }
    } catch (Exception e) {
        out.print(e);
    }
%>

