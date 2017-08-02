<%-- 
    Document   : Trailer
    Created on : Feb 6, 2017, 1:19:25 PM
    Author     : Earth
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trailer</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>

        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
                 
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
               
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <style>

            table th {
                text-align: center;
            }
        </style>



    </head>

    <body>


        <%
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();
            String fid = (String) session.getAttribute("film_id");
            
            String Dquery = "select * from dcp_trailerinfo where film_id='"+fid+"'";
            ResultSet rsd = st.executeQuery(Dquery);

            String Wquery = "select * from web_trailerinfo where film_id='"+fid+"'";
            ResultSet rsw = st1.executeQuery(Wquery);

//            int id=(int)session.getAttribute("film_id");
//            String getstatus="select status from film_information where Film_id=16";
//            Statement st2 = C1.createStatement();
//            Statement st3 = C1.createStatement();
//            ResultSet rs1=st2.executeQuery(getstatus);
//            String stat="";
//            while(rs1.next())
//            {
//                stat=rs1.getString("status");
//            }
//            stat=stat.concat(",3");
//            
//            String sendstatus="update film_information set status='"+stat+"' where Film_id=16";
//            st3.executeUpdate(sendstatus);

        %>





        <jsp:include page="menu.jsp"/>
        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-20">
                            <h1 id="t">Trailer</h1>

                        </div>
                        <div class="downloadarea">
                            <div class="navbar">
                                <h4>Add DCP-Trailer</h4><form action="Dcp_trailer" method="post" enctype="multipart/form-data"><input type="file"  name="dcp_trailer" onchange="uploadD()"/>
                                    <br>  <input type="submit" value="Add Trailer" id="dload" disabled="disabled"/><span id="dgif"><img src="images/loading.gif" alt="Loading"/></span>
                                    <br>  </form></span>

                            </div>
                            <table class="dltable thinborder">
                                <thead>
                                    <tr>

                                        <th class="descr" style="max-width:48px; max-height:48px">Trailer</th>
                                        <th>Trialer Name</th>
                                        <th>Size</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <% while (rsd.next()) { %>
                                    <tr><td><img src='<% out.println(rsd.getString("Trailer_name")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rsd.getString("Trailer_name")); %></td>
                                        <td><% out.println(rsd.getString("Trailer_size") + "MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='delrow' onclick='dcpdelrow(<% out.println(rsd.getInt("dcp_id")); %>)'>Delete</button></td> 
                                    </tr>
                                    <%  }
                                    %>

                                </tbody>
                            </table>
                            <div class="navbar">
                                <h4>Add Web Trailer</h4><form action="Web_trailer" method="post" enctype="multipart/form-data"><input type="file"  name="web_trailer" onchange="uploadW()"/>
                                    <br>  <input type="submit" value="Add Trailer" id="wload" disabled="disabled"/><span id="wgif"><img src="images/loading.gif" alt="Loading"/></span>
                                    <br>  </form></span>
                            </div>
                            <table class="dltable thinborder">
                                <thead>
                                    <tr>

                                        <th class="descr" style="max-width:48px; max-height:48px">Trailer</th>
                                        <th>Trialer Name</th>
                                        <th>Size</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rsw.next()) { %>

                                    <tr><td><img src='<% out.println(rsw.getString("Trailer_name")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rsw.getString("Wtrailer_name")); %></td>
                                        <td><% out.println(rsw.getString("Wtrailer_size")+ "MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='del1' onclick='webdelrow(<% out.println(rsw.getInt("web_id")); %>)'>Delete</button></td> 
                                    </tr>
                                    <%  }

                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
    </div>

    <script>

        $('#dload').click(function () {

            $("#dgif").show();
        });


        $(document).ready(function () {

            $("#dgif").hide();
        });

        function uploadD()
        {
            $('#dload').prop("disabled", false);
        }


        $('#wload').click(function () {

            $("#wgif").show();
        });


        $(document).ready(function () {

            $("#wgif").hide();
        });

        function uploadW()
        {
            $('#wload').prop("disabled", false);
        }

        function webdelrow(wid)
        {

            window.location.href = "delete_webtrailer?pid=" + wid;

        }

        function dcpdelrow(did)
        {

            window.location.href = "delete_dcptrailer?pid=" + did;
        }

    </script>

</body>

</html>





</html>

