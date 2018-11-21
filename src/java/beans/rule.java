/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author mr-fao
 */
public class rule {

    //Save strings from split process in array
    private String[] textSplit;

    public String textFSANunMatiTanwin(String text) {
        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        int state = 0;
        int index = 1;//data textSplit berada mulai index-1
        int awal = 0, akhir = 0;
        String hasil = "";

        while (index < textSplit.length) {
            String curr = textSplit[index];

            //state 0
            ///bertemu huruf nun(ن)
            if (state == 0 && curr.equals("1606")) {
                state = 1;
                awal = index - 1;
            } ///bertemu tanwin(ًٌٍ)
            else if (state == 0 && (curr.equals("1611") || curr.equals("1612") || curr.equals("1613"))) {
                state = 2;
                awal = index - 2;
            } //state 1
            ///bertemu sukun(ْ)
            else if (state == 1 && curr.equals("1618")) {
                state = 2;
            } //state 2
            ///bertemu huruf hamzah qatha(أ) / hamzah lazima (ئ) / kha(ح) / kho(خ) / 'ain(ع) / ghoin(غ) / ha'(ه)
            else if (state == 2 && (curr.equals("1571") || curr.equals("1574") || curr.equals("1581") || curr.equals("1582")
                    || curr.equals("1593") || curr.equals("1594") || curr.equals("1607"))) {
                state = 3;
            } ///bertemu huruf ro(ر) / lam(ل)
            else if (state == 2 && (curr.equals("1585") || curr.equals("1604"))) {
                state = 4;
            } ///bertemu huruf nun(ن) / mim(م) / wau(و) / ya(ي)
            else if (state == 2 && (curr.equals("1606") || curr.equals("1605") || curr.equals("1608") || curr.equals("1610"))) {
                state = 6;
            } ///bertemu huruf ba(ب)
            else if (state == 2 && curr.equals("1576")) {
                state = 8;
            } ///bertemu huruf ta(ت) / dal(د) / tho'(ط)
            else if (state == 2 && (curr.equals("1578") || curr.equals("1583") || curr.equals("1591"))) {
                state = 9;
            } ///bertemu huruf tsa(ث) / ja(ج) / dzal(ذ) / za(ز) / sin(س) / syin(ش) / shod(ص) / dhod(ض) / dzo(ظ) / fa(ف)
            else if (state == 2 && (curr.equals("1579") || curr.equals("1580")
                    || curr.equals("1584") || curr.equals("1586") || curr.equals("1587") || curr.equals("1588")
                    || curr.equals("1589") || curr.equals("1590") || curr.equals("1592") || curr.equals("1601"))) {
                state = 10;
            } ///bertemu huruf qof(ق) / kaf(ك)
            else if (state == 2 && (curr.equals("1602") || curr.equals("1603"))) {
                state = 11;
            } //state 3
            ///bertemu vokal(َُِ)
            else if (state == 3 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 12;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Idzhar";
            } //state 4
            ///bertemu tasydid(ّ)
            else if (state == 4 && curr.equals("1617")) {
                state = 5;
            } ///bertemu vokal(َُِ)
            else if (state == 4 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 13;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Idgham Bilaghunnah";
            } //state 5
            ///bertemu vokal(َُِ)
            else if (state == 5 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 13;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Idgham Bilaghunnah";
            } //state 6
            ///bertemu tasydid(ّ)
            else if (state == 6 && curr.equals("1617")) {
                state = 7;
            } ///bertemu vokal(َُِ)
            else if (state == 6 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 14;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Idgham Bighunnah";
            } //state 7
            ///bertemu vokal(َُِ)
            else if (state == 7 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 14;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Idgham Bighunnah";
            } //state 8
            ///bertemu vokal(َُِ)
            else if (state == 8 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 15;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Iqlab";
            } //state 9
            ///bertemu vokal(َُِ)
            else if (state == 9 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 16;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Ikhfa' A'la/Aqrab";
            } //state 10
            ///bertemu vokal(َُِ)
            else if (state == 10 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 17;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Ikhfa' Ausath";
            } //state 11
            ///bertemu vokal(َُِ)
            else if (state == 11 && (curr.equals("1614") || curr.equals("1615") || curr.equals("1616"))) {
                state = 18;
                akhir = index;
                hasil = hasil + "-" + awal + "-" + akhir + "-" + "Ikhfa' Adnaa/Ab'ad";
            } //melewatkan karakter spasi, alif, dan alif lazima(alif bengkok)
            else if (curr.equals("32") || curr.equals("1575") || curr.equals("1609")) {
                //nothing
            } //kembali ke kondisi awal
            else {
                state = 0;
            }

            index++;
        }

        if (hasil.equals("")) {
            hasil = "tidak ditemukan tajwid";
        }

        return hasil;
    }

