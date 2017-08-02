<%-- 
    Document   : three
    Created on : Feb 3, 2017, 1:25:43 PM
    Author     : Earth
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=de>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">

        <script>
            var Back = function () {
                window.location = "two.jsp";
            };

        </script>
    </head>
    <body>
        <%
            String user = request.getParameter("form[username]");
            String email = request.getParameter("form[email]");
            String password = request.getParameter("form[Password]");
            String confirm_password = request.getParameter("form[ConfirmPassword]");
            HttpSession sess=request.getSession();
//            sess.setAttribute("user_name", user);
//            sess.setAttribute("e_mail", email);
            String user_type=(String)sess.getAttribute("usertype");
            String tag="";
            if("1".equals(user_type))
            {
                tag="Company";
            }
            
//            out.println("hey "+user);
//            out.println("hey "+email);
//            out.println("hey "+password);
//            out.println("hey "+confirm_password);
            

            try {
                ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
                Statement st = C1.createStatement();
                
                String quer = "Insert into registration(User_Name,E_Mail,Password,Confirm_Password,user_type) values('" + user + "','" + email + "','" + password + "','" + confirm_password + "','" + user_type + "')";
                st.executeUpdate(quer);
                
                String getid="select * from registration order by user_id desc limit 1";
                ResultSet rs=st.executeQuery(getid);
                int id=0;
                while(rs.next())
                {
                    id=rs.getInt("user_id");
                }
                
                session.setAttribute("userid", id);
                

            } catch (Exception e) {

            }


        %>




        <div class="container-narrow">
            <div class="white-box">
                <div class="kinofreund_banner_center">
                    <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt=""></a>
                </div>
                <div class="row centered halfwidth">
                    <div class="progress progress-striped">
                        <div class="bar" style="width: 66%"></div>
                    </div>
                </div>

                <div class="row centered halfwidth">
                    <div class="span7 registration_container container">
                        <div class="span6">
                            <form action="Submit.jsp" method="post" id="reg_form">
                                <input type="hidden" name="stepThree" value="true">

                                <ul><li>This form should not contain additional fields.</li></ul>

                                <fieldset>
                                    <legend>General</legend>
                                    <div><label for="form_name" class="required"><%=tag%> Name</label><br><input type="text" id="form_name" name="form[name]" required="required" maxlength="255" class="span5" /></div>

                                    <div><label for="form_contact_str" class="required">Address</label><br><input type="text" id="form_contact_str" name="form[contact_str]" required="required" maxlength="255" class="span5" /></div>

                                    <div class="row">
                                        <div class="span2">
                                            <div><label for="form_contact_zip" class="required">Postcode</label>
                                                <input type="text" id="form_contact_zip" name="form[contact_postcode]" required="required" maxlength="255" class="span2" /></div>
                                        </div>
                                        <div class="span4">
                                            <div><label for="form_contact_city" class="required">Place</label><br>
                                                <input type="text" id="form_contact_city" name="form[contact_place]" required="required" maxlength="255" /></div>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="form_contact_country" class="required">Land</label>
                                        <div><input type="text" id="form_contact_country" name="form[contact_land]" required="required" maxlength="255" /></div>
                                        <div><label for="form_contact_phone" class="required">Telephone</label>
                                            <div><input type="text" id="form_contact_phone" name="form[contact_phone]" required="required" maxlength="255" /></div>
                                            <div><label for="form_contact_mail">E-Mail</label><br><input type="text" id="form_contact_mail" name="form[contact_mail]" class="span5" /></div>
                                        </div>
                                </fieldset>
                                <br>
                                <fieldset>
                                    <legend>Contact Person</legend>

                                    <div class="row">
                                        <div class="span2">
                                            <div><label for="form_contact_person_firstname">First given name</label><input type="text" id="form_contact_person_firstname" name="form[contact_person_firstname]" maxlength="255" class="span2" /></div>
                                        </div>
                                        <div class="span4">
                                            <div><label for="form_contact_person_lastname">Surname</label><br><input type="text" id="form_contact_person_lastname" name="form[contact_person_lastname]" maxlength="255" /></div>
                                        </div>
                                    </div>

                                    <div><label for="form_contact_person_phone">Telephone</label><br><input type="text" id="form_contact_person_phone" name="form[contact_person_phone]" maxlength="255" /></div>
                                    <div><label for="form_contact_person_mail">E-Mail</label><br><input type="text" id="form_contact_person_mail" name="form[contact_person_mail]" class="span5" /></div>
                                </fieldset>
                                <br>
                                <fieldset>
                                    <legend>Technical contact person</legend>
                                    <div class="row">
                                        <div class="span2" style="margin-left: 16px !important">
                                            <div><label for="form_tech_contact_person_firstname">First given name</label><input type="text" id="form_tech_contact_person_firstname" name="form[tech_contact_person_firstname]" maxlength="255" class="span2" /></div>
                                        </div>
                                        <div class="span4">
                                            <div><label for="form_tech_contact_person_lastname">Surname</label><br><input type="text" id="form_tech_contact_person_lastname" name="form[tech_contact_person_lastname]" maxlength="255" /></div>
                                        </div>
                                    </div>

                                    <div><label for="form_tech_contact_person_phone">Telephone</label><br><input type="text" id="form_tech_contact_person_phone" name="form[tech_contact_person_phone]" maxlength="255" /></div>
                                    <div><label for="form_tech_contact_person_mail">E-Mail</label><br><input type="text" id="form_tech_contact_person_mail" name="form[tech_contact_person_mail]" class="span5" /></div>
                                </fieldset>
                                <br>
                                <fieldset>
                                    <legend>Delivery address</legend>
                                    <div><label for="form_shipping_name">Name / Description</label><br><input type="text" id="form_shipping_name" name="form[shipping_name]" maxlength="255" class="span5" /></div>
                                    <div><label for="form_shipping_str">Address</label><br><input type="text" id="form_shipping_str" name="form[shipping_str]" maxlength="255" class="span5" /></div>

                                    <div class="row">
                                        <div class="span2">
                                            <div><label for="form_shipping_zip">Postcode</label><input type="text" id="form_shipping_zip" name="form[shipping_postcode]" maxlength="255" class="span2" /></div>
                                        </div>
                                        <div class="span4">
                                            <div><label for="form_shipping_city">Place</label><br><input type="text" id="form_shipping_city" name="form[shipping_city]" maxlength="255" /></div>
                                        </div>
                                    </div>

                                    <div><label for="form_shipping_country">Land</label><br><input type="text" id="form_shipping_country" name="form[shipping_land]" maxlength="255" /></div>
                                </fieldset>

                                <br>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td style="white-space: nowrap;">
                                                <button type="button" id="form_back" name="form[back]" class="kf-btn kf-btn1" onclick="Back()">Back</button>
                                                <button type="submit" id="form_next" name="form[next]" class="kf-btn kf-btn1">Enter</button>
                                            </td>
                                            <td style="padding-left: 34px;">
                                                By clicking on "Next" Do you accept the
                                                <a href="" target="_blank" style="color:hsl(200,100%,40%)">Terms of Use</a>.
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" id="form_user_type" name="form[user_type]" value="Kinobetreiber" /><input type="hidden" id="form_username" name="form[username]" value="" />
                                <input type="hidden" id="form_plainPassword_second" name="form[plainPassword][second]" required="required" value="" />
                                <input type="hidden" id="form__token" name="form[_token]" value="d1a5a5c5ac2f86a715aa28b32c0fc70a3a49a3e5" /></form>
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
            (function () {
                $('#form_back').on('click', function () {
                    $('#reg_form').attr('action', '/register/two');
                    $('#reg_form').submit();
                });
            })(jQuery);
        </script>

        <script type="text/javascript">
            var _paq = _paq || [];
            _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
            _paq.push(["setCookieDomain", ""]);
            _paq.push(["trackPageView"]);
            _paq.push(["enableLinkTracking"]);

            (function () {
                var u = (("https:" === document.location.protocol) ? "https" : "http") + "";
                _paq.push(["setTrackerUrl", u + "piwik.php"]);
                _paq.push(["setSiteId", "1"]);
                var d = document, g = d.createElement("script"), s = d.getElementsByTagName("script")[0];
                g.type = "text/javascript";
                g.defer = true;
                g.async = true;
                g.src = u + "piwik.js";
                s.parentNode.insertBefore(g, s);
            })();
        </script> 

    </body>
</html>

