/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.nio.file.*;

/**
 *
 * @author mr-fao
 */
public class sequencer {

    //Save strings from split process in array
    private String[] textSplit;

    public String[] mate(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String[] data = new String[textSplit.length - 2];
        for (int i = 1; i < textSplit.length - 1; i++) {
            data[i - 1] = "" + textSplit[i] + textSplit[i + 1];
        }

        return data;
    }

    public String listmate(String text) {

        //0->null,1->"data.."dst
        textSplit = text.split("&#");

        String[] data = new String[textSplit.length - 2];
        for (int i = 1; i < textSplit.length - 1; i++) {
            data[i - 1] = "&amp#" + textSplit[i] + "/&amp#" + textSplit[i + 1];
        }

        String tmpTeks = "";

        for (int i = 0; i < data.length; i++) {
            tmpTeks = tmpTeks + "/ " + data[i] + " /";
        }

        return tmpTeks;
    }

    public String dbmate(String[] data) {


        String tmpTeks = "";

        for (int i = 0; i < data.length; i++) {
            String tmpFile = "D:/audiodata/" + data[i] + ".wav";
            Path path = Paths.get(tmpFile);

            if (Files.exists(path)) {
                // file exist
                tmpTeks = tmpTeks + "/ " + data[i] + ".wav /";
            }else{
                tmpTeks = tmpTeks + "/ <span style=\"color:red\"><strong>" + data[i] + ".wav</strong></span> /";
            }
            
        }

        return tmpTeks;
    }
    
}
