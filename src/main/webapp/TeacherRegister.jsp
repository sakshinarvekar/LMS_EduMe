<%-- 
    Document   : TeacherRegister
    Created on : Jun 25, 2023, 4:34:03 AM
    Author     : bhaktisunilnarvekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Teach on EduMe | SignUp </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/c807f93a6d.js" crossorigin="anonymous"></script>
        <style>
/*           *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;
           }     */

        .btn {
            text-align: center;


        }
        .btns{
            height:30px;
            width:168px;

        }
        .main{
            height:560px;
            width:350px;

            background-color: #ECF2FF;
            position: absolute;
            top: 50%;
            left: 50%;
            transform:translate(50%,-50%);
            text-align: center;
            border-radius: 8px;

            }
        input{
            height:30px;
            font-weight: bold;
            background-color: #D2DAFF;

        .login_table input{
            height: 33px; 
        }
        hr {
            border:3px solid #0954aa; 
            margin:5px 5px 0px 5px;        
        }

        .main h1{
            color: #0954aa;
            position: relative;
        }

        .main h1::after{
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

        .btn {
            border-style: none;
            border-radius: 10px; 
            background-color:#0954aa; 
            border-color: #CCCCFF; 
            font-weight: bold; 
            color: #FFFFFF; 
            border-spacing: inherit;
        }
        .container{
            background-image:url("E-learn.jpg");
        }
        .login_image{
            opacity: 0.5;

        }
        body{
            background-color: #0954aa;
        }
        
</style>
    </head>
    <body>
        <div class="login_image"><img src="/LMS_EduMe/img/teacher2.jpg" alt="alt" width="800" height="650"></div>
<form id="form1" action="" method="post">
    <br />
    <br />
    <div class="container">
    <div class="main">
        <hr/>
        <br />
        <h1>Sign Up</h1>
        
    <div>
        <table align="center" class="login_table" style="height: 167px">
            <tr>
                <td style="font-size: large">&nbsp;</td>
                
            </tr>
            <tr>
                
                <td style="background-color: #FFFFFF">
                    <div ><i class="fa-solid fa-user-tie"></i>                   
                    <input type="text" name="t1" placeholder="Username" style="border-style: inherit;" /></div></td>
                    
                
            </tr>
            <tr>
                <td style="font-size: large">&nbsp;</td>
                
            </tr>
            <tr>
                <td style="background-color: #FFFFFF"><div><i class="fa-solid fa-envelope"></i>
                    <input type="text" name="t2" placeholder="Email" style="border-style: hidden;" /></div></td>
               
            </tr>
            <tr>
                <td style="font-size: large">&nbsp;</td>
               
            </tr>
            <tr>
                <td style="background-color: #FFFFFF"><div><i class="fa-solid fa-unlock-keyhole"></i>
                    <input type="password" name="t3" placeholder="Password"  style="border-style: hidden;" /></div></td>
                
            </tr>
            <tr>
                <td style="font-size: large">&nbsp;</td>
               
            </tr>
            <tr>
                <td style="background-color: #FFFFFF"><div><i class="fa-solid fa-unlock-keyhole"></i>
                    <input type="password" name="t4" placeholder="Confirm Password"  style="border-style: hidden;" /></div></td>
                
            </tr> 
            <tr>
                <td style="font-size: large">
                    &nbsp;</td>
                
            </tr>                                      
            <tr>
                <td style="background-color: #FFFFFF"><div><i class="fa-solid fa-mobile"></i>
                    <input type="text" name="t5" placeholder="Mobile No" style="border-style: hidden;" /></div></td>
                
            </tr>                                      
        </table>
        <br />
        <br />    
        <div class="btn" >
            <input type="submit"  value="Sign up"/>
        </div>
        <br>
        <p style="font-family: 'PT Sans Caption', sans-serif">Already have an account? <a href="TeacherLogin.jsp">SignIn</a></p>
    </div>
    </div>
</div>
</form>
    </body>
</html>
