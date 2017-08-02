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

        <style>

            table th {
                text-align: center;
            }
        </style>
         <style type="text/css">
                                .auto-style3 {
                                    width: 209px;
                                }
                                .auto-style6 {
                                    height: 23px;
                                }
                                .auto-style7 {
                                    width: 242px;
                                    height: 353px;
                                }
                                .auto-style8 {
                                    width: 256px;
                                }
                                .auto-style9 {
                                    height: 23px;
                                    width: 256px;
                                }
                                .auto-style10 {
                                    width: 248px;
                                }
                                .auto-style11 {
                                    width: 575px;
                                }
                                .auto-style12 {
                                    width: 202px;
                                }
                                .auto-style13 {
                                    width: 97px;
                                }
                                .auto-style14 {
                                    width: 34px;
                                }
                                .auto-style15 {
                                    width: 643px;
                                }
                                .auto-style16 {
                                    width: 194px;
                                }
                                .auto-style17 {
                                    width: 419px;
                                }
                                .auto-style18 {
                                    height: 130px;
                                    width: 644px;
                                }
                                .auto-style19 {
                                    width: 117px;
                                }
                            </style>



    </head>

    <body>


        <%
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            Statement st4 = C1.createStatement();
            String fid = request.getParameter("fid");

            String Dquery = "select * from dcp_trailerinfo where film_id='" + fid + "'";
            ResultSet rsd = st.executeQuery(Dquery);

            String Wquery = "select * from web_trailerinfo where film_id='" + fid + "'";
            ResultSet rsw = st1.executeQuery(Wquery);

