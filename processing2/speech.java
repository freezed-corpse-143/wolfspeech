package com.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.io.IOException;

class speechclassify{
	public String classify(String speechs)  throws IOException, InterruptedException{
		String lines = "";
		String app = "D:\\自己写的小程序\\Java调用Python程序测试\\spedeal.py";
		String site = "python "+app;
		String arguments = site + " " + speechs;
		try {
			Process process = Runtime.getRuntime().exec(arguments);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(), "GBK"));
            String line = null;
            
            while ((line = in.readLine()) != null) {
            	lines += line;
            }
            in.close();
            process.waitFor();
            
		}catch (IOException e) {
            e.printStackTrace();
        }catch (InterruptedException e) {
        	e.printStackTrace();
        }
		return lines;
	}
	
}

