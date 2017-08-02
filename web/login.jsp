<%-- 
    Document   : login
    Created on : Feb 3, 2017, 1:26:33 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang=de>

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Login</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">

    </head>
    <body data-gr-c-s-loaded="true">
        <script>
        <%
         
            String data=request.getParameter("login");
            int check=1;
            if("fail".equals(data))
            {
                check=0;
            }
            
         %>
             var ch=<%=check%>;
             if(ch===0)
             {
                 alert("Invalid Username or Password");
             }
         </script>

        <div class="kinofreund_banner_center" style="margin-top: 8em">
            <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
        </div>

        <div class="login_container jumbotron">
            <form action="login_check" method="post" class="loginForm">
                
                <input type="text" id="username" name="mail" placeholder="E-Mail" required="required" style="height: 24px">
                <input type="password" id="password" name="password" placeholder="Password" required="required" style="height: 24px">
               
                <div>
                    <font><font><input class="kf-btn kf-btn2" type="submit" id="_submit" name="_submit" value="log in"></font></font>
                </div>
            </form>

            <a href="register.jsp"><font><font>Register</font></font></a><font><font> -
            </font></font><a href="request.jsp"><font><font>Forgot your password?</font></font></a>
        </div>


    </body>
</html>

