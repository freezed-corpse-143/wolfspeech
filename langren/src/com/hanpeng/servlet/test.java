package com.hanpeng.servlet;

import java.io.IOException;

import com.hanpeng.servlet.speechclassify;

public class test {
	public static void main(String[]args) {
		speechclassify sc=new speechclassify();
		String number="5",speechs="众望所归我是一张预言家牌，昨晚查杀的1号，3号跟4号在这抢民的衣服，局势很明了，好人这局跟着我把1号投出去，我如果活下来，就1、3里面验，不过，我估计我活不过今晚";
		String identity="预言家";
		String[] result;
		//String[] result1;
		try {
			result=sc.classify(speechs, identity);
			System.out.print(result[0]);
			
			//result1=result.split("#");
			//System.out.print(result1.length);
			
			//for(int i=0;i<=1;i++) {
				//result11=result1[i];					
			//}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
}
