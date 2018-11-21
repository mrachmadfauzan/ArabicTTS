<%-- 
    Document   : index
    Created on : Jun 10, 2016, 11:09:14 AM
    Author     : Papah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TTS?</title>
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
                var txt = [], txtCode = '', str = document.getElementById("karakter").value;
                var len = str.length;
                $('#arabictext').text(str);
                $('#hitung').text(len);

                for (i = 0; i < len; i++) {
                    txt[i] = [];
                    txt[i][0] = str.charAt(i);
                    txt[i][1] = '&amp#' + str.charCodeAt(i);
                    txtCode += '&#' + str.charCodeAt(i);

                }
                var txt2 = '<table class="table table-striped">\n\
                                <thead>\n\
                                    <tr><th>Number</th>\n\
                                    <th>Character</th>\n\
                                    <th>Entity Number</th></tr>\n\
                                </thead><tbody>';
                for (i = 0; i < len; i++) {
                    txt2 += '<tr><td>' + (i + 1) + '</td><td><p>' + txt[i][0] + '</p></td><td>' + txt[i][1] + '</td></tr>';
                }
                txt2 += '</tbody></table>';

                document.getElementById("char").innerHTML = txt2;
                document.getElementById("sendCharacter").value = txtCode;
                document.getElementById("ascii").innerHTML = txtCode;

            }
        </script>
    </head>
    <body>
        <jsp:useBean id="arabictext" class="beans.arabictext">
            <jsp:setProperty name="arabictext" property="sendCharacter" value="${param.sendCharacter}" />
        </jsp:useBean>
        <audio controls>
            <source src="assets/audio/1.mp3" type="audio/mpeg">
        </audio> 
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Welcome to Arabic Text to Speech Application</h2>
                        <div class="form-group">
                            <form target="_blank" name="textform" action="index.jsp" method="POST">
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
                                <button type="submit" onclick="myFunction()" action="index.jsp">Analysis</button>
                                <input type="hidden" id="sendCharacter" name="sendCharacter">
                            </form>
                            Detail: <jsp:getProperty name="arabictext" property="sendCharacter" /><br>
                            arabic text: <span id="arabictext">-</span><br>
                            number of character: <span id="hitung">-</span><br>
                            character list:<br> <span id="char">-</span><br>
                            unicode: <span id="ascii">-</span><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
