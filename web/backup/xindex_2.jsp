<%-- 
    Document   : index
    Created on : Jun 10, 2016, 11:09:14 AM
    Author     : Papah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mengaji Text to Speech</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="icon" href="assets/img/quran.ico" type="image/x-icon">
        <style type="text/css">
            textarea.form-control{
                font-size: 40px;
                direction: rtl;
                font-family:adobe arabic;
            }
        </style>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            function myFunction() {
                var txt = '', str = document.getElementById("karakter").value;
                var len = str.length;
                $('#arabictext').text(str);
                $('#hitung').text(len);

                //str = str.value;
                for (i = 0; i < len; i++) {
                    txt = txt + ' #' + String(str.charCodeAt(i));
                }
                $('#ascii').text(txt);
                document.textform.submit();
            }
            function myFunction2() {
                $('#ascii').text($('#karakter').val());
            }
        </script>
    </head>
    <body>
        <jsp:useBean id="arabictext" class="beans.arabictext">
            <jsp:setProperty name="arabictext" property="*"/>
        </jsp:useBean>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Welcome to Arabic Text to Speech Application</h2>
                        <div class="form-group">
                            <form name="textform" action="index.jsp" method="POST">
                                <table width="100%">
                                    <tr>
                                        <td><label for="karakter">Insert arabic text:</label></td>
                                        <td align="right">
                                            <button type="submit" class="btn btn-default">
                                                <span class="glyphicon glyphicon-volume-up"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                                <textarea id="karakter" name="karakter" class="form-control" rows="3" autofocus></textarea>
                                <button type="button" onclick="myFunction()">Try it</button>
                            </form>
                            text: <jsp:getProperty name="arabictext" property="karakter" /><br>
                            arabic text: <span id="arabictext">-</span><br>
                            unicode: <span id="ascii">-</span><br>
                            number of text: <span id="hitung">-</span> karakter.
                            <button onclick="document.getElementById('audio').play()">Play</button>
                            <audio id="audio" src="assets/audio/1.mp3"></audio> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="text.jsp">text</a>
    </body>
</html>
