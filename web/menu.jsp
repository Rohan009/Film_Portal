<%-- 
    Document   : menu
    Created on : Feb 11, 2017, 3:10:25 PM
    Author     : Earth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang=de>

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Media</title>


        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/simple-sidebar.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
         <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>
        <style>

            .sidebar-nav li a {
                display: block;
                text-decoration: none;
                color: black;
            }
            .sidebar-nav > .sidebar-brand a {
                color: black;
                font-weight: 700;
            }

            .sidebar-nav{
                margin-left: 8px;   
            }

            .sidebar-nav li a:hover {
                text-decoration: none;
                color: black;
                background: #768e9b;
            }
            .sidebar-nav > .sidebar-brand a:hover {
                color: black;
                background: none;
            }


        </style>

    </head>
    <body>
        
        <%
            
//            String Title=request.getParameter("Film_title");
//            String Cinema_start=request.getParameter("Cinema_start");
//            String Genre=request.getParameter("Genre");
//            String Length=request.getParameter("Length");
//            String Director=request.getParameter("director");
//            String Year=request.getParameter("year");
//            String Actor=request.getParameter("actor");
//            String Production_country=request.getParameter("Production_country");
//            String Website=request.getParameter("website");
//            String Language=request.getParameter("Language");
//            
//            
//            String Subtitle=request.getParameter("subtitle");
//            String Fram_rate=request.getParameter("frame_rate");
//            String Picture_format=request.getParameter("picture_format");
//            String Audio_format=request.getParameter("audio_format");
//            
//            String Version=request.getParameter("version");
//            String Rated=request.getParameter("rated");
//            String Video_format=request.getParameter("video_format");
//            String Dvd_start=request.getParameter("dvd_start");
//            
//            String Vod_start=request.getParameter("vod_start");
//            String Description=request.getParameter("description");
            
       String id=session.getAttribute("userid").toString();
            
            %>
        <div class="header_container">
            <div class="container-narrow">
                <div>
                    <ul class="nav nav-pills pull-right">

                        
                        <li id="logout" style="margin:-17px"><a href="logout">Logout</a></li>	</ul>
                </div>	</div>
        </div>
<!--         <div class="">
            <div class="">
                <div>
                    <ul class="nav nav-pills pull-right">

                        <li id="logout"><a href="logout"  style="margin-right: 150px;cursor: pointer;">Logout</a></li>	</ul>
                </div>	
            </div>
        </div>
        -->
        
      
       <div id="sidebar-wrapper" style="background-color: #ddd">
            <ul class="sidebar-nav">
                <li class="sidebar-brand" >
                    <a href="#">
                        Online Media Sharing
                    </a>
                </li>
                <label onclick="window.location.href='distributor_data.jsp?u='+<%=id%>"><h4>My Trailers</h4></label>
                <li>
                  
                </li>
                
                <label onclick="show()"><h4>Add Trailers</h4></label>
                <li>
                 
                </li>
                 <div id="addt">
                 <label><h5>Film</h5></label> 
                <li>
                    <a href="Film_infos.jsp">Film Information</a>
                </li>
                <li>
                    <a href="Multiple_Destinies.jsp">Settings</a>
                </li>
                <label><h5>Files</h5></label> 
                <li>
                    <a href="Data_Pole.jsp">Data Pool</a>
                </li>
                <li>
                    <a href="Trailer.jsp">Trailer</a>
                </li>
                <li>
                    <a href="Press_Material.jsp">Press Material</a>
                </li>
                <li>
                    <a href="Screen.jsp">Screen</a>
                </li>
                </div>
<!--                <label>KDM Generator</label>
                <br>
                <input type="button" value="New start" name="New start" />
                <br>-->

                <!--                <input type="file" name="File upload" value="" />-->

            </ul>
       </div>
    </div>
    <script>
    $('#addt').hide();
    function show()
    {
        $('#addt').show();
    }
    
    </script>
        
</body>
</html>
