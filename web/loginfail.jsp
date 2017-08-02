<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Blob</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="js/jquery-1.11.1.min.js">
        <link rel="stylesheet" href="js/bootstrap.min.css">
        <link rel="stylesheet" href="js/bootstrap.min.js">
         <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            

            $("#upload").click(function () {
                alert();
                //call show loading function here
                showLoading();
                $.ajax({
                    type: "POST",
                    url: "blob_test.java",
                    enctype: 'multipart/form-data',
                    data: {
                        
                    },
                    success: function () {
                        //call hide function here
                        hideLoading();
                        alert("Data has been Uploaded: ");
                    },
                    error: function (a) {//if an error occurs
                        hideLoading();
                        alert("An error occured while uploading data.\n error code : " + a.statusText);
                    }
                });
            });
            
             function sess()
            {
                $("#ab").hide();
            }
            
            
            function load()
            {
                $.ajax({
                    type: "POST",
                    url: "blob_test.java",
                    enctype: 'multipart/form-data',
                    data: {
                        
                    },
                    success: function () {
                        //call hide function here
                        hideLoading();
                        alert("Data has been Uploaded: ");
                    },
                    error: function (a) {//if an error occurs
                        hideLoading();
                        alert("An error occured while uploading data.\n error code : " + a.statusText);
                    }
                });
                
                
            }
        </script>


    </head>
    <body onload="sess()">
        <form action="#" enctype="multipart/form-data" onsubmit="load();" method="post" >
<br>
            <input type="file" name="blobs">
            <br>
            
            <input type="submit" value="submit" id="upload">
            
            <div id="upload" class="ac">Hello Ajax </div>
        </form>
  
    </body>
</html>
