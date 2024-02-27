package com.test;
import java.io.IOException;

import com.test.speechclassify;
public class test {
	public static void main(String[]args) {
		speechclassify sc=new speechclassify();
		String number="1",speechs="我是袁佳，我初二号六号是金水";
		String result="";
		try {
			result=sc.classify(speechs);
			System.out.println("结果是"+result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
