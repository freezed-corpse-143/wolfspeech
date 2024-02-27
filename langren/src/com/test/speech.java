package com.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.io.IOException;

class speechclassify{
	public String classify(String speechs)  throws IOException, InterruptedException{
		String lines = "";
		String app = "D:\\aaa_daxue\\比赛\\计算机设计大赛\\程序2\\product.py";
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

