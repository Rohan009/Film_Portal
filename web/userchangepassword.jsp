<%-- 
    Document   : request
    Created on : Feb 3, 2017, 1:24:31 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang=de>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Reset Password</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="media/lib/jquery-ui/css/ui-lightness/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="media/lib/bs-switch/stylesheets/bootstrap-switch.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.bvalidator.js"></script>
        <link href="css/bvalidator.css" rel="stylesheet" type="text/css" />

        <script>

            var options6 = {
                offset: {x: 5, y: -2},
                position: {x: 'right', y: 'center'},
                template: '<div class="{errMsgClass}">{message}</div>',
                showCloseIcon: false,
                classNamePrefix: 'ex6_',
                validateOn: 'keyup'
            };

            $(document).ready(function () {
                $('#myform').bValidator();
            });


            var Check = function () {

                if (document.getElementById('password').value ===
                        document.getElementById('confirm_password').value) {

                    document.getElementById('checkingpassword').style.color = 'green';
                    document.getElementById('checkingpassword').innerHTML = 'Password Matched';
                } else {
                    document.getElementById('checkingpassword').style.color = 'red';
                    document.getElementById('checkingpassword').innerHTML = 'Password does not Match';

                }
            };

            var Check2 = function () {
                if (document.getElementById('password').value ===
                        document.getElementById('confirm_password').value)
                {



                    var pwd = document.getElementById("password").value;
                    var cpwd = document.getElementById("confirm_password").value;
                    alert("Your Password has been changed successfully");

//                    var xmlhttp = new XMLHttpRequest();
//                  
//
//                    var uri = encodeURIComponent(pwd);
//                    var uri1 = encodeURIComponent(cpwd);
//                    alert(uri);
//                    xmlhttp.open("GET", "UpdatePassword?password=" + uri + "&confirm_password=" + uri1, true);
//                    xmlhttp.send();
//                    window.location = "UpdatePassword";

                    return false;
                }
                else
                {
                    alert("Please fill out the form correctly");
                }

            };
        </script>
    </head>
    <body>
        <div class="container-narrow">
            <div class="white-box">
                <div class="kinofreund_banner_center">
                    <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
                </div>
                <div class="row centered" style="margin-top: 5em; margin-left: 2em; margin-right: 2em">

                    <form action="UpdatePassword" method="post" id="myform" class="fos_user_resetting_request">
                        <div>

                            <h4>Change Password</h4>

                            <p>New Password.</p>
                            <input type="password" name="new_password" id="pass"  data-bvalidator="required"/>
                            <p>Confirm Password.</p>
                            <input type="password" name="con_password" data-bvalidator="equalto[pass],required"/> <span id="checkingpassword"> </span></div>
                </div>
                <div>
                    <input type="submit" class="kf-btn kf-btn2" value="Change Password" name="confirm_pwd_button" />
                </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>