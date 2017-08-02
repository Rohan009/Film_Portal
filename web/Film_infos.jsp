<%-- 
    Document   : Film infos
    Created on : Feb 3, 2017, 5:46:39 PM
    Author     : Earth
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Film - Information</title>
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="css/bootstrap.min.js">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/simple-sidebar.css" rel="stylesheet">

    </head>

    <body>


        <jsp:include page="menu.jsp"/>
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
            <!-- /#page-content-wrapper -->
            <div id="page-content-wrapper">  
                <div class="container">

                    <div class="row">
                        <div class="col-lg-15">
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
                            </head>
                            <body>

                                <form action="Store_Poster" method="post" enctype="multipart/form-data">
                                    <p class="auto-style3">
                                        &nbsp;</p>
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style8">
                                                <img alt="Film Poster" class="auto-style7" src="" id="myimage"/><br />
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
                                                <input id="Text1" class="auto-style11" type="text" name="Film_title" required/><br />
                                                <br />
                                                Cinema Start :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Genre :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Length <br />
                                                <input id="Text2" class="auto-style12" type="date" name="Cinema_start" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select  name="Genre" class="auto-style12" style="height: 23px;margin: 0px;" required>
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
                                                </select>&nbsp;
                                                <input id="Text4" class="auto-style13" type="text" name="Length"/><input id="Text5" class="auto-style14" type="text" value="min" readonly="readonly" style="width:37px" /><br />
                                                <br />
                                                Director&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Year<br />
                                                <input id="Text6" class="auto-style12" type="text" name="director" required/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text7" class="auto-style12" type="text" name="year" required/><br />
                                                <br />
                                                Actor<br />
                                                <input id="Text8" class="auto-style15" type="text" name="actor" required/><br />
                                                <br />
                                                Production Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Website<br />
                                                <input id="Text9" class="auto-style16" type="text" name="Production_country" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text10" class="auto-style17" type="text" name="website"/><br />
                                                <br />
                                                Language&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sub-Title<br />
                                                <input id="Text11" class="auto-style16" type="text" name="Language" required/>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text12" class="auto-style16" type="text" name="subtitle"/><br />
                                                <br />
                                                Frame Rate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Picture Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Audio Format<br />
                                                <input id="Text13" class="auto-style16" type="text" name="frame_rate"/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text14" class="auto-style16" type="text" name="picture_format"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="Text15" class="auto-style16" type="text" name="audio_format"/><br />
                                                <br />
                                                Version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rated&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2D / 3D<br />
                                                <input id="Text16" class="auto-style16" type="text" name="version"/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text17" class="auto-style16" type="text" name="rated"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <select  class="auto-style16" style="height: 23px;" name="video_format" required>
                                                     <option value="">Select option</option>
                                                    <option value="2D">2D</option>
                                                    <option value="3D">3D</option>       
                                                </select>
                                                <br /><br />
                                                DVD/BRD Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VoD Start<br />
                                                <input id="Text19" class="auto-style16" type="text" name="dvd_start"/>&nbsp;&nbsp;&nbsp;
                                                <input id="Text20" class="auto-style16" type="text" name="vod_start"/><br />
                                                <br />
                                                Description<br />
                                                <br />
                                                <textarea id="TextArea1" class="auto-style18" name="description"></textarea><br />
                                                <br />
                                                <br />
                                                <input id="Button1" class="auto-style19" type="submit" value="SAVE" /><br />
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
                    </div>
                </div>

                </body>

            </div>
        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>





</html>

