package com.web.finalProject.util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
/*
// DownLoadCtrl.java
	public String downLoad(@RequestParam("fname") String fname, 
			                 Model d) {
		d.addAttribute("downloadFile", fname);
		return "downloadView";/
		
*/
@Controller
public class A02_DownLoadCtrl {
	// 호출시 특정 파일을 다운로드 처리..
	@GetMapping("downLoad.do")
	public String downLoad(@RequestParam("fname") String fname, 
			                 Model d) {
		d.addAttribute("downloadFile", fname);
		return "downloadView";// downloadView downloadFile
	}
}
