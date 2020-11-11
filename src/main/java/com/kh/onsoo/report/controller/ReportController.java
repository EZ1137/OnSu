package com.kh.onsoo.report.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.report.model.biz.ReportBiz;
import com.kh.onsoo.report.model.dto.ReportDto;

@Controller
public class ReportController {

	@Autowired
	private AdminBiz adminBiz;

	@Autowired
	private ReportBiz reportBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	//이게 지금 없음 bean에 추가 완료
	@Resource(name = "reportuploadPath")
	private String reportuploadPath;
	

	@RequestMapping(value = "/reportinsert.do")
	public String insertForm(Model model, Principal principal) {

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

		model.addAttribute("member_id",member_id);

		return "reportinsert";
	}

	@RequestMapping(value = "/reportinsretres.do", method = RequestMethod.POST)
	public String reportInsert(@RequestParam("file")Model model, MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("res오냐");

//		List<MultipartFile> fileList = multifile.getFiles("file");
//		List<ReportDto> list = new ArrayList<ReportDto>();
		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		try {

			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

			File storage = new File(path);

			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}

//			for (MultipartFile file : fileList) {
//				ReportDto reportDto = null;
//				String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//
//				if (file.getSize() != 0) {
//					File target = new File(path, filename);
//					FileCopyUtils.copy(file.getBytes(), target);
//				}
//				int report_no = 0;
//				String report_title = "";
//				String report_content = "";
//				Date report_date = null;
//				String report_filename = path + "/" + filename;
//				String report_id = "";
//				String report_ided = "";
//				String report_category = "";
//				reportDto = new ReportDto(report_no, report_title, report_content, report_date, report_filename, report_id, report_ided, report_category);
//				list.add(reportDto);
//			}
			if(file.getSize() != 0) {
				File target = new File(path, filename);
				FileCopyUtils.copy(file.getBytes(), target);
				System.out.println();
			}
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		}
		
//		int res = reportBiz.insert(list);
//		
//		if (res > list.size()) {
//			return "redirect:main.do";
//		}
//		logger.info("응 안됨");
		
		return "redirect:main.do";
	}
}
