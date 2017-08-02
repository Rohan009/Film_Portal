<%@page import="java.sql.*"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trailer</title>

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
        <script>
            <%
                ServletContext ctx=getServletContext();  
                Connection C1=(Connection)ctx.getAttribute("mycon");
                Statement st = C1.createStatement();
                Statement st1 = C1.createStatement();
                String fid = (String) session.getAttribute("film_id");

                String Pquery = "select * from screener_info where film_id='"+fid+"'";
                ResultSet rs = st.executeQuery(Pquery);
                String id=session.getAttribute("userid").toString();
                
                
//                String getid = "select * from web_trailerinfo where film_id='"+fid+"'";
//                ResultSet rsi = st1.executeQuery(getid);
//                String 
//                while(rsi.next())
//                {
//                    
//                }

                String type = request.getParameter("film");
                int check=0;
    
                if("success".equals(type))
                {
                    check=1;
                }
                if("fail".equals(type))
                {
                    check=2;
                }
                
                
                
                
            %>

             var host=<%=check%>;
            if (host === 1)
            {
                alert("Film has been uploaded successfully");
                window.location.href="distributor_data.jsp?u=<%=id%>";
            }
            if (host === 2)
            {
                alert("Please fill up all the required details in every fields");

            }

        </script>


        <jsp:include page="menu.jsp"/>
        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-20">
                            <h1 id="t">Screen</h1>


                        </div>
                        <div class="downloadarea">
                            <div class="navbar">
                                <h4>Add Material</h4><form action="add_screen" method="post" enctype="multipart/form-data">
                                    <input type="file"  name="screen" onchange="uploadS()"/>
                                    <br>  <input type="submit" value="Add Material" id="sload" disabled="disabled"/>
                                    <span id="sgif"><img src="images/loading.gif" alt="Loading"/></span>
                                    <br>  </form>

                            </div>
                            <table class="dltable thinborder">
                                <caption style="color: black;font-weight: bold"> </caption>

                                <thead>
                                    <tr>

                                        <th class="descr" style="max-width:48px; max-height:48px"></th>
                                        <th>Description</th>
                                        <th>Size</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rs.next()) { %>

                                    <tr><td><img src='<% out.println(rs.getString("screener_path")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rs.getString("screener_name")); %></td>
                                        <td><% out.println(rs.getString("screener_size")+"MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='del1' onclick='screendelrow(<% out.println(rs.getInt("screener_id")); %>)'>Delete</button></td> 
                                    </tr>
                                    <%  }

                                    %>
                                </tbody>
                            </table>

                            <center>
                                <div style="margin-top: 100px"><button class='kf-btn kf-btn2' type="button" onclick="window.location.href = 'checkstatus'">Host Film</button></div>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {

                $("#sgif").hide();
            });

            function uploadS()
            {
                $('#sload').prop("disabled", false);
            }

            $('#sload').click(function () {

                $("#sgif").show();
            });
            function screendelrow(pid)
            {
                window.location.href = "delete_screen?pid=" + pid;
            }


        </script>
    </body>
</html>
