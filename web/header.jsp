<%-- 
    Document   : header
    Created on : 13 Jul, 2017, 5:27:49 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
         <div class="header_container">
            <div class="container-narrow">
                <div>
                    <ul class="nav nav-pills pull-right">

                        <li id="sign"><a href="register.jsp">Sign Up</a></li><li id="login"><a href="login.jsp">Login</a></li>
                        <li id="logout"><a href="logout">Logout</a></li>	</ul>
                    <a class="blue_bold_font" href="index.jsp"><img src="images/logo.png" width=151 height=80 alt="Company Logo"></a>
                </div>	</div>
        </div>
        <script type="text/javascript">
            <%
              String user_type = request.getParameter("ut");
            int userid = request.getIntHeader("uid");
                %>
                    
            var type =<%=user_type%>
            $("#logout").hide();
            if (type === 0)
            {

                $("#sign").hide();
                $("#login").hide();
                $("#logout").show();

            }
           



        </script>
    </body>
</html>
