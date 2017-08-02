<%-- 
    Document   : two
    Created on : Feb 3, 2017, 1:25:08 PM
    Author     : Earth
--%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html lang=de>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Registration</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">
        <link rel="stylesheet" href="style.css" type="text/css"/>
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
                $('.myform').bValidator();
            });
            
            

//            var Check = function () {
//
//                if (document.getElementById('form_plainPassword_first').value ===
//                        document.getElementById('form_plainPassword_second').value) {
//
//                    document.getElementById('checkingpassword').style.color = 'green';
//                    document.getElementById('checkingpassword').innerHTML = 'Password Matched';
//                } else {
//                    document.getElementById('checkingpassword').style.color = 'red';
//                    document.getElementById('checkingpassword').innerHTML = 'Password does not Match';
//
//                }
//            };
            
//            var Cancel = function () {
//                  window.location = "register.jsp";
//            };
//
//            var Check2 = function () {
//
//                if (document.getElementById('form_plainPassword_first').value ===
//                        document.getElementById('form_plainPassword_second').value)
//                {
//
//                    window.location = "three.jsp";
//                }
//                else 
//                {
//                    alert("Please fill out the form correctly");
//                }
//            };
        </script>

    </head>
    <body>
        <%
            String id=request.getParameter("user_type");
            session.setAttribute("usertype",id);
            
 
            %>
        <div class="container-narrow">
            <div class="white-box">
                <div class="kinofreund_banner_center">
                    <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
                </div>
                <div class="row centered halfwidth">
                    <div class="progress progress-striped">
                        <div class="bar" style="width: 33%"></div>
                    </div>
                </div>

                <div class="row center-block">
                    <div class="span7 registration_container container">

                        <div class="span6" width="600px !important">
                            <h2>Registration:</h2>

                            <div id="form_error" class="alert alert-important" style="display:none;">
                                <b>Error:</b> Please fill in all fields below!
                            </div>

                            <form action="three.jsp"  method="post" id="reg_form" class="myform">

                                <ul><li>Fill up form.</li></ul>

                                <div><label for="form_username" class="required">User Name:</label><br><input type="text" id="form_username" name="form[username]" data-bvalidator="alphanum,required" maxlength="255" pattern=".{2,}" class="username_input" value="" /></div>

                                <div><label for="form_email" class="required">E-Mail-Address:</label><br><input type="email" id="form_email" name="form[email]" class="email_input" value="" /></div>

                                <div><label for="form_plainPassword_first" class="required">Password:</label><br><input type="password" id="passw" name="form[Password]" data-bvalidator="required" /></div>

                                <div width="800 !important"><label for="form_plainPassword_second" class="required">Confirm password:</label><br><input type="password" id="form_plainPassword_second" name="form[ConfirmPassword]" data-bvalidator="equalto[passw],required" /> <span id="checkingpassword"> </span></div>


                                <button type="button" id="form_back" name="form[back]" class="kf-btn kf-btn1" onclick="Cancel()">Cancel</button>
                                <button type="submit" id="form_next" name="form[next]" class="kf-btn kf-btn1">Enter</button>

                                <input type="hidden" id="form_user_type" name="form[user_type]" value="Kinobetreiber" /><input type="hidden" id="form_name" name="form[name]" /><input type="hidden" id="form_contact_person_firstname" name="form[contact_person_firstname]" /><input type="hidden" id="form_contact_person_lastname" name="form[contact_person_lastname]" /><input type="hidden" id="form_contact_person_mail" name="form[contact_person_mail]" /><input type="hidden" id="form_contact_person_phone" name="form[contact_person_phone]" /><input type="hidden" id="form_contact_str" name="form[contact_str]" /><input type="hidden" id="form_contact_zip" name="form[contact_zip]" /><input type="hidden" id="form_contact_city" name="form[contact_city]" /><input type="hidden" id="form_contact_phone" name="form[contact_phone]" /><input type="hidden" id="form_contact_mail" name="form[contact_mail]" /><input type="hidden" id="form_shipping_str" name="form[shipping_str]" /><input type="hidden" id="form_shipping_zip" name="form[shipping_zip]" /><input type="hidden" id="form_shipping_city" name="form[shipping_city]" /><input type="hidden" id="form_shipping_phone" name="form[shipping_phone]" /><input type="hidden" id="form_tech_contact_person_firstname" name="form[tech_contact_person_firstname]" /><input type="hidden" id="form_tech_contact_person_lastname" name="form[tech_contact_person_lastname]" /><input type="hidden" id="form_tech_contact_person_mail" name="form[tech_contact_person_mail]" /><input type="hidden" id="form_tech_contact_person_phone" name="form[tech_contact_person_phone]" /><input type="hidden" id="form__token" name="form[_token]" value="" /></form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript" src="/media/lib/jquery/jquery.js"></script>
        <script type="text/javascript" src="/media/lib/jquery-ui/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="/media/lib/jquery-ui/development-bundle/ui/i18n/jquery.ui.datepicker-de.js"></script>
        <script type="text/javascript" src="/media/lib/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/media/lib/typeahead.js/typeahead.min.js"></script>
        <script type="text/javascript" src="/media/lib/phpjs/date.js"></script>
        <script type="text/javascript" src="/media/lib/fleximg.js/scale.js"></script>
        <script type="text/javascript" src="/media/lib/bower_components/hammerjs/dist/jquery.hammer.js"></script>
        <script type="text/javascript" src="/media/lib/bs-switch/js/bootstrap-switch.js"></script>
        <script type="text/javascript">scale.init();</script>

        <script type="text/javascript">

