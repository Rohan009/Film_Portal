<%-- 
    Document   : request
    Created on : Feb 3, 2017, 1:24:31 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<html lang=de>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Reset Password</title>


        <link rel="stylesheet" href="css/style.css?v=69fe4546201617ece68a2e2907e3c3f6">
        <link rel="stylesheet" href="media/lib/jquery-ui/css/ui-lightness/jquery-ui-1.10.3.custom.min.css">
        <link rel="stylesheet" href="media/lib/bs-switch/stylesheets/bootstrap-switch.css">

        <script>

            function forward()
            {
            <%  
                    String mail_pwd=request.getParameter("mail_id");
                    session.setAttribute("mail", mail_pwd);
                    final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                    // Get a Properties object
                    Properties props = System.getProperties();
                    props.setProperty("mail.smtp.host", "smtp.gmail.com");
                    props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
                    props.setProperty("mail.smtp.socketFactory.fallback", "false");
                    props.setProperty("mail.smtp.port", "465");
                    props.setProperty("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.debug", "true");
                    props.put("mail.store.protocol", "pop3");
                    props.put("mail.transport.protocol", "smtp");
                    final String username = "hemnanirohan@gmail.com";//
                    final String password = "rohann109";
                    Session ss = Session.getInstance(props, new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

                    // -- Create a new message --
                    Message msg = new MimeMessage(ss);
                    String mail = request.getParameter("mail_id");
                    try {
                        msg.setFrom(new InternetAddress("hemnanirohan@gmail.com"));
                        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));

                        msg.setSubject("Link to Change Password");

                        msg.setText("Click the Below link to verify your account http://localhost:8080/Film_Portal/userchangepassword.jsp");

                        Transport.send(msg);

                    } catch (Exception e) {

                    }
            %>
                    
                    alert("Link has been sent to your mail. Please refer the link in your mail to change your password");
                  
            }


        </script>



    </head>
    <body>
        <div class="container-narrow">
            <div class="white-box">
                <div class="kinofreund_banner_center">
                    <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
                </div>
                <div class="row centered" style="margin-top: 5em; margin-left: 2em; margin-right: 2em">

                    <form action="#" onsubmit="return forward();
                            return false;" method="get" class="fos_user_resetting_request">
                        <div>
                            <h4>Reset Password</h4>
                            <p>Please enter your E-mail id to reset the password.</p>
                            <input type="email" id="username" name="mail_id" required="required" />
                        </div>
                        <div>
                            <input type="submit" class="kf-btn kf-btn2" value="Reset Password" />
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <script type="text/javascript" src="media/lib/jquery/jquery.js"></script>
        <script type="text/javascript" src="media/lib/jquery-ui/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="media/lib/jquery-ui/development-bundle/ui/i18n/jquery.ui.datepicker-de.js"></script>
        <script type="text/javascript" src="media/lib/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="media/lib/typeahead.js/typeahead.min.js"></script>
        <script type="text/javascript" src="media/lib/phpjs/date.js"></script>
        <script type="text/javascript" src="media/lib/fleximg.js/scale.js"></script>
        <script type="text/javascript" src="media/lib/bower_components/hammerjs/dist/jquery.hammer.js"></script>
        <script type="text/javascript" src="media/lib/bs-switch/js/bootstrap-switch.js"></script>


        <script type="text/javascript">
//            var _paq = _paq || [];
//            _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
//            _paq.push(["setCookieDomain", "*.*"]);
//            _paq.push(["trackPageView"]);
//            _paq.push(["enableLinkTracking"]);
//
//            (function () {
//                var u = (("https:" == document.location.protocol) ? "https" : "http") + ":js/piwik/";
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