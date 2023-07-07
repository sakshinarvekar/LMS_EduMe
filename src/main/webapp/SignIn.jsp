<%-- 
    Document   : SignIn
    Created on : Jun 29, 2023, 2:43:32 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edume | SignIn</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.js"></script>

        <style>
        @import url("https://fontawesome.com/");
        @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
/*        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'PT Sans Caption', sans-serif;*/
        
            .btn {
        text-align: center;


        }
        .btns{
            height:30px;
            width:168px;

        }
        .main{
            height:480px;
            width:360px;

            background-color: #ECF2FF;
            /* background-color: #BAD7E9; */
            top: 50%;
            left: 30%;
            text-align: center;
            border-radius: 8px;
            float:right;
            transform:translate(80%,10%);

            }
        input{
            height:26px;
            font-weight: bold;
            background-color: #D2DAFF;

        }

    
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
            background: #0954aa;
            position: absolute;
            bottom: -12px;
            left: 50%;
            transform: translateX(-50%);
        }

        .btns {
            border-style: none;
            border-radius: 10px; 
            background-color:#0954aa; 
            border-color: #CCCCFF; 
            font-weight: bold; 
            color: #FFFFFF; 
            border-spacing: inherit;
        }
        .login_main{
            display: flex;
            align-items: center;
            padding: 18px;
        }
        .login_image{
            float: left;
/*            opacity: 0.5;*/
            transform:translate(20%,5%);
            margin-top: 20px;

        }
        .login_form{
            float: right;
        }
        </style>
        
    </head>
    <body>
        <form action="" method="post">
            <div class="login_main">
    <div class="login_image"><img src="/EduMe_Project/img/E-learn.jpg" alt="img" width="650" height="550"></div>
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
                    <div ><i class="fa-solid fa-user-tie"></i>                   
                    <input  name="t1" type="text" placeholder="Username" required style="border-style: inherit;font-family: 'PT Sans Caption', sans-serif" /></div></td> 
                    
                
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
                    <input name="t2" type="password" placeholder="Password" required  style="border-style: hidden;font-family: 'PT Sans Caption', sans-serif" /></div></td>
                
            </tr>                                      
            <tr>
                <td style="font-size: large">
                    &nbsp;</td>
                
            </tr>                                                                       
        </table>
            
        <div class="btn" >
            <input type="submit" class="btns" onclick="handleButtonClick()" value="Sign in" style="font-family: 'PT Sans Caption', sans-serif"/>
        </div>

        <br>
        <p style="font-family: 'PT Sans Caption', sans-serif">Don't have an account? <a href="newMix.jsp">SignUp</a></p>
       
        <p style="font-family: 'PT Sans Caption', sans-serif">Are you a teacher? <a href="TeacherLogin.jsp">Teacher SignIn</a></p>
   
    </div>
    </div>

</div>
</div>
        </form>
    </body>
</html>

<%
     String un, pass;
            String dbun = "";
            String dbpass = "";
            un=request.getParameter("t1");
            pass=request.getParameter("t2");
     
            if(un!=null)
            {
            
           
            try
                {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
                    Statement st= con.createStatement();
                    ResultSet rs = st.executeQuery("select * from SignUp where username = '"+un+"' And pass= '"+pass+"'; ");

                    while(rs.next())
                    {                 
                     dbun = rs.getString(1);
                     dbpass = rs.getString(3); 
                    }

                    if(dbun.equals(un) && dbpass.equals(pass))
                    {              
                        //HttpSession session = request.getSession();
                        session.setAttribute("username", un);
                        response.sendRedirect("/LMS_EduMe/HomePage.jsp");

                    }
                    else if(un.equals("admin")&& pass.equals("admin"))
                    {
                        response.sendRedirect("/LMS_EduMe/AdminPanel.jsp");
                    }
                    else 
                    {
                       out.println("<script type=\"text/javascript\">"); // Start the script tag 
                        out.println("alert('Incorrect Password');"); // JavaScript code to generate an alert box 
                        out.println("window.location.href = 'SignIn.jsp';");
                        out.println("</script>");
                    }
                 
                st.close();
                con.close();
               
}
            catch(Exception e)
            {
            out.print(e);
            }

}

%>
 