//            var form_status = {
//                username: false,
//                email: false,
//                password: false
//            };
//
//            var username_status = {
//                init: function () {
//                    $('.username_input').on('input', function () {
//                        if (username_status.timer) {
//                            clearTimeout(username_status.timer);
//                        }
//                        username_status.timer = setTimeout(function () {
//                            username_status.idle();
//                            username_status.checkusername();
//                        }, 240);
//                    });
//
//                    if ($('.username_input').val() !== '') {
//                        username_status.idle();
//                        username_status.checkusername();
//                    }
//                },
//                checkusername: function () {
//                    $.get(
//                            '/register/checkusername',
//                            {
//                                username: $('.username_input').val()
//                            },
//                    function (response) {
//                        var result = JSON.parse(response);
//                        $('.username_status').addClass('label');
//                        if (result.success === true) {
//                            username_status.success_message(result.msg);
//                            form_status.username = true;
//                        }
//                        else {
//                            username_status.failure_message(result.msg);
//                            form_status.username = false;
//                        }
//                    }
//                    );
//                },
//                idle: function () {
//                    if ($('.username_status').length === 0) {
//                        $('.username_input').parent().css('position', 'relative');
//                        $('.username_input').parent().append($('<div class="username_status"></div>'));
//                    }
//                    $('.username_status').removeClass('label label-important label-success');
//                    $('.username_status').html('<img src="/images/spinner.gif">');
//                },
//                success_message: function (msg) {
//                    $('.username_status').html(msg);
//                    $('.username_status').removeClass('label label-important label-success');
//                    $('.username_status').addClass('label label-success');
//                },
//                failure_message: function (msg) {
//                    $('.username_status').html(msg);
//                    $('.username_status').removeClass('label label-important label-success');
//                    $('.username_status').addClass('label label-important');
//                }
//            };
//            var email_status = {
//                init: function () {
//                    $('.email_input').on('input', function () {
//                        if (email_status.timer) {
//                            clearTimeout(email_status.timer);
//                        }
//                        email_status.timer = setTimeout(function () {
//                            email_status.idle();
//                            email_status.checkemail();
//                        }, 240);
//                    });
//
//                    if ($('.email_input').val() !== '') {
//                        email_status.idle();
//                        email_status.checkemail();
//                    }
//                },
//                checkemail: function () {
//                    $.get(
//                            '/register/checkemail',
//                            {
//                                email: $('.email_input').val()
//                            },
//                    function (response) {
//                        var result = JSON.parse(response);
//
//                        $('.email_status').addClass('label');
//                        if (result.success === true) {
//                            email_status.success_message(result.msg);
//                            form_status.email = true;
//                        }
//                        else {
//                            email_status.failure_message(result.msg);
//                            form_status.email = false;
//                        }
//                    }
//                    );
//                },
//                idle: function () {
//                    if ($('.email_status').length === 0) {
//                        $('.email_input').parent().css('position', 'relative');
//                        $('.email_input').parent().append($('<div class="email_status"></div>'));
//                    }
//                    $('.email_status').removeClass('label label-important label-success');
//                    $('.email_status').html('<img src="/images/spinner.gif">');
//                },
//                success_message: function (msg) {
//                    $('.email_status').html(msg);
//                    $('.email_status').removeClass('label label-important label-success');
//                    $('.email_status').addClass('label label-success');
//                },
//                failure_message: function (msg) {
//                    $('.email_status').html(msg);
//                    $('.email_status').removeClass('label label-important label-success');
//                    $('.email_status').addClass('label label-important');
//                }
//            };
//            var password_status = {
//                init: function () {
//                    $('[type="password"]').on('input', function () {
//                        password_status.idle();
//                        password_status.checkpasswords();
//                    });
//
//                },
//                checkpasswords: function () {
//                    var passwords = [];
//
//                    $('[type="password"]').each(function (idx, item) {
//                        passwords.push($(item).val());
//                    });
//
//                    // WTF!?!
//                    if (passwords[1] !== '' && (passwords[0].length - 2) <= passwords[1].length) {
//                        $('.password_status').addClass('label');
//
//                        if (passwords[0] === passwords[1]) {
//                            password_status.success_message('&#10003;');
//                            form_status.password = true;
//                        }
//                        else {
//                            password_status.failure_message('&#10003; The two passwords do not match!');
//                            form_status.password = false;
//                        }
//                    }
//
//                },
//                idle: function () {
//                    if ($('.password_status').length === 0) {
//                        var password_fields = $('[type="password"]');
//                        $(password_fields[0]).parent().css('position', 'relative');
//                        $(password_fields[0]).parent().append($('<div class="password_status"></div>'));
//                    }
//                    $('.password_status').removeClass('label label-important label-success');
//                    $('.password_status').html('<img src="/images/spinner.gif">');
//                },
//                success_message: function (msg) {
//                    $('.password_status').html(msg);
//                    $('.password_status').removeClass('label label-important label-success');
//                    $('.password_status').addClass('label label-success');
//                },
//                failure_message: function (msg) {
//                    $('.password_status').html(msg);
//                    $('.password_status').removeClass('label label-important label-success');
//                    $('.password_status').addClass('label label-important');
//                }
//            };
//
//            (function () {
//
//                username_status.init();
//                email_status.init();
//                password_status.init();
//
//                $('#form_next').on('click', function () {
//                    if (form_status.username && form_status.email && form_status.password) {
//                        $('#form_error').hide();
//                    } else {
//                        $('#form_error').show();
//                        return false;
//                    }
//                });
//
//                $('#form_back').on('click', function () {
//                    $('#reg_form').attr('action', '/register');
//                    $('#reg_form').submit();
//                });
//            })(jQuery);
//        </script>

        <script type="text/javascript">//
//            var _paq = _paq || [];
//            _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
//            _paq.push(["setCookieDomain", ""]);
//            _paq.push(["trackPageView"]);
//            _paq.push(["enableLinkTracking"]);
//
//            (function () {
//                var u = (("https:" === document.location.protocol) ? "https" : "http") + "";
//                _paq.push(["setTrackerUrl", u + "piwik.php"]);
//                _paq.push(["setSiteId", "1"]);
//                var d = document, g = d.createElement("script"), s = d.getElementsByTagName("script")[0];
//                g.type = "text/javascript";
//                g.defer = true;
//                g.async = true;
//                g.src = u + "piwik.js";
//                s.parentNode.insertBefore(g, s);
//            })();
        </script></body>
</html>
</f:view>
