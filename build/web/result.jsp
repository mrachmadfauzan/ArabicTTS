<%-- 
    Document   : index
    Created on : Jun 10, 2016, 11:09:14 AM
    Author     : Papah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Arabic TTS</title>
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
            var filenameAudio;
            
            function playAudio() {
                var audio = new Audio(filenameAudio);
                audio.play();
            }
            function myFunction() {
                var txt = [], txtCode = '', str = document.getElementById("ArabicText").textContent;
                var len = str.length, txtUnicode = '';
                filenameAudio = 'assets/audio/'+document.getElementById("srcAudio").textContent;
                document.getElementById("cb").innerHTML = filenameAudio;
                $('#hitung').text(len);

                for (i = 0; i < len; i++) {
                    txt[i] = [];
                    txt[i][0] = str.charAt(i);
                    txt[i][1] = '&amp#' + str.charCodeAt(i);
                    txtCode += '&#' + str.charCodeAt(i);
                    txtUnicode += ' &amp#' + str.charCodeAt(i);
                }
                var txt2 = '<table class="table table-striped">\n\
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
                document.getElementById("ascii").innerHTML = txtUnicode;
                document.getElementById("sendCharacter").value = txtCode;

            }
            window.onload = myFunction;
        </script>
    </head>
    <body>
        <jsp:useBean id="arabictext" class="beans.arabictext">
            <jsp:setProperty name="arabictext" property="sendCharacter" value="${param.sendCharacter}" />
            <jsp:setProperty name="arabictext" property="textTasydid" value="${param.textTasydid}" />
            <jsp:setProperty name="arabictext" property="textSukun" value="${param.textSukun}" />
            <jsp:setProperty name="arabictext" property="textHasilTTP" value="${param.textHasilTTP}" />
            <jsp:setProperty name="arabictext" property="textHasilTTPunicode" value="${param.textHasilTTPunicode}" />
            <jsp:setProperty name="arabictext" property="textSequencer" value="${param.textSequencer}" />
            <jsp:setProperty name="arabictext" property="textDBMate" value="${param.textDBMate}" />
            <jsp:setProperty name="arabictext" property="textAudio" value="${param.textAudio}" />
        </jsp:useBean>
        <div class="jumbotron">
            <div class="container">
                Arabic Phoneme Table | 
                Arabic Unicode |
                <p>Output: <span id="cb"></span></p>
                <a href="javascript:window.open(filenameAudio)"> Download </a>
                <div class="row">
                    <div class="col-sm-12">
                        <h1 align="center"><span id="ArabicText"><jsp:getProperty name="arabictext" property="sendCharacter" /></span></h1>
                        <div class="form-group">

                            <table width="100%">
                                <tr>

                                    <td align="right">
                                        <button onclick="playAudio()" class="btn btn-default">
                                            <span class="glyphicon glyphicon-volume-up"></span>
                                        </button>
                                    </td>
                                </tr>
                            </table>


                            <h2>Data teks</h2>
                            <ol>
                                <li>
                                    Banyaknya karakter: <span id="hitung">-</span><br>
                                </li>
                                <li>
                                    Daftar karakter:<br> <span id="char">-</span><br>
                                </li>
                                <li>
                                    Daftar nomor unicode dari teks: <span id="ascii">-</span><br>
                                </li>
                            </ol>
                            <h2>Text to Phoneme</h2>
                            <ol>
                                <li>
                                    Aturan Tasydid<br>
                                    Mengganti penulisan tasydid menjadi bentuk penulisan pengucapannya.
                                    <h3><jsp:getProperty name="arabictext" property="textTasydid" /></h3>
                                </li>
                                <li>
                                    Aturan Sukun<br>
                                    Menghilangkan tanda sukun/mati.
                                    <h3><jsp:getProperty name="arabictext" property="textSukun" /></h3>
                                </li>
                                <li>
                                    Daftar fonem<br>
                                    Hasil pemrosesan Text to Phoneme berupa urutan fonem yang akan diproses menjadi ucapan. Fonem-fonem tersebut yaitu:<br>
                                    <ul>
                                        <li>
                                            Dalam karakter Arab.
                                            <h3><jsp:getProperty name="arabictext" property="textHasilTTP" /></h3>
                                        </li>
                                        <li>
                                            Dalam nomor unicode (desimal).
                                            <p><jsp:getProperty name="arabictext" property="textHasilTTPunicode" /></p>
                                        </li>
                                    </ul>
                                </li>
                            </ol>
                            <h2>Phoneme to Speech</h2>
                            <ol>
                                <li>
                                    Sequencer<br>
                                    Menyusun fonem-fonem ke dalam bentuk pasangan fonem (dua fonem/diphone).
                                    <p><jsp:getProperty name="arabictext" property="textSequencer" /></p>
                                </li>
                                <li>
                                    Memanggil data audio (segmen suara) dari basis data suara diphone.
                                    <p><jsp:getProperty name="arabictext" property="textDBMate" /></p>
                                </li>
                                <li>
                                    Menyambung segmen-segmen suara diphone menjadi sebuah file suara.
                                    <span id="srcAudio"><p><a onclick="playAudio()"><jsp:getProperty name="arabictext" property="textAudio" />.wav</a></p></span>
                                </li>
                            </ol>

                            Grafik audio? --> <a href="https://developers.google.com/chart/?csw=1">https://developers.google.com/chart/?csw=1<br></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
