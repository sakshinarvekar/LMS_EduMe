<%-- 
    Document   : TeacherRegister
    Created on : Jun 25, 2023, 4:34:03 AM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teach on EduMe | SignUp</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/c807f93a6d.js" crossorigin="anonymous"></script>
    <style>
        .btn {
            text-align: center;
        }

        .btns {
            height: 30px;
            width: 138px;
        }

        .main {
            background-color: #ECF2FF;
            height: 660px;
            width: 350px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(50%, -50%);
            text-align: center;
            border-radius: 8px;
        }

        input {
            height: 30px;
            font-weight: bold;
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
            background: #3e54ac;
            position: absolute;
            bottom: -12px;
            left: 50%;
            transform: translateX(-50%);
        }

        .btn {
            border-style: none;
            border-radius: 10px;
            background-color: #0954aa;
            border-color: #ccccff;
            font-weight: bold;
            color: #ffffff;
            border-spacing: inherit;
        }

        .container {
            background-image: url("E-learn.jpg");
        }

        .login_image {
            opacity: 0.5;
        }

        body {
            background-color: #ffffff;
        }

        /* Custom Styles */
        .form-label {
            font-weight: bold;
            color: #0954aa;
        }

        .form-input {
            border: 1px solid #0954aa;
            border-radius: 5px;
            padding: 8px;
            font-weight: bold;
            color: #0954aa;
        }

        .form-input:focus {
            outline: none;
            border-color: #3e54ac;
        }

        .form-submit-btn {
            background-color: #0954aa;
            color: #ffffff;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .form-submit-btn:hover {
            background-color: #3e54ac;
        }

        .form-login-link {
            color: #0954aa;
            font-weight: bold;
            text-decoration: none;
        }

        .form-login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login_image">
        <img src="/LMS_EduMe/img/teacher2.jpg" alt="alt" width="800" height="650">
    </div>
    <form id="form1" action="" method="post">
        <br />
        <br />
        <div class="container">
            <div class="main">
                <hr />
                <br />
                <h1>Sign Up</h1>
                <div>
                    <table align="center" class="login_table" style="height: 167px">
                        <tr>
                            <td style="font-size: large">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #ffffff">
                                <div>
                                    <i class="fa-solid fa-user-tie"></i>
                                    <input type="text" name="t1" placeholder="Username" class="form-input" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #ffffff">
                                <div>
                                    <i class="fa-solid fa-unlock-keyhole"></i>
                                    <input type="password" name="t2" placeholder="Password" class="form-input" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: large">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #ffffff">
                                <div>
                                    <i class="fa-solid fa-unlock-keyhole"></i>
                                    <input type="password" name="t3" placeholder="Confirm Password" class="form-input" required>
                                </div>
                            </td>
                        </tr> 
                        <tr>
                            <td style="font-size: large">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #ffffff">
                                <div>
                                    <i class="fa-solid fa-mobile"></i>
                                    <input type="text" name="t4" placeholder="Mobile No" class="form-input" required>
                                </div>
                            </td>
                        </tr> 
                        <tr>
                            <td style="font-size: large">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #ffffff">
                                <div>
                                    <i class="fa-solid fa-envelope"></i>
                                    <input type="text" name="t5" placeholder="Email" class="form-input" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />    
                    <div class="btn">
                        <input type="submit" value="Sign up" class="form-submit-btn">
                    </div>
                    <br>
                    <p style="font-family: 'PT Sans Caption', sans-serif">Already have an account? <a href="TeacherLogin.jsp" class="form-login-link">SignIn</a></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<%
    try {
        String un, em, pass, mob, cpass;
        un = request.getParameter("t1");
        if (un != null) {
            un = request.getParameter("t1");
            pass = request.getParameter("t2");
            cpass = request.getParameter("t3");
            mob = request.getParameter("t4");
            em = request.getParameter("t5");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
            Statement st = con.createStatement();
            st.execute("insert into Teachers values(default,'" + un + "','" + pass + "','" + cpass + "','" + mob + "','" + em + "');");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registered successfully!!');");
            out.println("window.location.href = '/LMS_EduMe/TeacherLogin.jsp';");
            out.println("</script>");

            st.close();
            con.close();
        }
    } catch (Exception e) {
        out.print(e);
    }
%>
