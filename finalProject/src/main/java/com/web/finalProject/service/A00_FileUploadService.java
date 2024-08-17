package com.web.finalProject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class A00_FileUploadService {
		
	//파일 업로드
	// 공통으로 저장된 경로를 가져오기 
	@Value("${user.profile.upload.path}")
	private String profileUploadPath;
	
	@Value("${user.output.upload.path}")
	private String outputUploadPath;
	
	// 공통된 파일 목록 가져오기
	public List<String> getFileList(String path){
	// upload 폴드에 있는 파일이름 정보를 List<String>으로 만들어
	// 리턴 처리..
	List<String> flist = new ArrayList<String>();
	File fold = new File(path); //
	for(File file:fold.listFiles()) {
		System.out.println(file.getName());
		flist.add(file.getName());
	}		
	return flist;
	}
	
	// 프로필 이미지 파일 목록 가져오기
	public List<String> getProfileFileList() {
	return getFileList(profileUploadPath);
	}
	
	// 산출물 파일 목록 가져오기
	public List<String> getOutputFileList() {
	return getFileList(outputUploadPath);
	}
	
	// 공통된 파일 업로드 메서드
	public String uploadFile(MultipartFile mf, String path) {
	File uploadFile = new File(path, mf.getOriginalFilename());
	String msg = null;
	try {
	    mf.transferTo(uploadFile);
	    msg = "파일 업로드 성공";
	} catch (IllegalStateException e) {
	    System.out.println(e.getMessage());
	    msg = "파일 업로드 실패: " + e.getMessage();
	} catch (IOException e) {
	    System.out.println("# 파일 관련 예외 #");
	    System.out.println(e.getMessage());
	    msg = "파일 업로드 실패: " + e.getMessage();
	} catch (Exception e) {
	    System.out.println("# 기타 예외 #");
	    System.out.println(e.getMessage());
	    msg = "파일 업로드 실패: " + e.getMessage();
	}
	return msg;
	}
	
	// 프로필 이미지 업로드 메서드
	public String uploadProfileImage(MultipartFile mf) {
	return uploadFile(mf, profileUploadPath);
	}
	
	// 산출물 파일 업로드 메서드
	public String uploadOutputFile(MultipartFile mf) {
	return uploadFile(mf, outputUploadPath);
	}

}
