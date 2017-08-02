<%-- 
    Document   : confirm_film_info
    Created on : 29 Jun, 2017, 3:08:04 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Film - Infos</title>
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.js">
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <style>
            table, th, td {

                width: 600px;
                height: 30px;


            }
            /*            
                        table {
                            border: 1px solid black;
                        }*/
            input{
                height: 30px;
            }

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

            /*            div.left{
                            width:500px; 
                           }
                         
                        div.right{
                            width:400px; 
                            margin-left:60%;
                            margin-bottom: 20%;
                        }*/
        </style>


    </head>

    <body>




        <div id="sidebar-wrapper" style="background-color: #ddd">
            <ul class="sidebar-nav">
                <li class="sidebar-brand" >
                    <a href="#">
                        Online Media Sharing
                    </a>
                </li>
                <label>Film</label> 
                <li>
                    <a href="Film infos.jsp">Film Information</a>
                </li>
                <li>
                    <a href="Multiple_Destinies.jsp">Settings</a>
                </li>
                <label>Files</label> 
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
                <label>KDM Generator</label>
                <br>
                <input type="button" value="New start" name="New start" />
                <br>

                <!--                <input type="file" name="File upload" value="" />-->

            </ul>
        </div>
    </div>
    <div id="wrapper">
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Film Information</h1>
                        <p></p>

                    </div>
                </div>
            </div>
        </div>     
    </div>
    <!-- /#page-content-wrapper -->


    <script>
        function onFileSelect(event) {
            var selectedFile = event.target.files[0];
            var reader = new FileReader();

            var imgtag = document.getElementById("myimage");
            imgtag.title = selectedFile.name;

            reader.onload = function (event) {
                imgtag.src = event.target.result;
            };

            reader.readAsDataURL(selectedFile);

        }


    </script>



    <%

        String Title = request.getParameter("Film_title");
        String Cinema_start = request.getParameter("Cinema_start");
        String Genre = request.getParameter("Genre");
        String Length = request.getParameter("Length");
        String Director = request.getParameter("director");
        String Year = request.getParameter("year");
        String Actor = request.getParameter("actor");
        String Production_country = request.getParameter("Production_country");
        String Website = request.getParameter("website");
        String Language = request.getParameter("Language");

        String Subtitle = request.getParameter("subtitle");
        String Fram_rate = request.getParameter("frame_rate");
        String Picture_format = request.getParameter("picture_format");
        String Audio_format = request.getParameter("audio_format");

        String Version = request.getParameter("version");
        String Rated = request.getParameter("rated");
        String Video_format = request.getParameter("video_format");
        String Dvd_start = request.getParameter("dvd_start");

        String Vod_start = request.getParameter("vod_start");
        String Description = request.getParameter("description");


    %>
    <!--    <table align="center" class="table-striped">
            <tr  width="200px">
                <td>Film title ::</td>
                <td> <input type="text"value="" style="width:25  0px"></td>
    
            </tr>
        </table>-->

    <div class="left" style="margin-left:20%">

        <table class="table-striped">
            <tr>
                <td>Film title ::</td>
                <td> <input type="text" value=" <% out.println(Title); %> " style="width:255px;float: right" class="input-sm" id="ft" disabled="diabled" name="Title"></td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="ft1">Edit</button></td>
            </tr>
            <tr>
                <td>Cinema Start ::</td>
                <td> <input type="text"value=" <% out.println(Cinema_start); %> " style="width:255px;float: right" class="input-sm" id="cs" disabled name="Cinema_start"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="cs1">Edit</button></td>

            </tr>
            <tr>
                <td>Genre ::</td>
                <td> <input type="text"value=" <% out.println(Genre); %> " style="width:255px;float: right" class="input-sm" id="gn" disabled name="Genre"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="gn1">Edit</button></td>

            </tr>
            <tr>
                <td>Length ::</td>
                <td>  <input type="text"value=" <% out.println(Length + " min"); %> " style="width:255px;float: right" class="input-sm" id="ln" disabled name="Length">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="ln1">Edit</button></td>

            </tr>
            <tr>
                <td>Director ::</td>
                <td> <input type="text" value=" <% out.println(Director + "as"); %> " style="width:255px;float: right" class="input-sm" id="dr" disabled name="Director"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="dr1" >Edit</button></td>

            </tr>
            <tr>
                <td>Year ::</td>
                <td> <input type="text"value=" <% out.println(Year); %> " style="width:255px;float: right" class="input-sm" id="yr" disabled name="Year">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="yr1" >Edit</button></td>

            </tr> <tr>
                <td>Actor ::</td>
                <td> <input type="text"value=" <% out.println(Actor); %> " style="width:255px;float: right" class="input-sm" id="act" disabled name="Actor">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="act1" >Edit</button></td>

            </tr> 
            <tr>
                <td>Production Country ::</td>
                <td>  <input type="text"value=" <% out.println(Production_country); %> " style="width:255px;float: right" class="input-sm" id="pc" disabled name="Production_country"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="pc1" >Edit</button></td>

            </tr> <tr>
                <td>Website ::</td>
                <td>  <input type="text"value=" <% out.println(Website); %> " style="width:255px;float: right" class="input-sm" id="wb" disabled name="Website"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="wb1" >Edit</button></td>

            </tr> <tr>
                <td>Language ::</td>
                <td>  <input type="text"value=" <% out.println(Language); %> " style="width:255px;float: right" class="input-sm" id="lg" disabled name="Language">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="lg1" >Edit</button></td>

            </tr>
            <!--        </table>
                </div>
                <div class="right">
                    <table class="table-striped">-->

            <tr>
                <td>SubTitle ::</td>
                <td> <input type="text"value=" <% out.println(Subtitle); %> " style="width:255px;float: right" class="input-sm" id="st" disabled name="Subtitle">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="st1" >Edit</button></td>

            </tr> <tr>
                <td>FrameRate ::</td>
                <td> <input type="text"value=" <% out.println(Fram_rate); %> " style="width:255px;float: right" class="input-sm" id="fr" disabled name="Fram_rate">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="fr1" >Edit</button></td>

            </tr> <tr>
                <td>Picture Format ::</td>
                <td> <input type="text"value=" <% out.println(Picture_format); %> " style="width:255px;float: right" class="input-sm" id="pf" disabled name="Picture_format"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="pf1" >Edit</button></td>

            </tr> <tr>
                <td>Audio Format ::</td>
                <td> <input type="text"value=" <% out.println(Audio_format); %> " style="width:255px;float: right" class="input-sm" id="af" disabled name="Audio_format"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="af1" >Edit</button></td>

            </tr> <tr>
                <td>Version ::</td>
                <td> <input type="text"value=" <% out.println(Version); %> " style="width:255px;float: right" class="input-sm" id="vr" disabled name="Version"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="vr1" >Edit</button></td>

            </tr> <tr>
                <td>Rated ::</td>
                <td>  <input type="text"value=" <% out.println(Rated); %> " style="width:255px;float: right" class="input-sm" id="rt" disabled name="Rated">  </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="rt1" >Edit</button></td>

            </tr>
            <tr>
                <td>2D/3D ::</td>
                <td>  <input type="text"value=" <% out.println(Video_format); %> " style="width:255px;float: right" class="input-sm" id="vf" disabled name="Video_format"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="vf1" >Edit</button></td>

            </tr> <tr>
                <td>DVD/BRD Start ::</td>
                <td> <input type="text"value=" <% out.println(Dvd_start); %> " style="width:255px;float: right" class="input-sm" id="dvd" disabled name="Dvd_start"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="dvd1" >Edit</button></td>

            </tr> <tr>
                <td>VoD Start ::</td>
                <td>  <input type="text"value=" <% out.println(Vod_start); %> " style="width:255px;float: right" class="input-sm" id="vod" disabled name="Vod_start"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="vod1" >Edit</button></td>

            </tr> <tr>
                <td>Description ::</td>
                <td> <input type="text"value=" <% out.println(Description);%> " style="width:255px;float: right" class="input-sm" id="des" disabled name="Description"> </td>
                <td style="background-color: white"><button type="button" class="btn-sm" style="margin-left: 7px" id="des1" >Edit</button></td>

            </tr>
        </table>
        <br>
        <div style="margin-left: 12%">
            <input type="button" value="Cancel" onclick="window.location.href = 'Film_infos.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Confirm" name="forward" onclick="upload()">
        </div>

    </div>

    <br>

    <script>

        function upload()
        {

            var a1 = "<%=Title%>";
            var uri1 = encodeURIComponent(a1);
            var a2 = "<%=Cinema_start%>";
            var uri2 = encodeURIComponent(a2);
            var a3 = "<%=Genre%>";
            var uri3 = encodeURIComponent(a3);
            var a4 = "<%=Length%>";
            var uri4 = encodeURIComponent(a4);           
            var a5 = "<%=Director%>";
            var uri5 = encodeURIComponent(a5);           
            var a6 = "<%=Year%>";
            var uri6 = encodeURIComponent(a6);          
            var a7 = "<%=Actor%>";
            var uri7 = encodeURIComponent(a7);
            var a8 = "<%=Production_country%>";
            var uri8 = encodeURIComponent(a8);
            var a9 = "<%=Website%>";
            var uri9 = encodeURIComponent(a9);
            var a10 = "<%=Language%>";
            var uri10 = encodeURIComponent(a10);
            var a11 = "<%=Subtitle%>";
            var uri11 = encodeURIComponent(a11);
            var a12 = "<%=Fram_rate%>";
            var uri12 = encodeURIComponent(a12);
            var a13 = "<%=Picture_format%>";
            var uri13 = encodeURIComponent(a13);
            var a14 = "<%=Audio_format%>";
            var uri14 = encodeURIComponent(a14);
            var a15 = "<%=Version%>";
            var uri15 = encodeURIComponent(a15);
            var a16 = "<%=Rated%>";
            var uri16 = encodeURIComponent(a16);
            var a17 = "<%=Video_format%>";
            var uri17 = encodeURIComponent(a17);
            var a18 = "<%=Dvd_start%>";
            var uri18 = encodeURIComponent(a18);
            var a19 = "<%=Vod_start%>";
            var uri19 = encodeURIComponent(a19);
            var a20 = "<%=Description%>";
            var uri20 = encodeURIComponent(a20);
            window.location.href = "Multiple_Destinies.jsp?t=" + uri1 + "&c=" + uri2+ "&g=" + uri3+ "&l=" + uri4+ "&d=" + uri5+ "&y=" + uri6+ "&a=" + uri7+ "&p=" + uri8+ "&w=" + uri9+ "&l=" + uri10+ "&s=" + uri11+ "&fr=" + uri12+ "&pf=" + uri13+ "&af=" + uri14+ "&v=" + uri15+ "&r=" + uri16+ "&vf=" + uri17+ "&ds=" + uri18+ "&vs=" + uri19+ "&des=" + uri20;
        }

        $('#ft1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#ft').prop("disabled", false);
        });

        $('#cs1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#cs').prop("disabled", false);
        });


        $('#gn1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#gn').prop("disabled", false);
        });


        $('#ln1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#ln').prop("disabled", false);
        });


        $('#dr1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#dr').prop("disabled", false);
        });


        $('#yr1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#yr').prop("disabled", false);
        });


        $('#act1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#act').prop("disabled", false);
        });


        $('#pc1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#pc').prop("disabled", false);
        });


        $('#wb1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#wb').prop("disabled", false);
        });


        $('#lg1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#lg').prop("disabled", false);
        });


        $('#st1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#st').prop("disabled", false);
        });


        $('#fr1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#fr').prop("disabled", false);
        });


        $('#pf1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#pf').prop("disabled", false);
        });


        $('#af1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#af').prop("disabled", false);
        });


        $('#vr1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#vr').prop("disabled", false);
        });

        $('#rt1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#rt').prop("disabled", false);
        });

        $('#vf1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#vf').prop("disabled", false);
        });

        $('#dvd1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#dvd').prop("disabled", false);
        });

        $('#vod1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#vod').prop("disabled", false);
        });



        $('#des1').click(function () {
            //$("#s1").prop("style", "display:button");
            $('#des').prop("disabled", false);
        });
    </script>



</body>

</html>