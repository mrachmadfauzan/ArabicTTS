<%-- 
    Document   : listAll
    Created on : Apr 15, 2017, 2:47:12 PM
    Author     : mr-fao
--%>
<jsp:useBean id="arabictext" class="beans.arabictext" scope="session">
    <jsp:setProperty name="arabictext" property="textNum"/>
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
                var txtx = str.split("-");
                for(i = 0;i < txtx.length-1;i++){
                    txt[i] = [];
                    txt[i][0] = txtx[i].charAt(0);
                    txt[i][1] = '&amp#' + txtx[i].charCodeAt(0);
                    txt[i][2] = '';
                    txt[i][3] = '';
                    for(j = 1;j < txtx[i].length;j++){
                        txt[i][2] = txt[i][2] + txtx[i].charAt(j);
                        txt[i][3] = txt[i][3] + '&amp#' + txtx[i].charCodeAt(j);
                    }
                }
                
                var tmp = '<table class="table table-striped" border="1">\n\
                                    <thead>\n\
                                        <tr><th>No</th>\n\
                                        <th>Angka Arab</th>\n\
                                        <th>Kode Unicode Angka Arab</th>\n\
                                        <th>Penulisan Pengucapan</th>\n\
                                        <th>Rangkaian Kode Unicode Penulisan Pengucapan</th></tr>\n\
                                    </thead><tbody>';
                for (i = 0; i < txt.length; i++) {
                    tmp += '<tr><td>' + (i + 1) + '</td><td><p>' + txt[i][0] + '</p></td><td>' + txt[i][1] + '</td><td>' + txt[i][2] + '</td><td>' + txt[i][3] + '</td></tr>';
                }
                tmp += '</tbody></table>';
                
                document.getElementById("char").innerHTML = tmp;
                
            }
            window.onload = myFunction;
        </script>
    </head>
    <body>

        <h1>Daftar Konversi Angka Arab ke Teks Penulisan Pengucapannya</h1>

        <p><span id="char">-</span></p>
        <span id="ArabicText"><h3 hidden><jsp:getProperty name="arabictext" property="textNum" /></h3></span>
    </body>
</html>
