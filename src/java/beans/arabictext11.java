/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.SequenceInputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFileFormat.Type;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

/**
 *
 * @author Papah
 */
public class arabictext11 {

    //Daftar karakter yang diijinkan
    final String[][] consonant = {
        {"ء			", "0621", "1569", ""}, {"أ", "0623", "1571", ""}, {"إ", "0625", "1573", ""},
        {"ئ", "0626", "1574", ""},
        {"ب			", "0628", "1576", "b"}, {"ة", "0629", "1577", ""},
        {"ت			", "062A", "1578", "t"}, {"ث", "062B", "1579", "ts"}, {"ج			", "062C", "1580", "j"},
        {"ح			", "062D", "1581", "kh"}, {"خ			", "062E", "1582", "kh"}, {"د			", "062F", "1583", "d"},
        {"ذ			", "0630", "1584", "dz"}, {"ر			", "0631", "1585", "r"}, {"ز			", "0632", "1586", "z"},
        {"س			", "0633", "1587", "s"}, {"ش			", "0634", "1588", "sy"}, {"ص			", "0635", "1589", "sh"},
        {"ض			", "0636", "1590", "dh"}, {"ط			", "0637", "1591", "th"}, {"ظ			", "0638", "1592", "dl"},
        {"ع			", "0639", "1593", "'"}, {"غ			", "063A", "1594", "gh"},
        {"ف			", "0641", "1601", "f"}, {"ق			", "0642", "1602", "q"}, {"ك			", "0643", "1603", "k"},
        {"ل			", "0644", "1604", "l"}, {"م			", "0645", "1605", "m"}, {"ن			", "0646", "1606", "n"},
        {"ه			", "0647", "1607", "h"}, {"و			", "0648", "1608", "w"},
        {"ي			", "064A", "1610", "y"}
    };
    final String[][] vocal = {
        {"Fathah", "064E", "1614", "a"}, {"Dlomah", "064F", "1615", "u"}, {"Kasroh", "0650", "1616", "i"}
    };
    final String[][] tain = {
        {"fathahtain", "064B", "1611", ""}, {"dlommahtain", "064C", "1612", ""}, {"kasrohtain", "064D", "1613", ""}
    };
    final String[][] other = {
        {"spasi", "0020", "32", " "}, {"tasydid", "0651", "1617", ""}, {"sukun", "0652", "1618", ""},
        {"ا			", "0627", "1575", ""}, {"ى", "0649", "1609", ""}, {"alifkhanjariyyah", "0670", "1648", ""}
    };
    final String[][] number = {
        {"1", "0661", "1633", "&#1608&#1614&#1575&#1581&#1616&#1583&#1612"},
        {"2", "0662", "1634", "&#1575&#1616&#1579&#1618&#1606&#1614&#1575&#1606&#1616"},
        {"3", "0663", "1635", "&#1579&#1614&#1604&#1614&#1575&#1579&#1614&#1577&#1612"},
        {"4", "0664", "1636", "&#1571&#1614&#1585&#1618&#1576&#1614&#1593&#1614&#1577&#1612"},
        {"5", "0665", "1637", "&#1582&#1614&#1605&#1618&#1587&#1614&#1577&#1612"},
        {"6", "0666", "1638", "&#1587&#1616&#1578&#1614&#1577&#1612"},
        {"7", "0667", "1639", "&#1587&#1614&#1576&#1618&#1593&#1614&#1577&#1612"},
        {"8", "0668", "1640", "&#1579&#1614&#1605&#1614&#1575&#1606&#1616&#1610&#1614&#1577&#1612"},
        {"9", "0669", "1641", "&#1578&#1616&#1587&#1618&#1593&#1614&#1577&#1612"}
    };

