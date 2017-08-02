<%-- 
    Document   : Submit
    Created on : 26 Jun, 2017, 4:36:18 PM
    Author     : Lenovo
--%>

<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">  
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">
    </head>
    <body>
        <%
            String Gen_name = request.getParameter("form[name]");
            String Gen_add = request.getParameter("form[contact_str]");
            String Gen_postcode = request.getParameter("form[contact_postcode]");
            String Gen_place = request.getParameter("form[contact_place]");
            String Gen_land = request.getParameter("form[contact_land]");
            String Gen_phone = request.getParameter("form[contact_phone]");
            String Gen_email = request.getParameter("form[contact_mail]");
            session.setAttribute("user_mail", Gen_email);
//            int uid=(int)session.getAttribute("userid");
            String utype=(String)session.getAttribute("usertype");

            String Contact_name = request.getParameter("form[contact_person_firstname]");
            String Contact_lastname = request.getParameter("form[contact_person_lastname]");
            String Contact_phone = request.getParameter("form[contact_person_phone]");
            String Contact_mail = request.getParameter("form[contact_person_mail]");

            String Technical_name = request.getParameter("form[tech_contact_person_firstname]");
            String Technical_lastname = request.getParameter("form[tech_contact_person_lastname]");
            String Technical_phone = request.getParameter("form[tech_contact_person_phone]");
            String Technical_mail = request.getParameter("form[tech_contact_person_mail]");

            String Delivery_name = request.getParameter("form[shipping_name]");
            String Delivery_add = request.getParameter("form[shipping_str]");
            String Delivery_postcode = request.getParameter("form[shipping_postcode]");
            String Delivery_city = request.getParameter("form[shipping_city]");
            String Delivery_land = request.getParameter("form[shipping_land]");

            try {
               ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
                Statement st = C1.createStatement();
                Statement st1 = C1.createStatement();
                String query="select user_id from registration order by user_id desc limit 1";
                ResultSet rs=st1.executeQuery(query);
                int id=0;
                while(rs.next())
                {
                    id=rs.getInt("user_id");
                }
                
                String info1 = "insert into general values('" + Gen_name + "','" + Gen_add + "','" + Gen_postcode + "','" + Gen_place + "','" + Gen_land + "','" + Gen_phone + "','" + Gen_email + "'," + id + ",'" + utype + "')";
                String info2 = "insert into contact_person values('" + Contact_name + "','" + Contact_lastname + "','" + Contact_phone + "','" + Contact_mail + "'," + id + ",'" + utype + "')";
                String info3 = "insert into technical_person values('" + Technical_name + "','" + Technical_lastname + "','" + Technical_phone + "','" + Technical_mail + "'," + id + ",'" + utype + "')";
                String info4 = "insert into delivery_address values('" + Delivery_name + "','" + Delivery_add + "','" + Delivery_postcode + "','" + Delivery_city + "','" + Delivery_land + "'," + id + ",'" + utype + "')";

                st.addBatch(info1);
                st.addBatch(info2);

                st.addBatch(info3);

                st.addBatch(info4);
                st.executeBatch();
                session.removeAttribute("usertype");

            } catch (Exception e) {

            }
            


        %>

        <div class="container-narrow">
            <div class="white-box">
                <div class="kinofreund_banner_center">
                    <a href="index.jsp"><img src="images/logo.png" width=151 height=90 alt="Company Logo"></a>
                </div>
                <center>
                    <div class="row centered halfwidth">
                        <div class="regComplete">
                            <h3><font><font>Please confirm the link in your inbox!</font></font></h3>
                            <p class="regBigger"><font><font>
                                We sent an email with the confirmation </font></font><b style="white-space: nowrap"><font><font>link</font></font></b><font><font> to
                                </font><b style="white-space: nowrap"><font><% out.println(Gen_email);%></font></b><font> 
                                </font></font></p>
                            <p class="regSmaller"><font><font>
                                The verification link verifies your email address. </font><font>If you do not receive the mail within a few minutes, please check your spam folder.
                                </font></font></p>
                        </div>
                    </div>
                </center>
            </div>
        </div>

        <%
                                 
       
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
        try {
            msg.setFrom(new InternetAddress("hemnanirohan@gmail.com"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(Gen_email));

            msg.setSubject("Verification to Film Portal");

            msg.setText("Click the Below link to verify your account http://localhost:8080/Film_Portal/Confirmation_index.jsp");

            Transport.send(msg);
           
            
        } catch (Exception e) {

        }
           
        %>
    </body>
</html>
