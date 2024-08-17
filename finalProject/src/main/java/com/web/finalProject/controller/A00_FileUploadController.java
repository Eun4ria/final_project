package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.web.finalProject.service.A00_FileUploadService;

@RestController
public class A00_FileUploadController {
	 @Autowired(required = false)
    private A00_FileUploadService service;

 //산출물 upload
	// 산출물 파일 목록 조회
	 @GetMapping("upLoad")
	 public String upLoadList(Model d) {
		 d.addAttribute("flist", service.getOutputFileList());
		 return "WEB-INF\\views\\a02_outputlist.jsp";
	 }
	// 산출물 파일 업로드 페이지
    @GetMapping("uploadOutput")
    public String uploadOutput(Model d) {
        d.addAttribute("flist", service.getOutputFileList());
        return "WEB-INF\\views\\a04_fileUpload\\a04_upload.jsp";
    }

    // 산출물 파일 업로드 처리
    @PostMapping("uploadOutput")
    public String uploadOutputPost(@RequestParam("report") MultipartFile mf, Model d) {
        System.out.println("서버에 온 multipart 파일: " + mf.getOriginalFilename());
        d.addAttribute("msg", service.uploadOutputFile(mf));
        d.addAttribute("flist", service.getOutputFileList());
        return "WEB-INF\\views\\a04_fileUpload\\a04_upload.jsp";
    }
}
