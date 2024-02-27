package com.hanpeng.servlet;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.io.IOException;

class speechclassify{
	public String[] classify(String speechs, String identity)  throws IOException, InterruptedException{
		String lines = "";
		System.out.println(speechs);
		String app = "D:\\A狼人杀\\新建文件夹\\processing2\\product.py";
		String site = "python "+app;
		String arguments = site + " " + speechs + " " + identity;
		System.out.println(arguments);
		String result[] = new String[2];
		try {
			Process process = Runtime.getRuntime().exec(arguments);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(), "GBK"));
            String line = null;
            
            for(int i=0;i<2;i++) {
            	result[i]=in.readLine();
            	System.out.println(result[i]);
            }
          /*  while ((line =  in.readLine()) != null) {
            	
            	lines += "#"+line;
            }
            */
            in.close();
            process.waitFor();
            
		}catch (IOException e) {
            e.printStackTrace();
        }catch (InterruptedException e) {
        	e.printStackTrace();
        }
		return result;
	}
	
}

