package com.kh.onsu.study.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.onsu.study.image.model.dao.UploadDao;
import com.kh.onsu.study.image.model.dto.UploadDto;

import org.springframework.web.util.WebUtils;

@Controller
public class UploadController {
	
	@Autowired
	private UploadDao uploadDao;
	
	@Resource(name = "uploadPath")
	private String uploadPath; // 나중에 배포 후에 경로 고정시키고 해당 경로 여기에 받음

	@RequestMapping("/form")
	public String form() {
		return "uploadtest";
	}

	// 단일 파일
	@RequestMapping(value = "/uploadtest", method = RequestMethod.POST)
	public void upload(@RequestParam("file") MultipartFile file, Model model, HttpServletRequest request) throws IOException {
		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

		try {
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

			File storage = new File(path);

			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}

			if (file.getSize() != 0) {
				File target = new File(path, filename);
				FileCopyUtils.copy(file.getBytes(), target);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 다중 파일
	@RequestMapping(value = "/uploadtest1", method = RequestMethod.POST)
	public String uploadMany(MultipartHttpServletRequest multifile, Model model, HttpServletRequest request) throws IOException {

		List<MultipartFile> fileList = multifile.getFiles("file");
		List<UploadDto> list = new ArrayList<UploadDto>();
		
		try {

			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

			File storage = new File(path);

			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}
			
			for (MultipartFile file : fileList) {
				UploadDto uploadDto = null;
				String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				
				if (file.getSize() != 0) {
					File target = new File(path, filename);
					FileCopyUtils.copy(file.getBytes(), target);
				}
				
				String insertName = path + "/" + filename;
				uploadDto = new UploadDto(0, insertName, 1);
				list.add(uploadDto);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		int res = uploadDao.insertList(list);
		
		if(res > list.size()) { 
			return "redirect: /form";
		}
		return "";
	}
}