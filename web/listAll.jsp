<%-- 
    Document   : listAll
    Created on : Apr 15, 2017, 2:47:12 PM
    Author     : mr-fao
--%>
<jsp:useBean id="arabictext" class="beans.arabictext" scope="session">
    <jsp:setProperty name="arabictext" property="textAll"/>
</jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Arabic TTS</title>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">    
        <link rel="shortcut icon" href="assets/images/arabictts_small.ico">  

        <!-- Global CSS -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Plugins CSS -->    
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="assets/plugins/prism/prism.css">
        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">

        <!-- Javascript -->          
        <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
        <script type="text/javascript" src="assets/plugins/jquery.easing.1.3.js"></script>   
        <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>     
        <script type="text/javascript" src="assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script> 
        <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>    
        <script type="text/javascript" src="assets/js/main.js"></script>       
        <script type="text/javascript">

            function myFunction() {
                var txt = [], str = document.getElementById("ArabicText").textContent;
                var len = str.length;

                for (i = 0; i < len; i++) {
                    txt[i] = [];
                    txt[i][0] = str.charAt(i);
                    txt[i][1] = '&amp#' + str.charCodeAt(i);
                }
                var txt2 = '<table class="table table-striped" border="1">\n\
                                    <thead>\n\
                                        <tr><th>No</th>\n\
                                        <th>Karakter</th>\n\
                                        <th>Karakter dalam Unicode</th></tr>\n\
                                    </thead><tbody>';
                for (i = 0; i < len; i++) {
                    txt2 += '<tr><td>' + (i + 1) + '</td><td><p>' + txt[i][0] + '</p></td><td>' + txt[i][1] + '</td></tr>';
                }
                txt2 += '</tbody></table>';

                document.getElementById("char").innerHTML = txt2;
            }
            window.onload = myFunction;
        </script>
    </head>
    <body>

        <h1>Daftar Karakter yang Diterima Sistem</h1>

        <p><span id="char">-</span></p>
        <span id="ArabicText"><h3 hidden><jsp:getProperty name="arabictext" property="textAll" /></h3></span>
    </body>
</html>
