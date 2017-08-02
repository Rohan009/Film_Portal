<%-- 
    Document   : Film_Details
    Created on : Feb 6, 2017, 1:19:25 PM
    Author     : Earth
--%>

<%@page import="java.util.ArrayList"%>
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
        <%
            ServletContext ctx = getServletContext();
            Connection C1 = (Connection) ctx.getAttribute("mycon");
            Statement st = C1.createStatement();

            String fid = request.getParameter("fid");

            String query = "select * from film_information where Film_id='" + fid + "'";
            ResultSet rs = st.executeQuery(query);

            String title, date, genre, length, director, year, actor, production_count, website, language, subtitle, fr, pf, af, version, rated, vf, ds, vs, desc, posterpath;
            title = date = genre = length = director = year = actor = production_count = website = language = subtitle = fr = pf = af = version = rated = vf = ds = vs = desc = posterpath = null;

            while (rs.next()) {
                title = rs.getString("Film_Title");
                date = rs.getString("Cinema_Start");
                genre = rs.getString("Genre");
                length = rs.getString("Length");
                director = rs.getString("Director");
                year = rs.getString("Year");
                actor = rs.getString("Actor");
                production_count = rs.getString("Production_Country");
                website = rs.getString("Website");
                language = rs.getString("Language");
                subtitle = rs.getString("Subtitle");
                fr = rs.getString("Framerate");
                pf = rs.getString("Picture_Format");
                af = rs.getString("Audio_Format");
                version = rs.getString("Version");
                rated = rs.getString("Rated");
                vf = rs.getString("Video_format");
                ds = rs.getString("Dvd_Start");
                vs = rs.getString("Vod_start");
                desc = rs.getString("Description");
                posterpath = rs.getString("Poster_Path");

            }
            String query1 = "select * from web_trailerinfo where film_name='" + title + "'";
            String webtname, webtsize, wtitle;
            webtname = webtsize = wtitle = "";
            Statement st1 = C1.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);

            String query2 = "select * from dcp_trailerinfo where film_name='" + title + "'";
            String dcptname, dcptsize;
            webtname = webtsize = wtitle = "";
            Statement st2 = C1.createStatement();
            ResultSet rs2 = st2.executeQuery(query2);

            ArrayList<String> groups = new ArrayList<String>();
             Statement stg = C1.createStatement();
            String queryg = "select * from group_name";
            ResultSet rsg = stg.executeQuery(queryg);
            while(rsg.next())
            {
                groups.add(rsg.getString("groups"));
            }
            Statement st3 = C1.createStatement();
            ResultSet rs3 = null;

            String query4 = "select * from screener_info where film_id='" + fid + "'";
            Statement st4 = C1.createStatement();
            ResultSet rs4 = st4.executeQuery(query4);

            String query5 = "select * from settings_detail where film_id='" + fid + "'";
            Statement st5 = C1.createStatement();
            ResultSet rs5 = st5.executeQuery(query5);
            String sp = null;

            while (rs5.next()) {
                sp = rs5.getString("Screener_password");
            }
            String u = null;
            if (session.getAttribute("userid") != null) {

                u = session.getAttribute("userid").toString();
            }