//            int i=Integer.parseInt(fid);
            String Fquery = "select * from film_information where Film_id='" + fid + "'";
            ResultSet rsf = st2.executeQuery(Fquery);
           
             String title, date, genre, length, director, year, actor, production_count, website, language, subtitle, fr, pf, af, version, rated, vf, ds, vs, desc, posterpath;
            title = date = genre = length = director = year = actor = production_count = website = language = subtitle = fr = pf = af = version = rated = vf = ds = vs = desc = posterpath = null;
           
            while (rsf.next()) {
                title = rsf.getString("Film_Title");
                 date = rsf.getString("Cinema_Start");
                genre = rsf.getString("Genre");
                length = rsf.getString("Length");
                director = rsf.getString("Director");
                year = rsf.getString("Year");
                actor = rsf.getString("Actor");
                production_count = rsf.getString("Production_Country");
                website = rsf.getString("Website");
                language = rsf.getString("Language");
                subtitle = rsf.getString("Subtitle");
                fr = rsf.getString("Framerate");
                pf = rsf.getString("Picture_Format");
                af = rsf.getString("Audio_Format");
                version = rsf.getString("Version");
                rated = rsf.getString("Rated");
                vf = rsf.getString("Video_format");
                ds = rsf.getString("Dvd_Start");
                vs = rsf.getString("Vod_start");
                desc = rsf.getString("Description");
                posterpath = rsf.getString("Poster_Path");
            }

            String Squery = "select * from screener_info where film_id='" + fid + "'";
            ResultSet rs = st3.executeQuery(Squery);

            String Pquery = "select * from press_info where film_id='" + fid + "'";
            ResultSet rsp = st4.executeQuery(Pquery);
            

        %>





        <jsp:include page="menu.jsp"/>
        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-20">
                            <h3 id="t"><% out.println(title); %></h3>

                        </div>
                            <br><br>
                            
                            
                            <form action="film_edit?id=<%=fid%> " method="post" enctype="multipart/form-data">
                                <h4>Film Information</h4>
                                <p class="auto-style3">
                                        &nbsp;</p>
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style8">
                                                <img alt="Film Poster" class="auto-style7" src="<% out.println(posterpath); %>" id="myimage"/><br />
                                                <br />
                                                <input id="File1" class="auto-style10" type="file" name="screen" onchange="onFileSelect(event)"/><br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                            <td>Film Title :
                                                <br />
                                                <input id="Text1" class="auto-style11" type="text" name="Film_title" value="<% out.println(title); %>" readonly required/><br />
                                                <br />
                                                Cinema Start :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Genre :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Length <br />
                                                <input id="Text2" class="auto-style12" type="date" name="Cinema_start" value="<% out.println(date); %>" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select  name="Genre" class="auto-style12" id="Text5" disabled style="height: 23px;margin: 0px;"required>
                                                    <option value="">Genre ...</option>
                                                    <option value="<% out.println(genre); %>" selected id="gen"><% out.println(genre); %></option>
                                                    <option value="Adventure">Adventure</option>
                                                    <option value="Action">Action</option>
                                                    <option value="Biography">Biography</option>
                                                    <option value="Documentary">Documentary</option>
                                                    <option value="Drama">Drama</option>
                                                    <option value="Eroticism">Eroticism</option>
                                                    <option value="Fantasy">Fantasy</option>
                                                    <option value="Home movie">Home movie</option>
                                                    <option value="Historical Drama">Historical Drama</option>
                                                    <option value="Horror">Horror</option>
                                                    <option value="Child">Child/Youth Film</option>
                                                    <option value="Comedy">Comedy</option>
                                                    <option value="Thriller">Thriller</option>
                                                    <option value="Science-Fiction">Science-Fiction</option>
                                                    <option value="Western Film">Western Film</option>
                                                </select>&nbsp;
                                                <input id="Text4" class="auto-style13" type="text" name="Length" value="<% out.println(length); %>" readonly/><input  class="auto-style14" type="text" value="min" readonly="readonly" style="width:37px" /><br />
                                                <br />
                                                Director&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year<br />
                                                <input id="Text6" class="auto-style12" type="text" name="director" value="<% out.println(director); %>" readonly required/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text7" class="auto-style12" type="text" name="year" value="<% out.println(year); %>" readonly required/><br />
                                                <br />
                                                Actor<br />
                                                <input id="Text8" class="auto-style15" type="text" name="actor" value="<% out.println(actor); %>" readonly required/><br />
                                                <br />
                                                Production Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Website<br />
                                                <input id="Text9" class="auto-style16" type="text" name="Production_country" value="<% out.println(production_count); %>" readonly required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text10" class="auto-style17" type="text" name="website" value="<% out.println(website); %>" readonly /><br />
                                                <br />
                                                Language&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sub-Title<br />
                                                <input id="Text11" class="auto-style16" type="text" name="Language" value="<% out.println(language); %>" readonly required/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text12" class="auto-style16" type="text" name="subtitle" value="<% out.println(subtitle); %>" readonly/><br />
                                                <br />
                                                Frame Rate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Picture Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Audio Format<br />
                                                <input id="Text13" class="auto-style16" type="text" name="frame_rate" value="<% out.println(fr); %>" readonly/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text14" class="auto-style16" type="text" name="picture_format" value="<% out.println(pf); %>" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text15" class="auto-style16" type="text" name="audio_format" value="<% out.println(af); %>" readonly/><br />
                                                <br />
                                                Version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rated&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2D / 3D<br />
                                                <input id="Text16" class="auto-style16" type="text" name="version" value="<% out.println(version); %>" readonly/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text17" class="auto-style16" type="text" name="rated" value="<% out.println(rated); %>" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select  class="auto-style16" id="Text18" style="height: 23px;" name="video_format"  disabled >
                                                     <option value="">Select option</option>
                                                     <option value="<% out.println(vf); %>" selected id="vid"><% out.println(vf); %></option>
                                                    <option value="2D">2D</option>
                                                    <option value="3D">3D</option>       
                                                </select>
                                                <br /><br />
                                                DVD/BRD Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VoD Start<br />
                                                <input id="Text19" class="auto-style16" type="text" name="dvd_start" value="<% out.println(ds); %>" readonly/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text20" class="auto-style16" type="text" name="vod_start" value="<% out.println(vs); %>" readonly/><br />
                                                <br />
                                                Description<br />
                                                <br />
                                                <textarea id="Text21" class="auto-style18" name="description" readonly><% out.println(desc); %></textarea><br />
                                                <br />
                                                <br />
                                                <input id="Button1" class="auto-style19" type="button" value="EDIT" onclick="edit()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="save" class="auto-style19" type="submit" value="SAVE" disabled/><br />
                                                <br />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style9">&nbsp;</td>
                                            <td class="auto-style6">&nbsp;</td>
                                            <td class="auto-style6"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                   </form>

                            </div>
                             <div class="downloadarea">
