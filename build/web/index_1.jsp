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
            button.btn{
                font-size: 40px;
                direction: rtl;
            }
            txt{
                font-size: 10px;
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
            document.getElementById("transliterasi").innerHTML = txt;
            onLoad();
            }
            function onLoad() {
            for (i = 1611; i <= 1618; i++) {
            document.getElementById(i).style.display = 'none';
            }
            document.getElementById(1648).style.display = 'none';
            for (i = 1576; i <= 1594; i++) {
            document.getElementById(i).style.display = 'inline';
            }
            for (i = 1601; i <= 1608; i++) {
            document.getElementById(i).style.display = 'inline';
            }
            document.getElementById(1610).style.display = 'inline';
            }
            function backspace(){
            document.getElementById("karakter").value.substring(0, string.length - 1);
            document.getElementById("transliterasi").innerHTML.substring(0, string.length - 1);
            }
            function textFunction(text, trans) {
            document.getElementById("karakter").value += String.fromCodePoint(text);
            document.getElementById("transliterasi").innerHTML += trans;
            switch (true) {
            case ((text >= 1611 && text <= 1616) || text === 1618 || text === 1648)://vokal
                    //vokal
                    for (i = 1611; i <= 1618; i++) {
            document.getElementById(i).style.display = 'none';
            }
            document.getElementById(1648).style.display = 'none';
            //konsonan
            for (i = 1576; i <= 1594; i++) {
            document.getElementById(i).style.display = 'inline';
            }
            for (i = 1601; i <= 1608; i++) {
            document.getElementById(i).style.display = 'inline';
            }
            document.getElementById(1610).style.display = 'inline';
            break;
            case (text >= 1576 && text <= 1610)://konsonan
                    //vokal
                    for (i = 1611; i <= 1618; i++) {
            document.getElementById(i).style.display = 'inline';
            }
            document.getElementById(1648).style.display = 'inline';
            //konsonan
            for (i = 1576; i <= 1594; i++) {
            document.getElementById(i).style.display = 'none';
            }
            for (i = 1601; i <= 1608; i++) {
            document.getElementById(i).style.display = 'none';
            }
            document.getElementById(1610).style.display = 'none';
            break;
            case (text === 1617)://tasydid
                    //vokal
                    for (i = 1611; i <= 1613; i++) {
            document.getElementById(i).style.display = 'none';
            }
            for (i = 1617; i <= 1618; i++) {
            document.getElementById(i).style.display = 'none';
            }

            //konsonan
            for (i = 1576; i <= 1594; i++) {
            document.getElementById(i).style.display = 'none';
            }
            for (i = 1601; i <= 1608; i++) {
            document.getElementById(i).style.display = 'none';
            }
            document.getElementById(1610).style.display = 'none';
            break;
            }

            }
            window.onload = clearFunction;
        </script>
    </head>
    <body>
        <div class="container" style="padding-top: 0">
            <div class="page-header">
                <img src="assets/img/ArabicTTS-small.png">
            </div>

            <div class="form-group">
                <label>Masukkan teks Arab dilengkapi dengan harakat. Klik Contoh:</label>
                <button class="btn btn-link" onclick="
                    document.getElementById('karakter').value = document.getElementById('idzhar1').textContent;">
                    <span id="idzhar1" style="display: inline-block"><h3>رَسُوْلٌ أَمِيْنٌ</h3></span>
                </button>
                <label>|</label>
                <button class="btn btn-link" onclick="
                    document.getElementById('karakter').value = document.getElementById('idghomBighunnah2').textContent;">
                    <span id="idghomBighunnah2" style="display: inline-block"><h3>وَمَنْ مَّعَهُ</h3></span>
                </button>
                <form target="_blank" name="textform" action="hasil.jsp" method="POST">
                    <div class="form-group"  id="affix-this">

                        <textarea id="karakter" readonly name="karakter" class="form-control" rows="1" autofocus required></textarea>
                        <p id="transliterasi"></p>
                    </div>
                    <div class="btn-group">
                        <input class="btn btn-warning" type="submit" onclick="myFunction()" value="PROSES">
                        <input class="btn btn-warning" type="button" onclick="clearFunction()" value="BERSIHKAN">
                    </div>

                    <p style="text-align: right">
                        <button class="btn btn-info" type="button" id="1614" onclick="textFunction(1614, 'a')">&#1614<br><div style="font-size: 12px">a</div></button>
                        <button class="btn btn-info" type="button" id="1615" onclick="textFunction(1615, 'u')">&#1615<br><div style="font-size: 12px">u</div></button>
                        <button class="btn btn-info" type="button" id="1616" onclick="textFunction(1616, 'i')">&#1616<br><div style="font-size: 12px">i</div></button>
                        <button class="btn btn-info" type="button" id="1611" onclick="textFunction(1611, 'an')">&#1611<br><div style="font-size: 12px">an</div></button>
                        <button class="btn btn-info" type="button" id="1612" onclick="textFunction(1612, 'un')">&#1612<br><div style="font-size: 12px">un</div></button>
                        <button class="btn btn-info" type="button" id="1613" onclick="textFunction(1613, 'in')">&#1613<br><div style="font-size: 12px">in</div></button>
                        <button class="btn btn-info" type="button" id="1648" onclick="textFunction(1648, 'aa')">&#1648<br><div style="font-size: 12px">aa</div></button>
                        <button class="btn btn-info" type="button" id="1618" onclick="textFunction(1618, '')">&#1618<br><div style="font-size: 12px">-</div></button>
                        <button class="btn btn-info" type="button" id="1617" onclick="textFunction(1617, (document.getElementById('transliterasi').innerHTML).slice( - 1))">&#1617<br><div style="font-size: 12px">&#178</div></button>
                    </p>
                    <p style="text-align: right">

                        <button class="btn btn-info" type="button" id="1576" onclick="textFunction(1576, 'b')">&#1576<br><div style="font-size: 12px">b</div></button>
                        <button class="btn btn-info" type="button" id="1577" onclick="textFunction(1577, 't')">&#1577<br><div style="font-size: 12px">t/h</div></button>
                        <button class="btn btn-info" type="button" id="1578" onclick="textFunction(1578, 't')">&#1578<br><div style="font-size: 12px">t</div></button>
                        <button class="btn btn-info" type="button" id="1579" onclick="textFunction(1579, 'ts')">&#1579<br><div style="font-size: 12px">ts</div></button>
                        <button class="btn btn-info" type="button" id="1580" onclick="textFunction(1580, 'j')">&#1580<br><div style="font-size: 12px">j</div></button>
                        <button class="btn btn-info" type="button" id="1581" onclick="textFunction(1581, 'kh')">&#1581<br><div style="font-size: 12px">kh</div></button>
                        <button class="btn btn-info" type="button" id="1582" onclick="textFunction(1582, 'ch')">&#1582<br><div style="font-size: 12px">ch</div></button>
                        <button class="btn btn-info" type="button" id="1583" onclick="textFunction(1583, 'd')">&#1583<br><div style="font-size: 12px">d</div></button>
                        <button class="btn btn-info" type="button" id="1584" onclick="textFunction(1584, 'dz')">&#1584<br><div style="font-size: 12px">dz</div></button>
                        <button class="btn btn-info" type="button" id="1585" onclick="textFunction(1585, 'r')">&#1585<br><div style="font-size: 12px">r</div></button>
                        <button class="btn btn-info" type="button" id="1586" onclick="textFunction(1586, 'z')">&#1586<br><div style="font-size: 12px">z</div></button>
                        <button class="btn btn-info" type="button" id="1587" onclick="textFunction(1587, 's')">&#1587<br><div style="font-size: 12px">s</div></button>
                        <button class="btn btn-info" type="button" id="1588" onclick="textFunction(1588, 'sy')">&#1588<br><div style="font-size: 12px">sy</div></button>
                        <button class="btn btn-info" type="button" id="1589" onclick="textFunction(1589, 'sh')">&#1589<br><div style="font-size: 12px">sh</div></button>
                        <button class="btn btn-info" type="button" id="1590" onclick="textFunction(1590, 'dh')">&#1590<br><div style="font-size: 12px">dh</div></button>
                        <button class="btn btn-info" type="button" id="1591" onclick="textFunction(1591, 'th')">&#1591<br><div style="font-size: 12px">th</div></button>
                        <button class="btn btn-info" type="button" id="1592" onclick="textFunction(1592, 'dl')">&#1592<br><div style="font-size: 12px">dl</div></button>
                        <button class="btn btn-info" type="button" id="1593" onclick="textFunction(1593, & #96)">&#1593<br><div style="font-size: 12px">&#96</div></button>
                        <button class="btn btn-info" type="button" id="1594" onclick="textFunction(1594, 'gh')">&#1594<br><div style="font-size: 12px">gh</div></button>
                        <button class="btn btn-info" type="button" id="1601" onclick="textFunction(1601, 'f')">&#1601<br><div style="font-size: 12px">f</div></button>
                        <button class="btn btn-info" type="button" id="1602" onclick="textFunction(1602, 'q')">&#1602<br><div style="font-size: 12px">q</div></button>
                        <button class="btn btn-info" type="button" id="1603" onclick="textFunction(1603, 'k')">&#1603<br><div style="font-size: 12px">k</div></button>
                        <button class="btn btn-info" type="button" id="1604" onclick="textFunction(1604, 'l')">&#1604<br><div style="font-size: 12px">l</div></button>
                        <button class="btn btn-info" type="button" id="1605" onclick="textFunction(1605, 'm')">&#1605<br><div style="font-size: 12px">m</div></button>
                        <button class="btn btn-info" type="button" id="1606" onclick="textFunction(1606, 'n')">&#1606<br><div style="font-size: 12px">n</div></button>
                        <button class="btn btn-info" type="button" id="1607" onclick="textFunction(1607, 'h')">&#1607<br><div style="font-size: 12px">h</div></button>
                        <button class="btn btn-info" type="button" id="1608" onclick="textFunction(1608, 'w')">&#1608<br><div style="font-size: 12px">w</div></button>
                        <button class="btn btn-info" type="button" id="1610" onclick="textFunction(1610, 'y')">&#1610<br><div style="font-size: 12px">y</div></button>
                    </p>
                    <p style="text-align: right">
                        <button class="btn btn-info" type="button" id="1575" onclick="textFunction(1575, (document.getElementById('transliterasi').innerHTML).slice( - 1))">&#1575<br><div style="font-size: 12px">~</div></button>
                        <button class="btn btn-info" type="button" id="1609" onclick="textFunction(1609, (document.getElementById('transliterasi').innerHTML).slice( - 1))">&#1609<br><div style="font-size: 12px">~</div></button>
                    </p>
                    <p style="text-align: right">
                        <button class="btn btn-info" type="button" id="32" onclick="textFunction(32, ' ')">_<br><div style="font-size: 12px">spasi</div></button>
                    </p>
                    <p style="text-align: right">
                        <button class="btn btn-info" type="button" id="1633" onclick="textFunction(1633, & #1633)">&#1633<br><div style="font-size: 12px">satu</div></button>
                        <button class="btn btn-info" type="button" id="1634" onclick="textFunction(1634, & #1634)">&#1634<br><div style="font-size: 12px">dua</div></button>
                        <button class="btn btn-info" type="button" id="1635" onclick="textFunction(1635, & #1635)">&#1635<br><div style="font-size: 12px">tiga</div></button>
                        <button class="btn btn-info" type="button" id="1636" onclick="textFunction(1636, & #1636)">&#1636<br><div style="font-size: 12px">empat</div></button>
                        <button class="btn btn-info" type="button" id="1637" onclick="textFunction(1637, & #1637)">&#1637<br><div style="font-size: 12px">lima</div></button>
                        <button class="btn btn-info" type="button" id="1638" onclick="textFunction(1638, & #1638)">&#1638<br><div style="font-size: 12px">enam</div></button>
                        <button class="btn btn-info" type="button" id="1639" onclick="textFunction(1639, & #1639)">&#1639<br><div style="font-size: 12px">tujuh</div></button>
                        <button class="btn btn-info" type="button" id="1640" onclick="textFunction(1640, & #1640)">&#1640<br><div style="font-size: 12px">delapan</div></button>
                        <button class="btn btn-info" type="button" id="1641" onclick="textFunction(1641, & #1641)">&#1641<br><div style="font-size: 12px">sembilan</div></button>
                    </p>
                    <input type="hidden" id="sendCharacter" name="sendCharacter">
                </form>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="text-muted">Achmad Fauzan | 13/356470/PPA/04429</p>
            </div>
        </footer>
    </body>
</html>
