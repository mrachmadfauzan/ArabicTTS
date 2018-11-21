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
        <link rel="stylesheet" href="assets/css/sticky-footer-navbar.css">
        <link rel="icon" href="assets/images/arabictts_small.ico" type="image/x-icon">
        <style type="text/css">
            textarea.form-control{
                font-size: 40px;
                direction: rtl;
                font-family:adobe arabic;
            }
        </style>
        <style>
            /* Note: Try to remove the following lines to see the effect of CSS positioning */
            .affix {
                top: 0;
                width: 100%;
            }

            .affix + .container-fluid {
                padding-top: 70px;
            }
            /* navbar */
            .navbar-inverse {
                background-color: white;
                border-color: white;
            }
        </style>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            function myFunction() {
                var txtCode = '', str = document.getElementById("karakter").value;
                var len = str.length;

                for (i = 0; i < len; i++) {
                    txtCode += '&#' + str.charCodeAt(i);
                }

                document.getElementById("sendCharacter").value = txtCode;
            }
            function clearFunction() {
                var txt = "";
                document.getElementById("karakter").value = txt;
            }
            
        </script>
    </head>
    <body>
        <div class="container" style="padding-top: 0">
            <div class="page-header">
                <img src="assets/img/ArabicTTS-small.png">
            </div>
            <h2>Aplikasi pengubah teks menjadi suara untuk tulisan bahasa Arab.</h2>
        </div>
        <nav class="navbar navbar-inverse navbar-static-top" data-spy="affix" data-offset-top="197">
            <div class="container">
                <div class="form-group">
                    <form target="_blank" name="textform" action="hasil.jsp" method="POST">
                        <div class="form-group"  id="affix-this">
                            <label for="karakter">Masukkan teks Arab dilengkapi dengan harakat:</label>
                            <textarea id="karakter" name="karakter" class="form-control" rows="1" autofocus required></textarea>
                        </div>
                        <div class="btn-group">
                            <input  class="btn btn-warning" type="submit" onclick="myFunction()" value="PROSES">
                            <input  class="btn btn-warning" type="button" onclick="clearFunction()" value="BERSIHKAN">
                            <input  class="btn btn-warning" type="button" value="Bantuan">
                        </div>
                        <input type="hidden" id="sendCharacter" name="sendCharacter">
                    </form>
                </div>
            </div>
        </nav>
        <div class="container" style="alignment-baseline: middle; padding-top: 0">
            Contoh, klik pada teks Arab di bawah sebagai pilihan teks masukan.
        </div>
        <div class="container" style="direction: rtl; padding-top: 0">
            <div class="row">
                <div class="col-sm-12">
                    <h3>إِظْهَارْ:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar1').textContent;">
                        <span id="idzhar1" style="display: inline-block"><h3>رَسُوْلٌ أَمِيْنٌ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar2').textContent;">
                        <span id="idzhar2" style="display: inline-block"><h3>عَلِيْمٌ حَلِيْمٌ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar3').textContent;">
                        <span id="idzhar3" style="display: inline-block"><h3>مِنْ خَيْرٍ</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar4').textContent;">
                        <span id="idzhar4" style="display: inline-block"><h3>يَنْعِقُ بِمَا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar5').textContent;">
                        <span id="idzhar5" style="display: inline-block"><h3>مِنْ غِلٍّ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idzhar6').textContent;">
                        <span id="idzhar6" style="display: inline-block"><h3>قَوْمٍ هَادٍ</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>إِدْغَامْ بِلَاغُنَّةٍ:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBilaghunnah2').textContent;">
                        <span id="idghomBilaghunnah2" style="display: inline-block"><h3>مِنْ رَّبِّكُمْ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBilaghunnah1').textContent;">
                        <span id="idghomBilaghunnah1" style="display: inline-block"><h3>هُدًى لِّلْمُتَّقِيْنَ</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>إِدْغَامْ بِغُنَّةٍ:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBighunnah2').textContent;">
                        <span id="idghomBighunnah2" style="display: inline-block"><h3>وَمَنْ مَّعَهُ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBighunnah1').textContent;">
                        <span id="idghomBighunnah1" style="display: inline-block"><h3>حِطَّةٌ نَّغْفِرْلِكُمْ</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBighunnah4').textContent;">
                        <span id="idghomBighunnah4" style="display: inline-block"><h3>وَمَنْ يَّعْمَلْ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('idghomBighunnah3').textContent;">
                        <span id="idghomBighunnah3" style="display: inline-block"><h3>فَاحِشَةً وَّمَقْتًا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>إِقْلَابْ:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('iqlab3').textContent;">
                        <span id="iqlab3" style="display: inline-block"><h3>أَنْبَأَكَ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('iqlab2').textContent;">
                        <span id="iqlab2" style="display: inline-block"><h3>مِنْ بَعْدِ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('iqlab1').textContent;">
                        <span id="iqlab1" style="display: inline-block"><h3>سَمِيْعًابَصِيْرًا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>أِخْفَاءْ أَعْلٰى:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAla3').textContent;">
                        <span id="ikhfaAla3" style="display: inline-block"><h3>فَانْطَلَقُوْا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAla2').textContent;">
                        <span id="ikhfaAla2" style="display: inline-block"><h3>أَنْدَادً</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAla1').textContent;">
                        <span id="ikhfaAla1" style="display: inline-block"><h3>مِنْ تَحْتِهَا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>أِخْفَاءْ أَوْسَطْ:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath3').textContent;">
                        <span id="ikhfaAusath3" style="display: inline-block"><h3>عَزِيْزٌ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath2').textContent;">
                        <span id="ikhfaAusath2" style="display: inline-block"><h3>قَوْمًاجَبَّا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath6').textContent;">
                        <span id="ikhfaAusath6" style="display: inline-block"><h3>فَأَنْشَرْنَا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath5').textContent;">
                        <span id="ikhfaAusath5" style="display: inline-block"><h3>وَتَنْسَوْنَ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath4').textContent;">
                        <span id="ikhfaAusath4" style="display: inline-block"><h3>يَوْمَئِذٍزُرْقًا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath9').textContent;">
                        <span id="ikhfaAusath9" style="display: inline-block"><h3>ظِلًّاظَلِيْلًا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath8').textContent;">
                        <span id="ikhfaAusath8" style="display: inline-block"><h3>مَنْضُوْدٍ</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath7').textContent;">
                        <span id="ikhfaAusath7" style="display: inline-block"><h3>فَانْصُرْنَا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAusath10').textContent;">
                        <span id="ikhfaAusath10" style="display: inline-block"><h3>إِنْفِرُوْا</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h3>أِخْفَاءْ أَدْنٰى:</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAdna2').textContent;">
                        <span id="ikhfaAdna2" style="display: inline-block"><h3>فَانْقَلَبُوْا</h3></span>
                    </button>
                </div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('ikhfaAdna1').textContent;">
                        <span id="ikhfaAdna1" style="display: inline-block"><h3>مِنْكُمْ</h3></span>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <strong>:Lainnya</strong>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4">-
                    <button class="btn btn-link" onclick="
                            document.getElementById('karakter').value = document.getElementById('other1').textContent;">
                        <span id="other1" style="display: inline-block"><h3>بِسْمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ</h3></span>
                    </button>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <p class="text-muted">Achmad Fauzan | 13/356470/PPA/04429</p>
            </div>
        </footer>
    </body>
</html>
