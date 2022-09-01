package com.sessionfactory;

public class Helper {

	public static String get10Words(String desc) {
		String[] strs = desc.split(" ");
		 if(strs.length>10) {
			 String res="";
			 for(int i=0; i<10 ; i++) {
				 res = res+strs[i];
			 }
			 return (res+"...");
		 }
		return (desc+"...");
	}
	
	public static int discount(int sellingPrice, int off) {
		int dis = 0;
		
		dis = (100-off);
		int basePrice =((sellingPrice*100)/dis);
		
		return basePrice;
		
	}
}
