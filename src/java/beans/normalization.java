/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Fakultas Teknik
 */
public class normalization {

    public static String[][] append(String[][] a, String[][] b) {
        String[][] result = new String[a.length + b.length][];
        System.arraycopy(a, 0, result, 0, a.length);
        System.arraycopy(b, 0, result, a.length, b.length);
        return result;
    }

    public String checkChar(String sendCharacter, String[][] consonant, 
            String[][] vocal, String[][] tain, String[][] other, String[][] number) {
        String[] textSplit;
        textSplit = sendCharacter.split("&#");
        
        String[][] merge;
        merge = append(consonant, vocal);
        merge = append(merge, tain);
        merge = append(merge, other);

        String tmpTeks = "";
        int i = 1;
        while (i < textSplit.length) {
            int j = 0;
            while (j < merge.length) {
                if (textSplit[i].equals(merge[j][2])) {
                    tmpTeks = tmpTeks + "&#" + textSplit[i];
                    break;
                }
                j++;
            }

            j = 0;
            //convert number to consonant
            while (j < number.length) {
                if (textSplit[i].equals(number[j][2])) {
                    tmpTeks = tmpTeks + " " + number[j][3] + " ";
                    break;
                }
                j++;
            }
            i++;
        }
        
        return tmpTeks;
    }
    
    public String allah (String text) {

        //0->null,1->"data.."dst
        String[] textSplit = text.split("&#");

        //nitip konversi Allah (lam-lam-ha)
        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("1604") && textSplit[i+1].equals("1604") && textSplit[i+2].equals("1607")) {//deteksi lam-lam-ha
                textSplit[i] = textSplit[i] + "&#1617&#1614&#1607";
                textSplit[i+1] = "xx";
                textSplit[i+2] = "xx";
            }
        }
        
        String tmpTeks = "";
        
        for (int i = 1; i < textSplit.length; i++) {
            if (textSplit[i].equals("xx")){
                //dibiarkan untuk dihilangkan
            } else {
                tmpTeks = tmpTeks + "&#" + textSplit[i];
            }
        }

        return tmpTeks;
    }

    public String textAll(String[][] consonant, String[][] vocal, String[][] tain, String[][] other, String[][] number) {
        String tmpTeks = "";

        String[][] merge;
        merge = append(consonant, vocal);
        merge = append(merge, tain);
        merge = append(merge, other);
        merge = append(merge, number);
        for (int i = 0; i < merge.length; i++) {
            tmpTeks = tmpTeks + "&#" + merge[i][2];
        }

        return tmpTeks;
    }

    public String textNum(String[][] number) {
        String tmpTeks = "";

        for (int i = 0; i < number.length; i++) {
            tmpTeks = tmpTeks + "&#" + number[i][2] + number[i][3] + "-";
        }

        return tmpTeks;
    }

    public String textProsesNormalisasi(String sendCharacter, String[][] consonant, String[][] vocal, String[][] tain, String[][] other, String[][] number) {
        String[] textSplit;
        textSplit = sendCharacter.split("&#");

        String[][] merge;
        merge = append(consonant, vocal);
        merge = append(merge, tain);
        merge = append(merge, other);

        String tmpTeks = "<table class=\"table table-striped\" border=\"1\">"
                + "<thead>"
                + "<tr><th>No</th>"
                + "<th>Karakter</th>"
                + "<th>Karakter dalam Unicode</th>"
                + "<th>Keterangan</th></tr>"
                + "</thead><tbody>";

        int i = 1;
        while (i < textSplit.length) {
            int cek = 0;
            int j = 0;
            while (j < merge.length) {
                if (textSplit[i].equals(merge[j][2])) {
                    cek = 1;
                    tmpTeks = tmpTeks + "<tr><td>" + (i) + "</td><td><p>&#" + textSplit[i] + "</p></td><td>&amp#" + merge[j][2] + "</td><td>Diterima</td></tr>";
                    
                    break;
                }
                j++;
            }

            j = 0;
            //convert number to consonant
            while (j < number.length) {
                if (textSplit[i].equals(number[j][2])) {
                    cek = 2;
                    tmpTeks = tmpTeks + "<tr><td>" + (i - 1) + "</td><td><p>&#" + textSplit[i] + "</p></td><td>&amp#" + number[j][2] + "</td><td>Dikonversi menjadi: "+ number[j][3] + "</td></tr>";
                    break;
                }
                j++;
            }
            
            if(cek==0){
                tmpTeks = tmpTeks + "<tr><td>" + (i - 1) + "</td><td><p>&#" + textSplit[i] + "</p></td><td>&amp#" + merge[i][2] + "</td><td>Ditolak</td></tr>";
            }
            i++;
        }
        tmpTeks = tmpTeks + "</tbody></table>";
        
        return tmpTeks;
    }
    
    public String translate1(String text, String[][] consonant, String[][] vocal, String[][] tain, String[][] other, String[][] number) {
        String[] textSplit;
        textSplit = text.split("&#");
        
        String[][] merge;
        merge = append(consonant, vocal);
        merge = append(merge, tain);
        merge = append(merge, other);
        merge = append(merge, number);
        
        String tmpTeks = "";
        int i = 0;
        while (i < textSplit.length) {
            int j = 0;
            while (j < merge.length) {
                if (textSplit[i].equals(merge[j][2])) {
                    tmpTeks = tmpTeks + merge[j][3];
                    break;
                }
                j++;
            }
            i++;
        }
        
        return tmpTeks;
    }
}