    public String textNormalizedMarked(String text, String textFSANunMatiTanwin) {
        String[] txtNorm = text.split("&#");
        String[] txtNMT = textFSANunMatiTanwin.split("-");

        for (int i = 1; i < txtNMT.length; i = i + 3) {
            if (txtNMT[i + 2].equals("Idzhar")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #EEBF3D;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Idgham Bilaghunnah")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #3e2a96;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Idgham Bighunnah")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #005b96;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Iqlab")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #fe2e2e;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Ikhfa' A'la/Aqrab")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #a180bc;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Ikhfa' Ausath")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #d4ffbb;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            } else if (txtNMT[i + 2].equals("Ikhfa' Adnaa/Ab'ad")) {
                txtNorm[Integer.parseInt(txtNMT[i])] = txtNorm[Integer.parseInt(txtNMT[i])] + "&zwj;<span style='color : #ffc3a0;'>&zwj;";
                txtNorm[Integer.parseInt(txtNMT[i + 1])] = txtNorm[Integer.parseInt(txtNMT[i + 1])] + "&zwj;</span>&zwj;";
            }
        }

        String tmpTeks = "";

        for (int i = 1; i < txtNorm.length; i++) {
            tmpTeks = tmpTeks + "&#" + txtNorm[i];
        }

        return tmpTeks;
    }

    public String NunMatiTanwin(String text, String textFSANunMatiTanwin) {
        String[] txtNorm = text.split("&#");
        String[] txtNMT = textFSANunMatiTanwin.split("-");

        for (int i = 1; i < txtNMT.length; i = i + 3) {
            if (txtNMT[i + 2].equals("Idzhar")) {
                txtNorm[Integer.parseInt(txtNMT[i]) + 2] = txtNorm[Integer.parseInt(txtNMT[i]) + 2] + "&#32";
            } else if (txtNMT[i + 2].equals("Idgham Bilaghunnah")) {
                if (txtNorm[Integer.parseInt(txtNMT[i]) + 1].equals("1606")) {//jika nun
                    txtNorm[Integer.parseInt(txtNMT[i]) + 1] = "xx";//nun tsb diganti xx sbg tanda untuk dihapus
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "xx";//harakat sukunnya diganti xx sbg tanda untuk dihapus
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1611")) {//jika fathah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1614";//fathah tain diganti fathah
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1612")) {//jika dhomah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1615";//dhomah tain diganti dhomah
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1613")) {//jika kasroh tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1616";//kasroh tain diganti kasroh
                }
                //Menghilangkan spasinya
                if (txtNorm[Integer.parseInt(txtNMT[i]) + 3].equals("32")) {//jika ada spasi
                    txtNorm[Integer.parseInt(txtNMT[i]) + 3] = "xx";//spasi tsb diganti xx sbg tanda untuk dihapus
                }

            } else if (txtNMT[i + 2].equals("Idgham Bighunnah")) {//masuk dengan dengung 2 harakat, dengung dari suara rekaman diphone-nya
                if (txtNorm[Integer.parseInt(txtNMT[i]) + 1].equals("1606")) {//jika nun
                    //txtNorm[Integer.parseInt(txtNMT[i]) + 1] = "xx";//nun tsb diganti xx sbg tanda untuk dihapus
                    //txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "xx";//harakat sukunnya diganti xx sbg tanda untuk dihapus
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1611")) {//jika fathah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1614";//fathah tain diganti fathah
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1612")) {//jika dhomah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1615";//dhomah tain diganti dhomah
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1613")) {//jika kasroh tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1616";//kasroh tain diganti kasroh
                }
                //Menghilangkan spasinya
                if (txtNorm[Integer.parseInt(txtNMT[i]) + 3].equals("32")) {//jika ada spasi
                    txtNorm[Integer.parseInt(txtNMT[i]) + 3] = "xx";//spasi tsb diganti xx sbg tanda untuk dihapus
                }

            } else if (txtNMT[i + 2].equals("Iqlab")) {
                if (txtNorm[Integer.parseInt(txtNMT[i]) + 1].equals("1606")) {//jika nun
                    txtNorm[Integer.parseInt(txtNMT[i]) + 1] = "1605";//nun tsb diganti mim
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1611")) {//jika fathah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1614&#1605&#1618";//fathah tain diganti fathah diikuti mim sukun
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1612")) {//jika dhomah tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1615&#1605&#1618";//dhomah tain diganti dhomah diikuti mim sukun
                } else if (txtNorm[Integer.parseInt(txtNMT[i]) + 2].equals("1613")) {//jika kasroh tain
                    txtNorm[Integer.parseInt(txtNMT[i]) + 2] = "1616&#1605&#1618";//kasroh tain diganti kasroh diikuti mim sukun
                }

            }
        }

        String tmpTeks = "";

        for (int i = 1; i < txtNorm.length; i++) {
            if (txtNorm[i].equals("xx")){
                //dibiarkan untuk dihilangkan
            }else{
                tmpTeks = tmpTeks + "&#" + txtNorm[i];
            }
        }

        return tmpTeks;
    }
    
