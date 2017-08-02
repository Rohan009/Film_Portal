<%@page import="java.sql.*"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Data Pool</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="js/bootstrap.min.js">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <style>

            table th {
                text-align: center;
            }
        </style>



    </head>

    <body>


        <%

            String webdownload = request.getParameter("web_download");
            String screenp = request.getParameter("screenpwd");
            String screendownload = request.getParameter("screen_download");
            String pressp = request.getParameter("presspwd");
            String pressdownload = request.getParameter("press_download");
            String userid = (String) session.getAttribute("userid");

//            out.println("hey " + webdownload + screenp + screendownload + pressp + pressdownload);
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();
            String idquery = "select Film_id from film_information order by Film_id desc limit 1";
            ResultSet rs = st1.executeQuery(idquery);

            int id = 0;

            while (rs.next()) {
                id = rs.getInt("Film_id");
            }
                

            String getstatus = "select status from film_information where Film_id='" + id + "'";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1 = st2.executeQuery(getstatus);
            String stat = "";
            while (rs1.next()) {
                stat = rs1.getString("status");
            }
            stat = stat.concat(",2,3");

            String sendstatus = "update film_information set status='" + stat + "' where Film_id='" + id + "'";
            st3.executeUpdate(sendstatus);

            String query = "insert into settings_detail values('" + webdownload + "','" + screenp + "','" + screendownload + "','" + pressp + "','" + pressdownload + "','" + userid + "','" + id + "')";
            st.executeUpdate(query);


        %>
        
         <jsp:include page="menu.jsp"/>
                <div id="wrapper">
                    <div id="page-content-wrapper">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-20">
                                    <h1 id="t">Data Pool</h1>
        
        
                                </div>
                                <div class="downloadarea">
                                    <div class="navbar">
                <div style="margin-top: 50px"><button class='kf-btn kf-btn2' type="button" onclick="window.location.href='Trailer.jsp'">Next</button></div>

        
                                    </div>
        
        
        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    <center>
    </center>
</body>
</html>
