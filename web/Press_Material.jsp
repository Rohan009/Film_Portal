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
        <%
            ServletContext ctx = getServletContext();
            Connection C1 = (Connection) ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            String fid = (String) session.getAttribute("film_id");

            String Pquery = "select * from press_info where film_id='" + fid + "'";

            ResultSet rs = st.executeQuery(Pquery);

            String gr = request.getParameter("g");
            String groupname = "";
            if (gr != null) {
                groupname = gr;
            }

            Statement st1 = C1.createStatement();
            String query = "select * from group_name";
            ResultSet rs1 = st1.executeQuery(query);


        %>
        <script>

            var grname =<%=gr%>;

            if (grname !== null)
            {
                $("#addp").show();
            }

        </script>

        <jsp:include page="menu.jsp"/>
        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-20">
                            <h1 id="t">Press Material</h1>


                        </div>
                        <div class="downloadarea">
                            <div class="navbar">
                                <h4>Add Press Material</h4><form action="press_material" method="post" enctype="multipart/form-data">

                                    Select Category Name::   <select  class="auto-style16" style="height: 23px;" name="gn" id="gns" onchange="uploadP()">

                                        <option value="">Select Category</option>
                                        <% while (rs1.next()) { %>

                                        <option value=""><% out.println(rs1.getString("groups")); %></option> 

                                        <% } %>
                                    </select>
                                    <br><br>
                                    <input type="file"  name="press_material" id="file" onchange="uploadP()"/>
                                    <br>  <input type="submit" value="Add Material" id="pload" disabled="disabled"/>
                                    <span id="pgif"><img src="images/loading.gif" alt="Loading"/></span>

                                    <!--                                    <input type="text" id="group" name="group" style="margin-bottom: 0px;" onkeyup="enable(this.value)"/>
                                                                         <input type="button" value="Add" id="enab" onclick="addg()" disabled="disabled"/>-->



                            </div>
                            <table class="dltable thinborder">
<!--                                <caption style="color: black;font-weight: bold"> <% out.println(groupname); %> <br>&nbsp; <div id="addp">-->


                                <thead>
                                    <tr>

                                        <th class="descr" style="max-width:48px; max-height:48px"></th>
                                        <th>Description</th>
                                        <th>Type</th>
                                        <th>Size</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody style="text-align: center;">
                                    <% while (rs.next()) { %>

                                    <tr><td><img src='<% out.println(rs.getString("press_path")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rs.getString("press_name")); %></td>
                                        <td><% out.println(rs.getString("press_type")); %></td>
                                        <td><% out.println(rs.getString("press_size") + "MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='del1' onclick='pressdelrow(<% out.println(rs.getInt("press_id")); %>)'>Delete</button></td> 
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

        <script>


            function enable()
            {

                $('#enab').prop("disabled", false);
            }

            function addg()
            {
                var g = document.getElementById("group").value;

                window.location.href = "addcategory?gr=" + g;
            }

            $(document).ready(function () {
//                $("#addp").hide();
                $("#pgif").hide();
            });

            function uploadP()
            {

                var fn = document.getElementById("file").value;
                var gnn = document.getElementById("gns").value;
                if (fn !== "" && gnn !== "")
                {
                    $('#pload').prop("disabled", false);
                    alert();
                }
            }

            $('#pload').click(function () {

                $("#pgif").show();
            });
            function pressdelrow(pid)
            {

                window.location.href = "delete_press?pid=" + pid;

            }
        </script>
    </body>
</html>
