package com.kh.onsoo.file.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

//import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.kh.onsoo.admin.model.dto.AdminDto;
//import com.kh.onsoo.file.model.dto.UploadFile;
import com.kh.onsoo.file.model.validate.FileValidator;
//import com.kh.onsoo.utils.UploadFileUtils;

@Controller
public class FileController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	private FileValidator fileValidator;
	
	@RequestMapping(value = "/tvalid.do", method = RequestMethod.GET)
	public String tvalid(Locale locale, Model model) {	
		
		logger.info("FileController.tvalid");
		
		return "teachervalid";
	}
	
	// 다중 파일
	@RequestMapping(value = "/tvalidup.do", method = RequestMethod.POST)
	public String uploadMany(MultipartHttpServletRequest multifile, Model model, HttpServletRequest request, BindingResult result, AdminDto admindto) throws IOException {
		
		logger.info("FileController.fileUpload");
		
		fileValidator.validate(multifile, result);
		
		if (result.hasErrors()) {
			return "upload";
		}
		
		List<MultipartFile> fileList = multifile.getFiles("file");
		
		try {
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
			File storage = new File(path);
			
			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}
			
			for (MultipartFile file : fileList) {
				
				String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

	            if (file.getSize() != 0) {
	               File target = new File(path, filename);
	               FileCopyUtils.copy(file.getBytes(), target);
	            }
	        }
			if (fileList != null) {
				admindto.setMember_role("I");
			}
			
		} catch (FileNotFoundException e) {
	         e.printStackTrace();
		}
		return "tvalidres.do";
	}
	
	@RequestMapping(value = "/tvalidres.do", method = RequestMethod.GET)
	public String tvalidres(Locale locale, Model model) {	
		
		logger.info("FileController.tvalidres");
		
		return "tvalidres";
	}

	/*
	@RequestMapping(value = "/tvalidup.do")
	public String requestupload2(MultipartHttpServletRequest mtfRequest) {
		
		logger.info("FileController.requestupload2");
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		String path = "C:\\image\\";

		for (MultipartFile mf : fileList) {

			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = path + System.currentTimeMillis() + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}
	*/

	/*
	@RequestMapping(value = "/tvalidup.do")
	public String fileUpload(HttpServletRequest request, Model model, UploadFile uploadFile, BindingResult result) {
		
		logger.info("FileController.fileUpload");
		
		fileValidator.validate(uploadFile, result);
		
		if (result.hasErrors()) {
			return "upload";
		}
		
		MultipartFile file = uploadFile.getMpfile();
		String name = file.getOriginalFilename();
		
		UploadFile fileObj = new UploadFile();
		fileObj.setName(name);
		fileObj.setDesc(uploadFile.getDesc());
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");
			
			logger.info("업로드 될 실제 경로 : " + path);
			
			File storage = new File(path);
			if (!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path + "/" + name);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			
			while((read=inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("fileObj", fileObj);
		
		return "download";
	}
	*/
}