    public String diftong(String text) {
        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1614") && textSplit[i+1].equals("1610") 
                    && textSplit[i+2].equals("1618")) {//ai
                textSplit[i+1] = "1616";
                textSplit[i+2] = "xx";
            } else if (textSplit[i].equals("1614") && textSplit[i+1].equals("1608") 
                    && textSplit[i+2].equals("1618")) {//au
                textSplit[i+1] = "1615";
                textSplit[i+2] = "xx";
            }
        }
        
        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("xx")){
                //dibiarkan untuk dihilangkan
            }else{
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }
    
    public String mad(String text) {
        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1614") && textSplit[i+1].equals("1575")) {//fathah dan alif
                textSplit[i+1] = "1614";//alif diganti fathah
            } else if (textSplit[i].equals("1615") && textSplit[i+1].equals("1608") 
                    && textSplit[i+2].equals("1618")) {//dhomah, wau, dan sukun
                textSplit[i+1] = "1615";//wau diganti dhomah
                textSplit[i+2] = "xx";//sukun diganti xx untuk dihilangkan
            } else if (textSplit[i].equals("1616") && textSplit[i+1].equals("1610") 
                    && textSplit[i+2].equals("1618")) {//kasroh, ya, dan sukun
                textSplit[i+1] = "1616";//ya diganti kasroh
                textSplit[i+2] = "xx";//sukun diganti xx untuk dihilangkan
            }
        }
        
        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("xx")){
                //dibiarkan untuk dihilangkan
            }else{
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }

    public String tasydid(String text) {
        //asumsi, ditulis tasydid (1617) dahulu baru vokal

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1617")) {
                Boolean con = true;
                for (int j = 2; con == true; j++){
                    if (textSplit[i-j].equals("1614") || textSplit[i-j].equals("1615") || 
                        textSplit[i-j].equals("1616") || textSplit[i-j].equals("1611") ||
                        textSplit[i-j].equals("1612") || textSplit[i-j].equals("1613")){
                        con = false;
                    } else {
                        textSplit[i-j] = "xx";
                    }
                }
            }
        }
        
        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1617")) {
                tmpTeks = tmpTeks + "&#" + textSplit[i - 1];
            } else if (textSplit[i].equals("xx")){
                //dibiarkan untuk dihilangkan
            } else {
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }
    
    public String tanwin(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1611")) {//fathah tain
                tmpTeks = tmpTeks + "&#1614&#1606";//fathah dan nun
            } else if (textSplit[i].equals("1612")) {//dhomah tain
                tmpTeks = tmpTeks + "&#1615&#1606";//dhomah dan nun
            } else if (textSplit[i].equals("1613")) {//kasroh tain
                tmpTeks = tmpTeks + "&#1616&#1606";//kasroh dan nun
            } else {
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }
    
    public String taMarbutah(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1577") && (textSplit[i+1].equals("1614")
                    || textSplit[i+1].equals("1615") || textSplit[i+1].equals("1616")
                    || textSplit[i+1].equals("1611") || textSplit[i+1].equals("1612")
                    || textSplit[i+1].equals("1613"))) {//ta marbutah diikuti vokal hidup
                tmpTeks = tmpTeks + "&#1578";
            } else if (textSplit[i].equals("1577") && textSplit[i+1].equals("1618")) {//mati
                tmpTeks = tmpTeks + "&#1607";
            } else {
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }

    public String sukun(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "";

        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1618")) {//menghilangkan sukun
                //nothing
            } else if (textSplit[i].equals("1571") || textSplit[i].equals("1573")) {//nitip menghilangkan hamzah qatha
                //nothing
            } else if (textSplit[i].equals("1575")){//nitip menghilangkan alif
                //nothing
            } else {
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }
        
        return tmpTeks;
    }

    //membuat hasil akhir proses Text To Phoneme berupa rangkaian fonem
    public String hasilTTP(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "/ ";

        for (int i = 1; i < textSplit.length; i++) {
            tmpTeks = tmpTeks + "&#" + textSplit[i] + " / ";
        }

        return tmpTeks;
    }

    //membuat hasil akhir rangkaian fonem TTP ditulis dalam kode unicode
    public String hasilTTPunicode(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String tmpTeks = "/ ";

        for (int i = 1; i < textSplit.length; i++) {
            tmpTeks = tmpTeks + "&amp#" + textSplit[i] + " / ";
        }

        return tmpTeks;
    }
}
