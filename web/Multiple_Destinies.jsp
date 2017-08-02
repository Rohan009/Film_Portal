<%-- 
    Document   : Multiple Destinies
    Created on : Feb 6, 2017, 1:03:36 PM
    Author     : Earth
--%>
<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Multiple Destinies</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/simple-sidebar.css" rel="stylesheet">
    </head>

    <body>

        <%
            String id=request.getParameter("film");
            session.setAttribute("film_id", id);
//
//            String Title = request.getParameter("t");
//            String Cinema_start = request.getParameter("c");
//            String Genre = request.getParameter("g");
//            String Length = request.getParameter("l");
//            String Director = request.getParameter("d");
//            String Year = request.getParameter("y");
//            String Actor = request.getParameter("a");
//            String Production_country = request.getParameter("p");
//            String Website = request.getParameter("w");
//            String Language = request.getParameter("l");
//
//            String Subtitle = request.getParameter("s");
//            String Fram_rate = request.getParameter("fr");
//            String Picture_format = request.getParameter("pf");
//            String Audio_format = request.getParameter("af");
//
//            String Version = request.getParameter("v");
//            String Rated = request.getParameter("r");
//            String Video_format = request.getParameter("vf");
//            String Dvd_start = request.getParameter("ds");
//
//            String Vod_start = request.getParameter("vs");
//            String Description = request.getParameter("des");
//
////            out.println("hey "+Title+" "+Cinema_start+Genre+Length+Director+Year+Version+Description);
//            Class.forName("com.mysql.jdbc.Driver");
//            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/film_portal?", "root", "");
//            Statement st = C1.createStatement();
//
//            String query = "insert into film_information values('" + Title + "','" + Cinema_start + "','" + Genre + "','" + Length + "','" + Director + "','" + Year + "','" + Actor + "','" + Production_country + "','" + Website + "','" + Language + "','" + Subtitle + "','" + Fram_rate + "','" + Picture_format + "','" + Audio_format + "','" + Version + "','" + Rated + "','" + Video_format + "','" + Dvd_start + "','" + Vod_start + "','" + Description + "')";
//            st.executeUpdate(query);
        %>


        <jsp:include page="menu.jsp"/>

        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                        
                            <form action="Data_Pole.jsp" method="get">
                            <h1>Multiple Destinies</h1>
                            <br>
                            <p></p>
                            <label>Web Trailer</label> 
                            <p><input type="checkbox" name="web_download" value="on" /> Download Link</p>
                            <br>
                            <br>
                            <label>Screen</label> 
                            <br>
                            <input type="checkbox" value="on" id="checkscreen" onchange="docheckscreen(this)"/> Protect screener with password:  <input type="password" name="screenpwd" id="sp" readonly/>
                            <br>
                            <br>
                            <p><input type="checkbox" name="screen_download" value="on" /> Download Link</p>
                            <br>
                            <br>
                            <br>
                            <label>Press Material</label> 
                            <br>
                            <input type="checkbox"  value="on" id="checkpress" onchange="docheckpress(this)"/> Press Material with Password Protection : <input type="password" name="presspwd" id="pp" readonly/>
                             <br>
                            <br>
                            <p><input type="checkbox" name="press_download" value="on" /> Download Link</p>
                            <div style="margin-top: 20px;margin-left: 50px">
                            <button class='btn-default' type="submit">Save</button>
                            </div>

                            </form> 
                        </div>

                    </div>
                    
                </div>
            </div>
                        
            <!-- /#page-content-wrapper -->


        </div>
             
        <script>
            
       function docheckscreen(id)
       {
           if(id.checked)
           {
               $('#sp').prop("readonly", false);
           }
           else
           {
               
               $('#sp').prop("readonly", true);
           }
       }
       
       function docheckpress(id)
       {
           if(id.checked)
           {
               $('#pp').prop("readonly", false);
           }
           else
           {
               
               $('#pp').prop("readonly", true);
           }
       }
        </script>


    </body>

</html>
