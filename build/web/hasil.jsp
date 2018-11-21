<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
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
        <link rel="stylesheet" type="text/css" href="assets/css/rating.css">

        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.11.3.js"></script>
        <style type="text/css">

            p.title{
                font-family: adobe arabic;

            }

        </style>
        <script type="text/javascript">
            var filenameAudio;

            function playAudio() {
                var audio = new Audio(filenameAudio);
                audio.play();
            }
            function myFunction() {

                $.get("http://ipinfo.io", function (response) {
                    document.getElementById("ip").value = response.ip;
                    document.getElementById("ipinfo").innerHTML = response.ip;
                }, "jsonp");
                document.getElementById("text").value = document.getElementById("DBMate").textContent;

                var txt = [], str = document.getElementById("ArabicText").textContent;
                var len = str.length, txtUnicode = '';
                filenameAudio = 'assets/audio/' + document.getElementById("srcAudio").textContent;
                $('#hitung').text(len);

                for (i = 0; i < len; i++) {
                    txt[i] = [];
                    txt[i][0] = str.charAt(i);
                    txt[i][1] = '&amp#' + str.charCodeAt(i);

                    txtUnicode += ' &amp#' + str.charCodeAt(i);
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
                document.getElementById("ascii").innerHTML = txtUnicode;




            }
            window.onload = myFunction;
        </script>
    </head> 

    <body data-spy="scroll">
        <jsp:useBean id="arabictext" class="beans.arabictext">
            <jsp:setProperty name="arabictext" property="sendCharacter" value="${param.sendCharacter}" />
        </jsp:useBean>
        <div hidden><jsp:getProperty name="arabictext" property="sendCharacter" /></div>
        <!-- ******HEADER****** --> 
        <header id="header" class="header">  
            <div class="container">
                <h1 class="logo pull-left">
                    <a href="./">
                        <img class="img-responsive" src="assets/images/ArabicTTS-small.png" alt="" width="50%" height="50%" />
                    </a>
                </h1><!--//logo-->              
                <nav id="main-nav" class="main-nav navbar-right" role="navigation">
                    <div class="navbar-header">
                        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button><!--//nav-toggle-->
                    </div><!--//navbar-header-->   
                    <div class="navbar-collapse collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="nav-item"><a class="scrollto" href="#promo">Home</a></li>
                            <li class="nav-item"><a class="scrollto" href="#about">Data</a></li>
                            <li class="nav-item"><a class="scrollto" href="#features">Normalisasi</a></li>
                            <li class="nav-item"><a class="scrollto" href="#docs">Teks ke Fonem</a></li>
                            <li class="nav-item"><a class="scrollto" href="#license">Fonem ke Suara</a></li>
                            <li class="nav-item last"><a class="scrollto" href="#contact">Tentang</a></li>
                        </ul><!--//nav-->
                    </div><!--//navabr-collapse-->
                </nav><!--//main-nav-->
            </div>
        </header><!--//header-->

        <!-- ******PROMO****** -->
        <section id="promo" class="promo section offset-header">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 text-center">
                        <p>
                            <mark style="background-color : #EEBF3D;">Idzhar</mark>
                            <mark style="background-color : #3e2a96;">Idgham Bilaaghunnah</mark>
                            <mark style="background-color : #005b96;">Idgham Bighunnah</mark>
                            <mark style="background-color : #fe2e2e;">Iqlab</mark>
                            <mark style="background-color : #a180bc;">Ikhfa' A'la/Aqrab</mark>
                            <mark style="background-color : #d4ffbb;">Ikhfa' Ausath</mark>
                            <mark style="background-color : #ffc3a0;">Ikhfa' Adnaa/Ab'ad</mark>
                        </p>
                        <p class="title"><jsp:getProperty name="arabictext" property="textNormalizedMarked" /></p>
                        <p>"<jsp:getProperty name="arabictext" property="transliterasi1" />"</p>

                        <div class="btns">
                            <a class="btn btn-cta-secondary" onclick="playAudio()">Mainkan</a>
                            <a class="btn btn-cta-primary" href="javascript:window.open(filenameAudio)" >Unduh</a>
                        </div>


                    </div>
                    <div class="col-sm-6">
                        <form action="save.jsp" method="POST" class="form-horizontal">
                            <div class="text-center"><label>BERI PENILAIAN</label></div>
                            <p>ip anda: <label id="ipinfo"></label> </p>
                            <input type="hidden" id="ip" name="ip">
                            <input type="hidden" id="text" name="text" class="form-control">
                            <p>Keterangan nilai <br>1:Amat Tidak Baik, 2:Tidak Baik, 3: Sedang, 4: Baik, 5: Amat Baik</p>
                            <ol type="1">
                                <li>
                                    Apakah identifikasi hukum bacaan sudah tepat?<br>
                                    <input type="radio" id="q11" name="q1" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star">1</label>
                                    <input type="radio" id="q12" name="q1" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars">2</label>
                                    <input type="radio" id="q13" name="q1" value="3" /><label class = "full" for="star3" title="Meh - 3 stars">3</label>
                                    <input type="radio" id="q14" name="q1" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars">4</label>
                                    <input type="radio" id="q15" name="q1" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars">5</label>
                                </li>
                                <li>
                                    Apakah suara mudah didapatkan?<br>
                                    <input type="radio" id="q21" name="q2" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star">1</label>
                                    <input type="radio" id="q22" name="q2" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars">2</label>
                                    <input type="radio" id="q23" name="q2" value="3" /><label class = "full" for="star3" title="Meh - 3 stars">3</label>
                                    <input type="radio" id="q24" name="q2" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars">4</label>
                                    <input type="radio" id="q25" name="q2" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars">5</label>
                                </li>
                                <li>
                                    Apakah suara yang dihasilkan dapat didengar jelas?<br>
                                    <input type="radio" id="q31" name="q3" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star">1</label>
                                    <input type="radio" id="q32" name="q3" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars">2</label>
                                    <input type="radio" id="q33" name="q3" value="3" /><label class = "full" for="star3" title="Meh - 3 stars">3</label>
                                    <input type="radio" id="q34" name="q3" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars">4</label>
                                    <input type="radio" id="q35" name="q3" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars">5</label>
                                </li>
                                <li>
                                    Apakah suara terdengar seperti suara manusia pada umumnya?<br>
                                    <input type="radio" id="q41" name="q4" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star">1</label>
                                    <input type="radio" id="q42" name="q4" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars">2</label>
                                    <input type="radio" id="q43" name="q4" value="3" /><label class = "full" for="star3" title="Meh - 3 stars">3</label>
                                    <input type="radio" id="q44" name="q4" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars">4</label>
                                    <input type="radio" id="q45" name="q4" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars">5</label>
                                </li>
                                <li>
                                    Bagaimana penilaian Anda secara umum terhadap aplikasi ini?<br>
                                    <input type="radio" id="q51" name="q5" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star">1</label>
                                    <input type="radio" id="q52" name="q5" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars">2</label>
                                    <input type="radio" id="q53" name="q5" value="3" /><label class = "full" for="star3" title="Meh - 3 stars">3</label>
                                    <input type="radio" id="q54" name="q5" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars">4</label>
                                    <input type="radio" id="q55" name="q5" value="5" checked/><label class = "full" for="star5" title="Awesome - 5 stars">5</label>
                                </li>
                            </ol>
                            <div id="q6">
                                <label for="comment">Kolom komentar dan saran:</label>
                                <textarea id="comment" name="comment" style="color: black" rows="4" cols="50" class="form-control"></textarea>
                                <br>
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            </div><br>
                            
                        </form>
                    </div>
                </div>
                <hr>
                <ul class="meta list-inline">
                    <li><a href="#" target="_blank"></a></li>
                    <li><a href="#" target="_blank"></a></li>
                    <li></li>
                </ul><!--//meta-->
            </div><!--//container-->
            <div class="social-media">
                <div class="social-media-inner container text-center">
                    <ul class="list-inline">
                        <li class="twitter-follow">
                        </li><!--//twitter-follow-->
                        <li class="twitter-tweet">
                        </li><!--//twitter-tweet-->
                        <li class="facebook-like">
                        </li><!--//facebook-like-->
                        <!--// Generate github buttons: https://github.com/mdo/github-buttons -->
                        <!--//
                        <li class="github-follow"><iframe src="http://ghbtns.com/github-btn.html?user=mdo&type=follow&count=true"
      allowtransparency="true" frameborder="0" scrolling="0" width="165" height="20"></iframe></li>
                        -->
                    </ul>
                </div>
            </div>
        </section><!--//promo-->

        <!-- ******ABOUT****** --> 
        <section id="about" class="docs section">
            <div class="container">
                <div class="docs-inner">
                    <h2 class="title text-center">Data teks masukan</h2>
                    <div class="info">
                        <p>Teks sebagai input sistem berupa sebuah kalimat dalam bahasa Arab. 
                            Huruf Arab yang digunakan sebagai input adalah huruf Arab baku yang memiliki tanda baca atau berharakat.</p>
                    </div><!--//info-->
                    <ol>
                        <li>
                            Teks masukan: <span id="ArabicText"><h3><jsp:getProperty name="arabictext" property="sendCharacter" /></h3></span><br>
                        </li>
                        <li>
                            Banyaknya karakter: <span id="hitung">-</span><br>
                            Banyaknya karakter dihitung secara keseluruhan, termasuk karakter spasi.
                        </li>
                        <li>
                            Daftar karakter.<br>
                            <p>Daftar karakter yang dimasukkan oleh pengguna disajikan dalam tabel berikut.</p>
                            <span id="char">-</span>
                        </li>
                        <li>
                            Rangkaian kode unicode teks masukan:<br>
                            <p><span id="ascii">-</span>.</p>
                        </li>
                    </ol>


                </div><!--//row-->     
            </div>
        </div><!--//container-->
    </section><!--//about-->

    <!-- ******FEATURES****** --> 
    <section id="features" class="docs section">
        <div class="container">
            <div class="docs-inner">
                <h2 class="title text-center">Normalisasi</h2>
                <div class="info">
                    <p>Proses normalisasi teks diawali dengan menghilangkan karakter yang tidak termasuk dalam daftar 
                        karakter yang diizinkan oleh sistem (karakter ilegal). Dilanjutkan dengan mengubah karakter angka 
                        menjadi penulisan ejaannya.</p>
                </div><!--//info-->
                <ol>
                    <li>
                        Teks masukan:<br>
                        <h3><jsp:getProperty name="arabictext" property="sendCharacter" /></h3>
                    </li>
                    <li>
                        Identifikasi karakter ilegal dan karakter angka<br>
                        Teks masukan (input) dimungkinkan memiliki karakter-karakter selain yang dapat diterima oleh sistem akibat kesalahan input. 
                        Karakter yang diizinkan yaitu karakter-karakter yang termasuk dalam daftar fonem bahasa Arab, 
                        tanda baca, dan karakter angka. Karakter yang dimasukkan oleh pengguna akan dibandingkan 
                        dengan daftar karakter yang diizinkan tersebut. Apabila terdapat karakter yang tidak sesuai 
                        maka karakter tersebut akan dihilangkan.
                        Khusus karakter angka, akan dilakukan konversi menjadi bentuk tulisan (rangkaian huruf) 
                        sebagai bentuk penulisan ejaannya. Modul akan mencari dan mengganti karakter angka 
                        menjadi bentuk teks penulisan ejaannya.<br>

                        <p><jsp:getProperty name="arabictext" property="textProsesNormalisasi" /></p>

                        - Daftar karakter yang diterima sistem <a href="listAll.jsp" target="_blank">link</a>.<br>
                        - Daftar konversi angka arab ke dalam bentuk penulisan teks ucapannya <a href="listNum.jsp" target="_blank">link</a><br>
                    </li>
                    <li>
                        Teks hasil proses normalisasi:<br>
                        <h3 id="textNormalized"><jsp:getProperty name="arabictext" property="normalized" /></h3>
                    </li>
                </ol>
            </div>
        </div><!--//container-->
    </section><!--//features-->

    <!-- ******DOCS****** --> 
    <section id="docs" class="docs section">
        <div class="container">
            <div class="docs-inner">
                <h2 class="title text-center">Teks ke Fonem</h2>
                <div class="info">
                    <p>Tahapan ini bertujuan untuk mendapatkan ketentuan pengucapan dasar dari setiap kata teks yang telah dinormalisasi
                        menggunakan pendekatan menurut aturan (rule-based approach), 
                        yaitu menggunakan aturan yang telah ditentukan untuk pengucapan kata berdasarkan ejaannya.</p>
                    <p>Pada sistem text to speech untuk bahasa Arab ini, aturan-aturan yang digunakan didasarkan 
                        pada aturan/cara membaca tulisan berbahasa Arab (tajwid) dilanjutkan dengan aturan pengucapan tanda baca/harakat.</p>
                </div><!--//info-->
                <ol>
                    <li>
                        Aturan pengucapan bila terdapat nun mati dan tanwin<br>
                        Bila terdapat tajwid nun mati atau tanwin, akan ditampilkan dalam format berikut: Awal-Akhir-Jenis tajwid<br>
                        (<jsp:getProperty name="arabictext" property="textFSANunMatiTanwin" />)
                        <h3><jsp:getProperty name="arabictext" property="nunMatiTanwin" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan vokal rangkap (diftong)<br>
                        Vokal rangkap ada dua kondisi yaitu bila fathah diikuti ya mati maka dibaca /a//i/,
                        dan bila fathah diikuti wau mati maka dibaca /a//u/.
                        <h3><jsp:getProperty name="arabictext" property="diftong" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan bacaan panjang (mad)<br>
                        Bacaan panjang yang diterapkan yaitu mad thabi'i. Aturan pengucapannya yaitu bila ditemukan fathah diikuti alif,
                        kasroh diikuti ya mati, dan dhomah diikuti wau mati.
                        <h3><jsp:getProperty name="arabictext" property="mad" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan tasydid<br>
                        Tasydid dilambangkan dengan sebuah tanda (&#1617). Harakat tasydid melambangkan 
                        penekanan pada suatu konsonan dan dibaca sebagai konsonan ganda 
                        dimana konsonan pertama dibaca dengan harakat sukun (mati) dan kedua dibaca harakat aslinya.
                        <h3><jsp:getProperty name="arabictext" property="textTasydid" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan tanwin<br>
                        Tanwin diucapkan layaknya bertemu dengan huruf nun mati. Fathah tain dibaca fathah diikuti nun mati, 
                        dhomah tain dibaca dhomah diikuti nun mati, dan kasroh tain dibaca kasroh diikuti nun mati.
                        <h3><jsp:getProperty name="arabictext" property="tanwin" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan ta marbutah<br>
                        Huruf ta marbutah akan dibaca ta apahila diikuti dengan vokal, dan akan dibaca ha apabila diikuti dengan sukun.
                        <h3><jsp:getProperty name="arabictext" property="taMarbutah" /></h3>
                    </li>
                    <li>
                        Aturan pengucapan sukun<br>
                        Sukun melambangkan fonem konsonan atau huruf mati dari suatu huruf.
                        Apabila ditemukan karakter sukun maka penerapan aturan pengucapannya cukup dengan menghilangkan sukun tersebut.
                        <h3><jsp:getProperty name="arabictext" property="textSukun" /></h3>
                    </li>
                    <li>
                        Rangkaian Fonem<br>
                        Hasil pemrosesan Text to Phoneme berupa rangkaian fonem sebagai berikut.
                        <ul>
                            <li>
                                Ditulis dalam karakter Arab.
                                <h3 dir="rtl"><jsp:getProperty name="arabictext" property="textHasilTTP" /></h3>
                            </li>
                            <li>
                                Ditulis dalam kode desimal unicode.
                                <p><jsp:getProperty name="arabictext" property="textHasilTTPunicode" /></p>
                            </li>
                        </ul>
                    </li>
                </ol>
            </div>
        </div><!--//container-->
    </section><!--//features-->

    <!-- ******LICENSE****** --> 
    <section id="license" class="license section">
        <div class="container">
            <div class="license-inner">
                <h2 class="title text-center">Fonem ke Suara Ucapan</h2>
                <div class="info">
                    <p>Proses mengubah rangkain fonem menjadi ucapan utuh dilakukan dalam beberapa tahap, yaitu:.</p>
                </div><!--//info-->
                <ol>
                    <li>
                        Menyusun fonem-fonem ke dalam bentuk pasangan fonem (dua fonem/diphone).
                        <p><jsp:getProperty name="arabictext" property="textSequencer" /></p>
                    </li>
                    <li>
                        Memanggil data audio (segmen suara) dari basis data suara diphone.
                        Buka database diphone <a href="diphone-db.jsp" target="_blank">link</a>.
                        <p id="DBMate"><jsp:getProperty name="arabictext" property="textDBMate" /></p>
                    </li>
                    <li>
                        Menyambung segmen-segmen suara diphone menjadi sebuah file suara.
                        <span id="srcAudio"><p><a onclick="playAudio()"><jsp:getProperty name="arabictext" property="textAudio" />.wav</a></p></span>
                    </li>
                </ol>
            </div><!--//license-inner-->
        </div><!--//container-->
    </section><!--//how-->

    <!-- ******CONTACT****** --> 
    <section id="contact" class="contact section has-pattern">
        <div class="container">
            <div class="contact-inner">
                <h2 class="title  text-center">Arabic Text To Speech</h2>
                <p class="intro  text-center">Aplikasi pengubah teks menjadi suara untuk tulisan bahasa Arab ini
                    dibuat dan dikembangkan sebagai bagian dari proyek penelitian tesis strata-2.</p>
                <div class="author-message">                      
                    <div class="profile">
                        <img class="img-responsive" src="assets/images/profile.jpg" alt="" />
                    </div><!--//profile-->
                    <div class="speech-bubble">
                        <h3 class="sub-title">Sekilas tentang pembuat program.</h3>
                        <p>Nama:Achmad Fauzan <br>
                            NIM:13/356470/PPA/04429<br>
                            <a href="https://ugm.ac.id" target="_blank">Universitas Gadjah Mada</a> 
                        <p>Bla bla bla</p>
                        <p></p> 
                        <div class="source">
                            <span class="name"><a href="https://twitter.com/3rdwave_themes" target="_blank">Achmad Fauzan</a></span>
                            <br />
                            <span class="title">13/356470/PPA/04429</span>
                        </div><!--//source-->
                    </div><!--//speech-bubble-->                        
                </div><!--//author-message-->
                <div class="clearfix"></div>
                <div class="info text-center">
                    <h4 class="sub-title">Get Connected</h4>
                    <ul class="social-icons list-inline">
                        <li><a href="https://twitter.com/3rdwave_themes" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com/3rdwavethemes" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/xiaoying"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="http://instagram.com/xyriley"><i class="fa fa-instagram"></i></a></li>  
                        <li><a href="https://dribbble.com/Xiaoying"><i class="fa fa-dribbble"></i></a></li>   
                        <li class="last"><a href="mailto: hello@3rdwavemedia.com"><i class="fa fa-envelope"></i></a></li>              
                    </ul>
                </div><!--//info-->
            </div><!--//contact-inner-->
        </div><!--//container-->
    </section><!--//contact-->  

    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
            <small class="copyright">Desain antar muka oleh <a href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a>.</small>
        </div><!--//container-->
    </footer><!--//footer-->

    <!-- Javascript -->          
    <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
    <script type="text/javascript" src="assets/plugins/jquery.easing.1.3.js"></script>   
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>     
    <script type="text/javascript" src="assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script> 
    <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>    
    <script type="text/javascript" src="assets/js/main.js"></script>       
</body>
</html> 