    private String sendCharacter = new String();//menyimpan karakter yang dimasukkan user
    private String normalized = new String();//hasil akhir proses normalisasi
    private String textTasydid = new String();//hasil rule tasydid
    private String textSukun = new String();//hasil rule sukun
    private String textHasilTTP = new String();//hasil akhir proses Text To Phoneme berupa rangkaian fonem
    private String textHasilTTPunicode = new String();//hasil akhir rangkaian fonem TTP ditulis dalam kode unicode
    private String textSequencer = new String();//*Keterangan ditampilkan sebagai rangkaian pasangan fonem (diphone)
    private String textDBMate = new String();//*Keterangan ditampilkan sebagai rangkaian segmen-segmen suara diphone yang dipanggil
    private String textAudio = new String();//nama file suara hasil TTS (hasil akhir)
    private String textAll = new String();//*Keterangan ditampilkan sebagai tabel html daftar karakter yang diterima sistem
    private String textNum = new String();//*Keterangan ditampilkan sebagai tabel html daftar konversi angka arab ke teks pengucapannya
    private String textProsesNormalisasi = new String();//*Keterangan ditampilkan sebagai tabel html proses normalisasi
    private String nunMatiTanwin = new String();//hasil rule nun mati / tanwin
    private String textFSANunMatiTanwin = new String();//*Keterangan identifikasi tajwid nun mati / tanwin menggunakan Finite State Automata
    private String textNormalizedMarked = new String();//*Keterangan teks arab bertanda tajwid berupa warna ditampilkan pada hal hasil paling atas
    private String diftong = new String();//hasil rule vokal rangkap / diftong
    private String mad = new String();//hasil rule mad / bacaan panjang
    private String tanwin = new String();//hasil rule tanwin
    private String taMarbutah = new String();//hasil rule ta marbutah
    private String transliterasi1 = new String();
    private final String src_ = "D:\\audiodata-mono\\";
    private final String des_ = "C:\\Users\\mr-fao\\Documents\\NetBeansProjects\\ArabicTTS\\web\\assets\\audio\\";
    //private final String des_ = "C:\\xampp\\tomcat\\webapps\\ROOT\\assets\\audio\\";

