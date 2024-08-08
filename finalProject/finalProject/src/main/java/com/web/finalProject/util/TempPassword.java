package com.web.finalProject.util;

import java.util.ArrayList;
import java.util.List;

public class TempPassword {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 임시비밀번호(8자리 숫자/문자 혼합) 만들기
		List<Character> clist = new ArrayList<Character> ();
		for(int cnt=1; cnt<=255; cnt++) {
			System.out.print(cnt+"-"+(char)cnt);
			if(cnt>=48 && cnt<=57) {
				clist.add((char) cnt);
			}
			if(cnt>=65 && cnt<=90) {
				clist.add((char) cnt);
			}
			if(cnt>=97 && cnt<=122) {
				clist.add((char) cnt);
			}
		}
		System.out.println("#만들어진 문자 배열#");
		for(char c:clist) {
			System.out.print(c+",");
		}
		System.out.println();
		// 48~57, 65~90, 97~122 : 임시비번
		// 임의의 8문자로 된 배열 생성
		char[] cArr = new char[8];
		for(int idx=0; idx<cArr.length; idx++) {
			cArr[idx]=clist.get((int)(Math.random()*clist.size()));
		}
		String tmpPass = new String(cArr);
		System.out.println("만들어진 임시비번:"+tmpPass);
	}
	public String mkTPwd() {
		String tmpPass=null;
		
		return tmpPass;
	}
}