//            out.println(groups);

        %>
        <title><%out.println(title); %></title>
        <style>
            div.movie-description-container {
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                -webkit-overflow-scrolling: touch;
            }
            div.movie-description {
                padding: 25px;
                text-align: justify;
            }
            ul#datatable {
                list-style: none;
                padding: 0;
                margin: 0;
                white-space: nowrap;
            }
            ul#datatable li {
                vertical-align: top;
                font-size: 15px;
                display: inline-block;
                max-width: 183px;
                margin-left: 25px;
                margin-bottom: 1.4em;
                font-weight: bold;
                white-space: normal;
            }
            ul#datatable li:last-child {
                margin-right: 20px;
            }
            ul#datatable li span.term {
                font-weight: normal;
                font-size: 12px;
                display: block;
            }
            ul#datatable li.badge {
                background-color: hsl(100, 40%, 70%);
                padding: 5px 18px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 11px;
                border-radius: 0 4px;
                font-weight: normal;
                color: aliceblue;
            }
            .filminfos_lower {
                padding-top: 10px;
                margin-top: 10px;
                overflow-x: auto;
                overflow-y: hidden;
                -webkit-overflow-scrolling: touch;
                background-color: #F0F0F0;
                -webkit-flex: 0 0 auto;
                -ms-flex: 0 0 auto;

            }
            div.filmPreviewHint {
                background-color: hsl(0, 0%, 80%);
                color: hsl(0, 100%, 100%);
                padding: 3px;
                text-transform: uppercase;
                font-weight: bold;
                text-align: center;
                margin-top: 1em;
                letter-spacing: 2px;
                line-height: 1.4em;
                font-size: 16pt;
            }
            div.groupbar {
                padding: 0 14px;
            }
            div.groupbar:first-child {
                margin-top: 1.3em;
            }
        </style>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="Film_Portal/web/js/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-theme-plain.css" rel="stylesheet">
        <link href="css/common.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
    </head>
    <body>

        <div class="wrap" style="min-height: 0px;background-color: white" >
            <nav class="navbar-default navbar-default navbar" role="navigation" style="background-color: white">
                <div class="container-narrow">
                    <div id="menu-collapse" class="collapse navbar-collapse">
                        <div class="navbar-header" onclick='window.location.href = "index.jsp"'>
                            <a href="index.jsp" style="font-family: exo" class="navbar-brand">CineBox</a>
                            <div class="">
                                <img src="images/logo.png" width=151 height=120 alt="COmpany Logo" style="height: 100%;margin-top: -10px;">
                            </div>
                        </div>
                        <div class="hidden-xs">
                            <div class="navbar-right pull-right">
                                <div class="headerLoginRegister">
                                    <a href="" class="headerLoginBtn threeDotButton pull-left"></a>
                                    <span class="pull-left">

                                        <ul class="nav nav-pills pull-right">

                                            <li id="sign"><a href="register.jsp">Sign Up</a></li><li id="login"><a href="login.jsp">Login</a></li>
                                            <li id="logout"><a href="logout">Logout</a></li>	</ul>

                                    </span>
                                </div>
                            </div>           
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <div class=content_container>
            <div class=container-narrow>
                <ul class="tabs filmtabs ns">
                    <li class=backbtn><a href="index.jsp" title="Films"><img src="images/h-arrow.png"></a></li>
                    <li class="filminfos active" data-tab=filminfos onclick="filminfo()"><%out.println(title); %></li>
                    <li data-tab="dcptrailers" onclick="Dcp()">DCP-Trailer</li>
                    <li data-tab="webtrailers" onclick="Web()">Web-Trailer</li>
                    <li data-tab="screener" onclick="Screen()">Screener</li>
                    <li data-tab="pressmaterial" onclick="Press()">Press Material</li>
                </ul>
                <div id=filmpane class="white-box tabpane">
                    <div id=filminfos class=kftab>
                        <div class="filminfos_split1" id="filminfo">
                            <div>
                                <img src="<%out.println(posterpath); %>" alt="Poster" width="300" height="400">
                            </div>

                            <div>
                                <div class=filminfos_split2>
                                    <div>
                                        <table class=filminfos>
                                            <tr><td>Director</td><td><%out.println(director); %></td></tr>
                                            <tr><td>Actor</td><td><%out.println(actor); %></td></tr>
                                            <tr><td>Genre</td><td><%out.println(genre); %></td></tr>
                                            <tr><td>Rated</td><td><%out.println(rated); %></td></tr>
                                            <tr><td>Country</td><td><%out.println(production_count); %></td></tr>
                                            <tr><td>Year</td><td><%out.println(year); %></td></tr>
                                            <tr><td>Rental</td><td>Warner Bros</td></tr>
                                        </table>
                                    </div>
                                    <div>
                                        <table class=filminfos>
                                            <tr><td style="width: 120px">Release Date</td><td><%out.println(date); %></td></tr>
                                            <tr><td style="width: 120px">DVD/BRD Start</td><td><%out.println(ds); %></td></tr>
                                            <tr><td style="width: 120px">VoD Start</td><td><%out.println(vs); %></td></tr>
                                            <tr><td style="width: 120px">Length</td><td><%out.println(length); %></td></tr>
                                            <tr><td style="width: 120px">Audio</td><td><%out.println(af); %></td></tr>
                                            <tr><td style="width: 120px">Subtitle</td><td><%out.println(subtitle); %></td></tr>
                                            <tr><td style="width: 120px">Image Format</td><td><%out.println(pf); %></td></tr>
                                            <tr><td style="width: 120px">Framerate</td><td><%out.println(fr); %></td></tr>
                                            <tr><td style="width: 120px">2D/3D</td><td><%out.println(vf); %></td></tr>
                                        </table>
                                    </div>
                                </div>
                                <div class=filmdescription></div>
                            </div>
                        </div>
                        <div class=downloadarea>
                            <div id="dcpid">
                                <div class=groupbar>
                                    <h5>DCP-Trailer</h5>
                                </div>
                                <table class="dltable thinborder">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class=descr>Description</th>
                                            <th>Dimensions</th>
                                            <th>Frame Rate</th>
                                            <th>Length</th>
                                            <th>FSK</th>
                                            <th>Type</th>
                                            <th>Size</th>
                                            <th style="width: 100px">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs2.next()) {
                                                String path = rs2.getString("dcp_path");%>
                                        <tr>
                                            <td><img src="<%out.println(posterpath);%>" style="max-width:48px; max-height:48px"></td>
                                            <td class=descr><%out.println(rs2.getString("Trailer_name"));  %></td>
                                            <td title="FLAT">720x1820</td>
                                            <td><%out.println(fr);%></td>
                                            <td>1m 49s</td>
                                            <td><img width=26 src="images/fsk_ab_unbekannt.png"></td>
                                            <td>DCP</td>
                                            <td><%out.println(rs2.getString("Trailer_size"));%></td>
                                            <td><a target="_blank" href="#" onclick='checklogin("<%=path%>");
                                                    return false;' class="kf-btn kf-btn3">download</a></td>

                                        </tr>

                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                           
                                    
                            <div id="pressid">
                                 <% for (String group_arr : groups) {
                                    String query3 = "select * from press_info where film_id='" + fid + "' and group_name='" + group_arr + "'";
                                    rs3 = st3.executeQuery(query3);
                                    String c="";
                                    if(rs3.next())
                                    {
                                         c=rs3.getString("press_name");
                                    }
                                   
                                    if(c.equals(""))
                                    {
                                        continue;
                                    }
                                    rs3.previous();
                                        %>
                                <div class=groupbar>
                                    <h5><%out.println(group_arr);%></h5>
                                </div>
                                <table class="dltable thinborder">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class=descr>Description</th>
                                            <th>Dimensions</th>
                                            <th>Frame Rate</th>
                                            <th>Length</th>
                                            <th>FSK</th>
                                            <th>Type</th>
                                            <th>Size</th>
                                            <th style="width: 100px">
                                            </th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        
                                           <% while (rs3.next()) { %>
                                        <tr>
                                            <td><img src="<%out.println(posterpath);%>" style="max-width:48px; max-height:48px"></td>
                                            <td class=descr><%out.println(rs3.getString("press_name"));  %></td>
                                            <td title="FLAT">720x1820</td>
                                            <td><%out.println(fr);%></td>
                                            <td>1m 49s</td>
                                            <td><img width=26 src="images/fsk_ab_unbekannt.png"></td>
                                            <td><%out.println(rs3.getString("press_type"));  %></td>
                                            <td><%out.println(rs3.getString("press_size"));  %></td>
                                            <td><a href='<%out.println(rs3.getString("press_path"));  %>'  target="_blank" class="kf-btn kf-btn3 file-lock" download>download</a></td>
                                        </tr>
                                        <% } %>

                                    </tbody>
                                </table>
                                         <%      
                                }
                            %>
                            </div>
                           
                            <div id="screenid">
                                <div class=groupbar>
                                    <h5>Screener</h5>
                                </div>
                                <center>
                                    <div id='screen_input'>
                                        <h4> Pleas enter the Screener Password provided by the Lender</h4>

                                        <input type='password' name='screenp_password' id='screen_id'/>
                                        <input type='button' onclick="checksp()" value='Enter'/>
                                    </div>
                                </center>

                                <table class="dltable thinborder" id='screener_table'>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class=descr>Description</th>
                                            <th>Dimensions</th>
                                            <th>Frame Rate</th>
                                            <th>Length</th>
                                            <th>FSK</th>
                                            <th>Type</th>
                                            <th>Size</th>
                                            <th style="width: 100px">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs4.next()) { %>
                                        <tr>
                                            <td><img src="<%out.println(posterpath);%>" style="max-width:48px; max-height:48px"></td>
                                            <td class=descr><%out.println(rs4.getString("screener_name"));  %></td>
                                            <td title="FLAT">720x1820</td>
                                            <td><%out.println(fr);%></td>
                                            <td>1m 49s</td>
                                            <td><img width=26 src="images/fsk_ab_unbekannt.png"></td>
                                            <td>Screener</td>
                                            <td><%out.println(rs4.getString("screener_size"));  %></td>
                                            <td><a href='<%out.println(rs4.getString("screener_path"));  %>' target="_blank" class="kf-btn kf-btn3 file-lock" download>download</a></td>
                                        </tr>

                                        <% } %>
                                    </tbody>
                                </table>

                            </div>
                            <div id="webid">
                                <div class=groupbar>
                                    <h5>Web-Trailer</h5>
                                </div>
                                <table class="dltable thinborder">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class=descr>Description</th>
                                            <th>Dimensions</th>
                                            <th>Frame Rate</th>
                                            <th>Length</th>
                                            <th>FSK</th>
                                            <th>Type</th>
                                            <th>Size</th>
                                            <th style="width: 100px">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs1.next()) {
                                                String wt = rs1.getString("Wtrailer_path");
                                        %>
                                        <tr>
                                            <td><img src="<%out.println(posterpath);%>" style='max-width:32px; max-height:32px;cursor: pointer;' id='video' target='_blank' onclick='playvideo("<%=wt%>")'></td>
                                            <td class=descr><%out.println(rs1.getString("Wtrailer_name"));  %></td>
                                            <td>1920 x 1080</td>
                                            <td><%out.println(fr); %></td>
                                            <td>1m 49s</td>
                                            <td><img width=26 src="images/fsk_ab_unbekannt.png"></td>
                                            <td>MOV</td>
                                            <td><%out.println(rs1.getString("Wtrailer_size"));%></td>
                                            <td><a target="_blank" href='<%out.println(rs1.getString("Wtrailer_path"));%>' class="kf-btn kf-btn3" download>download</a></td>
                                        </tr>

                                        <% }%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <span id=checkurl data-restricted-files="/film/471/rf/PURPOSE" data-pwcheck="../film/471/cp.html"></span>
        </div>
        <div class="container container-main">
            <div class="message-container">

            </div>
            <style type="text/css">
                .green{
                    background-color:#ffe000;
                }
            </style>


            <div class="container">
                <hr class="contentDividerYellow2">
            </div>

            <div class="container">
                <hr class="contentDividerGrey">
            </div>

            <div class="container">
                <p class="pull-left">
                    Substance Digital                        | 
                    <a href="http://substance.digital/security-policy.html">Security Policy</a>
            </div>
            <div class="container">
                <hr class="contentDividerGrey">
            </div>
            <div class="copyrightFooter container">
                <p>
                    Copyright © 2017 Substance Digital                        | 
                    <a href="http://substance.digital/privacy-policy.html">Privacy Policy</a>
                </p>
            </div>


            <script>

                var user =<%=u%>;
                $('#pressid').hide();
                $('#screenid').hide();
                $('#screener_table').hide();


                $("#logout").hide();
                if (user !== null)
                {

                    $("#sign").hide();
                    $("#login").hide();
                    $("#logout").show();

                }

                function checklogin(dpath)
                {
                    if (user !== null)
                    {
                        window.location = "Material/Trailer/Webtrailer/Titanic.mp4";
                    }
                    else
                    {
                        alert("Please login to download DCP trailer");
                        window.location.href = "login.jsp";
                    }
                }


                var spwd =<%=sp%>;
                var pwd = "";

                if (spwd === null)
                {
                    $('#screenid').hide();
                    $('#screener_table').show();
                }

                function checksp()

                {
                    pwd = document.getElementById('screen_id').value;
                    if (pwd.localeCompare(spwd) === 0)
                    {

                        $('#screen_input').hide();
                        $('#screener_table').show();
                    }

                    else
                    {
                        alert("Password is incorrect");
                    }
                }


                function playvideo(path)
                {
                    document.getElementById("video").outerHTML =
                            "<video id='vid' controls width='320' target='_blank'> <source src='" + path + "' type = 'video/mp4' / > < /video>";
                }
                function Dcp()

                {

                    $('#webid').hide();
                    $('#filminfo').hide();
                    $('#pressid').hide();
                    $('#screenid').hide();
                    $('#dcpid').show();
                }
                function Web()
                {

                    $('#dcpid').hide();
                    $('#filminfo').hide();
                    $('#pressid').hide();
                    $('#screenid').hide();
                    $('#webid').show();
                }

                function Press()
                {

                    $('#dcpid').hide();
                    $('#filminfo').hide();
                    $('#webid').hide();
                    $('#screenid').hide();
                    $('#pressid').show();
                }

                function Screen()
                {
                    $('#dcpid').hide();
                    $('#filminfo').hide();
                    $('#webid').hide();
                    $('#pressid').hide();
                    $('#screenid').show();


                }

                function filminfo()
                {
                    window.location.href = "Film_Details.jsp?fid=<%=fid%>";
                }

            </script>

    </body>
</html>