<!--                             <div class="navbar">-->
                            <div class="navbar">
                                <h4>DCP-Trailers</h4><form action="Dcp_trailer?fid=<%=fid%>" method="post" enctype="multipart/form-data"><input type="file"  name="dcp_trailer" onchange="uploadD()"/>
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
                                    <tr><td><img src='<% out.println(rsd.getString("dcp_path")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rsd.getString("Trailer_name")); %></td>
                                        <td><% out.println(rsd.getString("Trailer_size") + "MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='delrow' onclick='dcpdelrow(<% out.println(rsd.getInt("dcp_id")); %>)'>Delete</button></td> 
                                    </tr>
                                    <%  }
                                    %>

                                </tbody>
                            </table>
                            <div class="navbar">
                                <h4>Web Trailers</h4><form action="Web_trailer?fid=<%=fid%>" method="post" enctype="multipart/form-data"><input type="file"  name="web_trailer" onchange="uploadW()"/>
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

                                    <tr><td><img src='<% out.println(rsw.getString("Wtrailer_path")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rsw.getString("Wtrailer_name")); %></td>
                                        <td><% out.println(rsw.getString("Wtrailer_size")+"MB"); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='del1' onclick='webdelrow(<% out.println(rsw.getInt("web_id")); %>)'>Delete</button></td> 
                                    </tr>
                                    <%  }

                                    %>
                                </tbody>
                            </table>
                            <div class="navbar">
                                <h4>Screen Materials</h4><form action="add_screen?fid=<%=fid%>" method="post" enctype="multipart/form-data">
                                    <input type="file"  name="screen" onchange="uploadS()"/>
                                    <br>  <input type="submit" value="Add Material" id="sload" disabled="disabled"/>
                                    <span id="sgif"><img src="images/loading.gif" alt="Loading"/></span>
                                    <br>  </form>

                            </div>
                            <table class="dltable thinborder">
                                <caption style="color: black;font-weight: bold"></caption>

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
                            <div class="navbar">
                                <h4>Add Press Material</h4><form action="press_material?fid=<%=fid%>" method="post" enctype="multipart/form-data">
                                    <input type="file"  name="press_material" onchange="uploadP()"/>
                                    <br>  <input type="submit" value="Add Material" id="pload" disabled="disabled"/>
                                    <span id="pgif"><img src="images/loading.gif" alt="Loading"/></span>
                                    <br>  </form></span>

                            </div>
                            <table class="dltable thinborder">
                                <caption style="color: black;font-weight: bold"> </caption>

                                <thead>
                                    <tr>

                                        <th class="descr" style="max-width:48px; max-height:48px"></th>
                                        <th>Description</th>
                                        <th>Type</th>
                                        <th>Size</th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rsp.next()) { %>

                                    <tr><td><img src='<% out.println(rsp.getString("press_path")); %>' style='max-width:48px; max-height:48px'></td>
                                        <td><% out.println(rsp.getString("press_name")); %></td>
                                        <td><% out.println(rsp.getString("press_type")); %></td>
                                        <td><% out.println(rsp.getString("press_size")); %></td>
                                        <td><button type='button' value='Delete' class='kf-btn kf-btn3' id='del1' onclick='pressdelrow(<% out.println(rsp.getInt("press_id")); %>)'>Delete</button></td> 
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
        
        
        function edit()
        {
             $('#save').prop("disabled", false);
              $('#Text1').prop("readonly", false);
              $('#Text2').prop("readonly", false);
              $('#Text3').prop("readonly", false);
              $('#Text4').prop("readonly", false);
              $('#Text5').prop("disabled", false);
              $('#Text6').prop("readonly", false);
              $('#Text7').prop("readonly", false);
              $('#Text8').prop("readonly", false);
              $('#Text9').prop("readonly", false);
              $('#Text10').prop("readonly", false);
              $('#Text11').prop("readonly", false);
              $('#Text12').prop("readonly", false);
              $('#Text13').prop("readonly", false);
              $('#Text14').prop("readonly", false);
              $('#Text15').prop("readonly", false);
              $('#Text16').prop("readonly", false);
              $('#Text17').prop("readonly", false);
              $('#Text18').prop("disabled", false);
              $('#Text19').prop("readonly", false);
              $('#Text20').prop("readonly", false);
              $('#Text21').prop("readonly", false);
        }

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
        $(document).ready(function () {

            $("#pgif").hide();
        });

        function uploadP()
        {
            $('#pload').prop("disabled", false);
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

</html>