    public String getsendCharacter() {
        //mengirimkan nilai pada variabel "sendCharacter" ke modul normalisasi
        normalization a = new normalization();
        normalized = a.checkChar(sendCharacter, consonant, vocal, tain, other, number);
        textProsesNormalisasi = a.textProsesNormalisasi(sendCharacter, consonant, vocal, tain, other, number);
        String norm_allah = a.allah(normalized);
        //text ditambahi spasi depan belakang
        String text = "&#32" + norm_allah + "&#32";

        //Text to phoneme, menggunakan pendekatan berbasis aturan (yaitu aturan membaca huruf Arab)
        rule b = new rule();

        ///tajwid
        textFSANunMatiTanwin = b.textFSANunMatiTanwin(normalized);//Identifikasi tajwid
        textNormalizedMarked = b.textNormalizedMarked(normalized, textFSANunMatiTanwin);//Keterangan tanda tajwid

        nunMatiTanwin = b.NunMatiTanwin(text, textFSANunMatiTanwin);//Penerapan aturan tajwid nun-sukun/tanwin

        ///vokal rangkap
        diftong = b.diftong(nunMatiTanwin);

        ///mad
        mad = b.mad(diftong);

        ///tasydid
        textTasydid = b.tanwin(mad);

        ///tanwin
        tanwin = b.tasydid(textTasydid);

        ///ta marbutah
        taMarbutah = b.taMarbutah(tanwin);

        ///sukun
        textSukun = b.sukun(taMarbutah);

        //set variabel untuk ditampilkan pada html
        textHasilTTP = b.hasilTTP(textSukun);
        textHasilTTPunicode = b.hasilTTPunicode(textSukun);

        //Modul sequencer, membagi kode unicode menjadi berpasang-pasangan
        sequencer c = new sequencer();
        String[] data;
        data = c.mate(textSukun);
        //Set variabel untuk ditampilkan pada html
        textSequencer = c.listmate(textSukun);
        textDBMate = c.dbmate(data);

        //Membuat  transliterasi 
        transliterasi1 = a.translate1(textSukun, consonant, vocal, tain, other, number);

        //Modul Concatenation
        List<String> strlist = new ArrayList<>();
        for (String data1 : data) {
            strlist.add(src_ + data1 + ".wav");
        }

        //untuk release, digunakan nama file dari rangkaian unicode-nya
        Calendar calendar = Calendar.getInstance();
        Timestamp currentTimestamp = new java.sql.Timestamp(calendar.getTime().getTime());
        MD5 md5 = new MD5();
        textAudio = md5.create("" + currentTimestamp);

        String destination = des_ + textAudio + ".wav";
        arabictext11 concat = new arabictext11();
        try {
            concat.concatenateFiles(strlist, destination);
        } catch (Exception ex) {
            Logger.getLogger(arabictext11.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sendCharacter;
    }

    private static final boolean DEBUG = false;

    /**
     * The size of the temporary read buffer, in frames.
     */
    private static final int BUFFER_LENGTH = 1024;

    public Boolean concatenateFiles(List<String> sourceFilesList, String destinationFileName) throws Exception {
        Boolean result = false;

        AudioInputStream ais = null;
        List<AudioInputStream> audioInputStreamList = null;
        AudioFormat audioFormat = null;
        //Long frameLength = null;
        byte[] buffer = null;
        byte[] bufferTemp1 = null;
        byte[] bufferTemp2 = null;

        arabictext11 ab = new arabictext11();
        
        try {
            // loop through our files first and load them up
            for (String sourceFile : sourceFilesList) {
                ais = AudioSystem.getAudioInputStream(new File(sourceFile));
                ByteArrayOutputStream baos = new ByteArrayOutputStream();

                // get the format of first file
                if (audioFormat == null) {
                    audioFormat = ais.getFormat();
                }
                
                if (bufferTemp1 == null) {
                    bufferTemp1 = new byte[ais.available()];
                    while (true) {
//                        if (DEBUG) {
//                            System.out.println("trying to read (bytes): " + bufferTemp1.length);
//                        }
                        int nBytesRead = ais.read(bufferTemp1);
                        if (DEBUG) {
                            System.out.println("read (bytes): " + nBytesRead);
                        }
                        if (nBytesRead == -1) {
                            break;
                        }
                        baos.write(bufferTemp1, 0, nBytesRead);
                    }
                    bufferTemp1 = baos.toByteArray();
                    bufferTemp1 = ab.hanningWindow(bufferTemp1);
                } else {
                    if (buffer == null) {
                        buffer = new byte[bufferTemp1.length + ais.available()];

                        int i = 0;
                        for (int j = 0; j < bufferTemp1.length; j++) {
                            buffer[i] = bufferTemp1[j];
                            i++;
                        }
                        
                        while (true) {
//                        if (DEBUG) {
//                            System.out.println("trying to read (bytes): " + bufferTemp1.length);
//                        }
                            
                            int nBytesRead = ais.read(bufferTemp1);
                            if (DEBUG) {
                                System.out.println("read (bytes): " + nBytesRead);
                            }
                            if (nBytesRead == -1) {
                                break;
                            }
                            baos.write(bufferTemp1, 0, nBytesRead);
                        }
                        bufferTemp1 = baos.toByteArray();
                        bufferTemp1 = ab.hanningWindow(bufferTemp1);
                        for (int j = 0; j < bufferTemp1.length; j++) {
                            buffer[i] = bufferTemp1[j];
                            i++;
                        }
                    } else {
                        bufferTemp2 = new byte[buffer.length];
                        System.arraycopy(buffer, 0, bufferTemp2, 0, buffer.length);
                        buffer = new byte[bufferTemp2.length + ais.available()];

                        int i = 0;
                        for (int j = 0; j < bufferTemp2.length; j++) {
                            buffer[i] = bufferTemp2[j];
                            i++;
                        }
                        
                        while (true) {
//                        if (DEBUG) {
//                            System.out.println("trying to read (bytes): " + bufferTemp1.length);
//                        }
                            
                            int nBytesRead = ais.read(bufferTemp1);
                            if (DEBUG) {
                                System.out.println("read (bytes): " + nBytesRead);
                            }
                            if (nBytesRead == -1) {
                                break;
                            }
                            baos.write(bufferTemp1, 0, nBytesRead);
                        }
                        bufferTemp1 = baos.toByteArray();
                        bufferTemp1 = ab.hanningWindow(bufferTemp1);
                        for (int j = 0; j < bufferTemp1.length; j++) {
                            buffer[i] = bufferTemp1[j];
                            i++;
                        }
                    }

                }

                // add it to our stream list
//                if (audioInputStreamList == null) {
//                    audioInputStreamList = new ArrayList<>();
//                }
//                audioInputStreamList.add(ais);
                // keep calculating frame length
//                if (frameLength == null) {
//                    frameLength = ais.getFrameLength();
//                } else {
//                    frameLength += ais.getFrameLength();
//                }
            }
            ByteArrayInputStream bais = new ByteArrayInputStream(buffer);
            AudioInputStream outputAIS = new AudioInputStream(
                    bais, audioFormat,
                    buffer.length / audioFormat.getFrameSize());
            int nWrittenBytes = AudioSystem.write(outputAIS,
                    AudioFileFormat.Type.WAVE,
                    new File(destinationFileName));
            if (DEBUG) {
                System.out.println("Written bytes: " + nWrittenBytes);
            }
            //write to wav file
//            File out = new File("out10x.wav");
//            boolean bigEndian = false;
//            boolean signed = true;
//            double sampleRate = 44100.0;
//            int bits = 16;
//            int channels = 1;
//            AudioFormat format;
//            format = new AudioFormat((float) sampleRate, bits, channels, signed, bigEndian);
//
//            ByteArrayInputStream bais = new ByteArrayInputStream(buffer);
//            AudioInputStream audioInputStream;
//            audioInputStream = new AudioInputStream(bais, format, buffer.length);
//            AudioSystem.write(audioInputStream, AudioFileFormat.Type.WAVE, out);
//            audioInputStream.close();
            // now write our concatenated file
//            AudioSystem.write(new AudioInputStream(new SequenceInputStream(Collections.enumeration(audioInputStreamList)),
//                    audioFormat, frameLength), Type.WAVE,
//                    new File(destinationFileName));

            // if all is good, return true
//            result = true;
        } catch (Exception e) {
            throw e;
//        } finally {
//            if (audioInputStream != null) {
//                audioInputStream.close();
//            }
//            if (audioInputStreamList != null) {
//                audioInputStreamList = null;
//            }
        }

        return result;
    }

    public byte[] hanningWindow(byte[] recordedData) {

        // iterate until the last line of the data buffer
        for (int n = 1; n < recordedData.length; n++) {
            // reduce unnecessarily performed frequency part of each and every frequency
            recordedData[n] *= 0.5 * (1 - Math.cos((2 * Math.PI * n)
                    / (recordedData.length - 1)));
        }
        return recordedData;
    }

    public void setsendCharacter(String text) {
        this.sendCharacter = text;
    }

    public String getnormalized() {
        return normalized;
    }

    public void setnormalized(String text) {
        this.normalized = text;
    }

    public String gettextTasydid() {
        return textTasydid;
    }

    public void settextTasydid(String text) {
        this.textTasydid = text;
    }

    public String gettextSukun() {
        return textSukun;
    }

    public void settextSukun(String text) {
        this.textSukun = text;
    }

    public String gettextHasilTTP() {
        return textHasilTTP;
    }

    public void settextHasilTTP(String text) {
        this.textHasilTTP = text;
    }

    public String gettextHasilTTPunicode() {
        return textHasilTTPunicode;
    }

    public void settextHasilTTPunicode(String text) {
        this.textHasilTTPunicode = text;
    }

    public String gettextSequencer() {
        return textSequencer;
    }

    public void settextSequencer(String text) {
        this.textSequencer = text;
    }

    public String gettextDBMate() {
        return textDBMate;
    }

    public void settextDBMate(String text) {
        this.textDBMate = text;
    }

    public String gettextAudio() {
        return textAudio;
    }

    public void settextAudio(String text) {
        this.textAudio = text;
    }

    public String gettextAll() {
        normalization a = new normalization();
        textAll = a.textAll(consonant, vocal, tain, other, number);
        return textAll;
    }

    public void settextAll(String text) {
        this.textAll = text;
    }

    public String gettextNum() {
        normalization a = new normalization();
        textNum = a.textNum(number);
        return textNum;
    }

    public void settextNum(String text) {
        this.textNum = text;
    }

    public String gettextProsesNormalisasi() {
        return textProsesNormalisasi;
    }

    public void settextProsesNormalisasi(String text) {
        this.textProsesNormalisasi = text;
    }

    public String gettextFSANunMatiTanwin() {
        return textFSANunMatiTanwin;
    }

    public void settextFSANunMatiTanwin(String text) {
        this.textFSANunMatiTanwin = text;
    }

    public String gettextNormalizedMarked() {
        return textNormalizedMarked;
    }

    public void settextNormalizedMarked(String text) {
        this.textNormalizedMarked = text;
    }

    public String getnunMatiTanwin() {
        return nunMatiTanwin;
    }

    public void setnunMatiTanwin(String text) {
        this.nunMatiTanwin = text;
    }

    public String getdiftong() {
        return diftong;
    }

    public void setdiftong(String text) {
        this.diftong = text;
    }

    public String getmad() {
        return mad;
    }

    public void setmad(String text) {
        this.mad = text;
    }

    public String gettanwin() {
        return tanwin;
    }

    public void settanwin(String text) {
        this.tanwin = text;
    }

    public String gettaMarbutah() {
        return taMarbutah;
    }

    public void settaMarbutah(String text) {
        this.taMarbutah = text;
    }

    public String gettransliterasi1() {
        return transliterasi1;
    }

    public void settransliterasi1(String text) {
        this.transliterasi1 = text;
    }

}
