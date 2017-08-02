<%-- 
    Document   : index
    Created on : Jan 28, 2017, 7:37:37 PM
    Author     : Earth
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang=de>

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Film Portal</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.js">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <%
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st1 = C1.createStatement();
            ResultSet rs;
            String getsortdata = request.getParameter("sort");
            String getyeardata = request.getParameter("sorty");
            String getgenre = request.getParameter("sortg");
            String getfilm = request.getParameter("films");
            String user_type = request.getParameter("ut");
            int userid = request.getIntHeader("uid");
            
           

            String searchquery = "select Film_Title from film_information where film_upload=1 ";
            Statement st2 = C1.createStatement();
            ResultSet rs_search = st2.executeQuery(searchquery);

            if ("al".equals(getsortdata)) {
                String query1 = "select Poster_Path,Film_Title,Genre,Cinema_Start,Film_id from film_information where film_upload=1 order by Film_Title";
                rs = st1.executeQuery(query1);
            } else if ("up".equals(getsortdata)) {
                String query1 = "select Poster_Path,Film_Title,Genre,Cinema_Start,Film_id from film_information where film_upload=1 order by Film_id desc";
                rs = st1.executeQuery(query1);
            } else if ("cd".equals(getsortdata)) {
                String query1 = "select Poster_Path,Film_Title,Genre,Cinema_Start,Film_id from film_information where film_upload=1 ";
                rs = st1.executeQuery(query1);
            } else if ("rd".equals(getsortdata)) {
                String query1 = "select Poster_Path,Film_Title,Genre,Cinema_Start,Film_id from film_information where film_upload=1 order by Cinema_Start";
                rs = st1.executeQuery(query1);
            } else if ("new".equals(getsortdata)) {
                String query1 = "select Poster_Path,Film_Title,Genre,Cinema_Start,Film_id from film_information where film_upload=1 order by Cinema_Start desc";
                rs = st1.executeQuery(query1);
            } else if (getyeardata != null) {
                String query1 = "select * from film_information where Year='" + getyeardata + "' and film_upload=1 ";
                rs = st1.executeQuery(query1);
            } else if (getgenre != null) {
                String query1 = "select * from film_information where Genre='" + getgenre + "' and film_upload=1 ";
                rs = st1.executeQuery(query1);
            } else if (getfilm != null) {
                String query1 = "select * from film_information where Film_Title='" + getfilm + "'";
                rs = st1.executeQuery(query1);
            } else {

                String query1 = "select * from film_information where film_upload=1";
                rs = st1.executeQuery(query1);
            }

            ArrayList mylist = new ArrayList();
            while (rs_search.next()) {
                mylist.add("\"" + rs_search.getString("Film_Title") + "\"");
            }

            String getuser = "select User_Name from registration where user_id=" + userid + "";
            Statement st3 = C1.createStatement();
            ResultSet rsu = st3.executeQuery(getuser);
            String username = "";
            while (rsu.next()) {
                username = rs.getString("User_Name");
            }
        %>

        <script type="text/javascript">
            
           
         function logout()
            {
                alert();
               window.location="index.jsp";

            }



            $(function () {
                var tags =<%=mylist%>;
                $("#searchbox").autocomplete({
                    source: tags
                });
            });

            function sort(data)
            {
                window.location.href = "sortfilm?sendsort=" + data;
            }

            function sortyear(year)
            {
                window.location.href = "sortyear?sendyear=" + year;
            }

            function sortnew()
            {
                window.location.href = "sortfilm?sendsort=new";
            }
            function allfilm()
            {
                window.location.href = "sortfilm?sendsort=alll";
            }

            function sortgenre(genre)
            {
                window.location.href = "sortgenre?sendgenre=" + genre;
            }

            function searchbox()
            {
                var search = document.getElementById("searchbox").value;
                window.location.href = "searchfilm?film=" + search;
            }

            function startsort()
            {
                window.location.href = "sortfilm?sendsort=rd";
            }

            function sortlender(lend)
            {

                window.location.href = "sortlender?lender=" + lend;
            }

        </script>

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
        <div class=headline_container>
            <div class=container-narrow>
                <div class=subheadline>
                    <div>                            
                        <h4>Film Portal</h4>
                    </div>
                    <div>
                        <input id="searchbox" value="" type="text" class="round search-query" placeholder="Title" style="height: 25px;width:200px;">
                        <div id="searchbutton" class="btn" style="font-size: 14px;height: 27px;line-height: 15px;margin-left:5px;" onclick="searchbox()">Search</div>
                    </div>
                </div>
            </div>
        </div>

        <div class=content_container>
            <div class=container-narrow>
                <div id=filter_row>
                    <div id=filter_container>
                        <div>
                            <b>Start Date:</b><br>
                            <select id="weeknumber_select" class="input-small pull-left" style="margin-right:5px;width: 105px;" onchange="startsort()">
                                <option value="all" selected=""><font><font>all</font></font></option>
                                <option value="all_kw"><font><font>Current KW</font></font></option>
                            </select>
                            <select id="year_select" class="span1 pull-left" style="margin-right:5px;width: 74px !important;" onchange="sortyear(this.value)">
                                <option value="all"><font><font>all</font></font></option>
                                <option value="2013"><font><font>2013</font></font></option>
                                <option value="2014"><font><font>2014</font></font></option>
                                <option value="2015"><font><font>2015</font></font></option>
                                <option value="2016"><font><font>2016</font></font></option>
                                <option value="2017"><font><font>2017</font></font></option>
                                <option value="2018"><font><font>2018</font></font></option>
                            </select>
                        </div>
                        <div>
                            <b>Filter:</b><br>

                            <div id="neuste_trailer_button" class="btn pull-left" style="margin-right:5px;" onclick="sortnew()">New Films</div>
                            <div id="alle_trailer_button" class="btn pull-left active" style="margin-right:5px;" onclick="allfilm()">All Films</div>
                            <select id="searchbox_fsk" class="input-small pull-left" style="margin-right:5px;" name='lender' onchange='sortlender(this.value)'>
                                <option value="">Lender...</option>
                                <option value="The One Film">The One Film </option>
                                <option value="Image Kraft">Image Kraft</option>
                                <option value="Olympian">Olympian</option>
                                <option value="Mindjazz Film">Mindjazz Film</option>
                                <option value="Pandora Film">Pandora Film</option>                                
                                <option value="Bravehearts">Bravehearts</option>


                            </select>
                            <select name="filter_genre" class="input-small pull-left" style="margin-right:5px;" onchange="sortgenre(this.value)">
                                <option value="">Genre ...</option>
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
                            </select>

                            <select id=searchbox_fsk class="input-small pull-left" style="margin-right:5px;">
                                <option value="">FSK ...</option>
                                <option value="0">From 0</option>
                                <option value="6">From 6</option>
                                <option value="12">From 12</option>
                                <option value="16">From 16</option>
                                <option value="18">From 18</option>
                            </select>


                            <input type=hidden id=filter_verleiher />
                        </div>
                        <div>
                            <div style="float:right">
                                <b>Sorting:</b><br>
                                <select id="searchbox_order" class="input-medium pull-left" style="width: 127px;" name="sorting" onchange="sort(this.value)">
                                    <option>----</option>
                                    <option value="rd">Release Date</option>
                                    <option value="cd">Creation Date</option>
                                    <option value="up">Update</option>
                                    <option value="al">Alphabetical</option>
                                </select>
                                <input type=hidden id=sort_order value="d">
                            </div>
                        </div>
                    </div>
                    <div id=current_filter_container>
                        <div id=current_filter_info></div>
                        <div id=current_filter></div>
                        <div>
                            <button id=resetFilterButton onclick="resetFilterDisplay_all()" class="hide btn btn-small pull-right">Filter zurücksetzen</button>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                </div>
                <div id=filmposter_container>
                    <div class=trailerbag>
                        <div class=calweek_container>
                        </div>
                        <div>

                            <% while (rs.next()) { %>

                            <div class=trailer_list_item>
                                <a href="Film_Details.jsp?fid=<% out.println(rs.getString("Film_id"));%>">
                                    <img src="<% out.println(rs.getString("Poster_Path")); %>" alt="Poster" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="Film_Details.jsp?fid=<% out.println(rs.getString("Film_id"));%>"><h6><% out.println(rs.getString("Film_Title")); %></h6></a>
                                <span class=distributor-name><% out.println(rs.getString("Genre")); %></span><br>
                                <span class=release-date>Release Date: <% out.println(rs.getString("Cinema_Start")); %></span>
                            </div>

                            <%  }%>



                            <div class=trailer_list_item>
                                <div class="bagde trailer_new"></div>
                                <a href="f/amelie-rennt.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/1831173161_ffv_kinofreund.160x230.jpg" data-src="/upload/trailer/poster/1831173161_ffv_kinofreund.160x230.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/amelie-rennt.html"><h6>Amelie rennt</h6></a>
                                <span class=distributor-name>farbfilm verleih</span><br>
                                <span class=release-date>Release Date:
                                    21.09.2017
                                </span>
                            </div>

                            <div class=trailer_list_item>
                                <a href="f/zazy.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/595542694_ZAZY_Plakat_Mail.jpg" data-src="/upload/trailer/poster/595542694_ZAZY_Plakat_Mail.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/zazy.html"><h6>Zazy</h6></a>
                                <span class=distributor-name>Real Fiction</span><br>
                                <span class=release-date>Release Date:
                                    30.03.2017
                                </span>
                            </div>
                            <div class=trailer_list_item>
                                <div class="bagde trailer_updated"></div>
                                <a href="f.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/621409776_WDVF_Plakat_final.jpg" data-src="/upload/trailer/poster/621409776_WDVF_Plakat_final.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f.html"><h6>Wenn der Vorhang fällt</h6></a>
                                <span class=distributor-name>Zorro Film</span><br>
                                <span class=release-date>Release Date:
                                    30.03.2017
                                </span>
                            </div>
                            <div class=trailer_list_item>
                                <div class="bagde trailer_updated"></div>
                                <a href="f/gaza-surf-club.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/1878077972_ffv_kinofreund.160x230.jpg" data-src="/upload/trailer/poster/1878077972_ffv_kinofreund.160x230.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/gaza-surf-club.html"><h6>Gaza Surf Club</h6></a>
                                <span class=distributor-name>farbfilm verleih</span><br>
                                <span class=release-date>Release Date:
                                    30.03.2017
                                </span>
                            </div>
                            <div class=trailer_list_item>
                                <div class="bagde trailer_updated"></div>
                                <a href="f/storm-und-der-verbotene-brief.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/203480984_STORM_Plakat_A4_72dpi.jpg" data-src="/upload/trailer/poster/203480984_STORM_Plakat_A4_72dpi.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/storm-und-der-verbotene-brief.html"><h6>Storm und der verbotene Brief</h6></a>
                                <span class=distributor-name>farbfilm verleih</span><br>
                                <span class=release-date>Release Date:
                                    23.03.2017
                                </span>
                            </div>
                            <div class=trailer_list_item>
                                <a href="f/pawlenski-der-mensch-und-die-macht.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/1281770149_Pawlenski_Plakat_A4_klein.jpg" data-src="/upload/trailer/poster/1281770149_Pawlenski_Plakat_A4_klein.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/pawlenski-der-mensch-und-die-macht.html"><h6>Pawlenski - Der Mensch und die Macht</h6></a>
                                <span class=distributor-name>Lichtfilm</span><br>
                                <span class=release-date>Release Date:
                                    16.03.2017
                                </span>
                            </div>

                            <div class=trailer_list_item>
                                <a href="f/zazy.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/595542694_ZAZY_Plakat_Mail.jpg" data-src="/upload/trailer/poster/595542694_ZAZY_Plakat_Mail.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f/zazy.html"><h6>Zazy</h6></a>
                                <span class=distributor-name>Real Fiction</span><br>
                                <span class=release-date>Release Date:
                                    30.03.2017
                                </span>
                            </div>
                            <div class=trailer_list_item>
                                <div class="bagde trailer_updated"></div>
                                <a href="f.html">
                                    <img src="img/fleximg_scale/150/0/upload/trailer/poster/621409776_WDVF_Plakat_final.jpg" data-src="/upload/trailer/poster/621409776_WDVF_Plakat_final.jpg" alt="" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="f.html"><h6>Wenn der Vorhang fällt</h6></a>
                                <span class=distributor-name>Zorro Film</span><br>
                                <span class=release-date>Release Date:
                                    30.03.2017
                                </span>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
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
        </div>
        <script type="text/javascript">

            
            var type =<%=user_type%>
            $("#logout").hide();
            if (type === 0)
            {

                $("#sign").hide();
                $("#login").hide();
                $("#logout").show();

            }
           



        </script>

    </body>
</html>