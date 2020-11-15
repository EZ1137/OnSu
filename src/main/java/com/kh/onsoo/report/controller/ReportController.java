package com.kh.onsoo.report.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.sql.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.report.model.biz.ReportBiz;
import com.kh.onsoo.report.model.dto.ReportDto;

@Controller
public class ReportController {

	@Autowired
	private ReportBiz reportBiz;
	@Autowired
	private AdminBiz admibBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	//이게 지금 없음 bean에 추가 완료
	@Resource(name = "reportuploadPath")
	private String reportuploadPath;

	@RequestMapping(value = "/reportinsert.do")
	public String insertForm(Model model, Principal principal) {

		System.out.println(principal);
			
		model.addAttribute(principal);
		// 시큐리티 컨텍스트 객체를 얻습니다.
		SecurityContext context = SecurityContextHolder.getContext();

		// 인증객체를 얻습니다.
		Authentication authentication = context.getAuthentication();
		// context에 있는 인증정보를 getAuthentication()으로 갖고온다.
		// 로그인한 사용자 정보를 가진 객체를 얻습니다.
		UserDetails principal1 = (UserDetails) authentication.getPrincipal();
		// authentication에 있는 get Princinpal 객체애 유저정보를 담는다.
		// 유저객체는 UserDetails를 implement 함
		String member_id = principal1.getUsername(); // 사용자 이름
		
		model.addAttribute("member_id", member_id);
			
		return "reportinsert";
	}

	@RequestMapping(value = "/reportinsretres.do", method = RequestMethod.POST)
	public String reportInsert(HttpServletRequest request, Model model, ReportDto reportDto,  String report_savename,  
			String report_content, Date report_date, String report_id, String report_ided, String report_category) throws IOException {
		System.out.println("res오냐");
		
		System.out.println(report_savename);
		System.out.println(report_content);
		System.out.println(report_date);
		System.out.println(report_id);
		System.out.println(report_ided);
		System.out.println(report_category);
		
		logger.info("reportinsertres : " + report_id);
		MultipartFile file = reportDto.getReport_filename();
		
		UUID uuid = UUID.randomUUID();
		int reportformat = file.getOriginalFilename().lastIndexOf(".");
//		String report_title = file.getOriginalFilename().toString().substring(0,reportformat);
		
		String report_savename1 = uuid.toString()+".jpg";
		System.out.println(report_savename1);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream(); //업로드 된 파일의 입력스트림을 변수에 저장
			
			//프로젝트 내부에 파일 업로드하는 경로
			//String servpath = WebUtils.getRealPath(request.getSession().getServletContext(), "/");
			String path = WebUtils.getRealPath(request.getSession().getServletContext() , "/resources/img");
			
			//현재 사용중인 프로젝트 경로가 어디인가
			//System.out.println("서블렛 컨텍스트 경로 : "+ servpath);
			System.out.println("업로드될 실제 경로 : "+ path);
			
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path+"/"+report_savename1);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			System.out.println(path+report_savename1);
			System.out.println(newFile);
			
			outputStream = new FileOutputStream(newFile);
			
			int read = 0;
			byte[] b = new byte[(int)file.getSize()];
			
			while((read=inputStream.read(b)) != -1) {
				outputStream.write(b,0,read);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		reportDto.setReport_content(report_content);
		reportDto.setReport_date(report_date);
		reportDto.setReport_savename(report_savename1);
		reportDto.setReport_id(report_id);
		reportDto.setReport_ided(report_ided);
		reportDto.setReport_category(report_category);
		reportBiz.insert(reportDto);
		
		return "redirect:main.do";
	}
}
