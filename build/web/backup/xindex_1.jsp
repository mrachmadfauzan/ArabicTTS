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
            $(document).ready(function () {
                var txt = '', str;
                $('#karakter').change(function () {
                    var len = this.value.length;
                    if (len >= 50) {
                        this.value = this.value.substring(0, 50);
                    }
                    $('#hitung').text(50 - len);

                    str = this.value;
                    txt = txt + ' #' + String(str.charCodeAt(len - 1));
                    $('#ascii').text(txt);
                });
            });
        </script>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Welcome to 
                            <img src="assets/img/quran.png">
                            Mengaji</h2>
                        <div class="form-group">
                            <table width="100%">
                                <tr>
                                    <td><label for="karakter">Insert arabic text:</label></td>
                                    <td align="right">
                                        <button type="button" class="btn btn-default">
                                            <span class="glyphicon glyphicon-volume-up"></span>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                            <textarea id="karakter" class="form-control" rows="3" autofocus></textarea>
                            unicode: <span id="ascii">-</span><br>
                            <span id="hitung">50</span> karakter tersisa.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="text.jsp">text</a>
    </body>
</html>
