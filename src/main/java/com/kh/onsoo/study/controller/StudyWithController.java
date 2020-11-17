package com.kh.onsoo.study.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.kh.onsoo.study.model.dto.StudyDto;
import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.calendar.model.biz.CalendarBiz;
import com.kh.onsoo.listen.model.biz.ListenVideoBiz;
import com.kh.onsoo.listen.model.biz.ListenWithBiz;
import com.kh.onsoo.listen.model.dto.ListenVideoDto;
import com.kh.onsoo.listen.model.dto.ListenWithDto;
import com.kh.onsoo.pay.model.biz.PayBiz;
import com.kh.onsoo.review.model.biz.ReviewBiz;
import com.kh.onsoo.study.image.model.biz.UploadBiz;
import com.kh.onsoo.study.image.model.dto.UploadDto;
import com.kh.onsoo.study.model.biz.StudyWithBiz;

@Controller
public class StudyWithController {

	private static final Logger logger = LoggerFactory.getLogger(StudyWithController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private UploadBiz uploadBiz;
	
	@Autowired
	private StudyWithBiz studyBiz;

	@Autowired
	private AdminBiz adminBiz;
	
	@Autowired
	private PayBiz payBiz;
	
	@Autowired
	private ReviewBiz reviewBiz;
	
	@Autowired
	private ListenWithBiz listenBiz;
	
	@Autowired
	private CalendarBiz calendarBiz;
	
	@RequestMapping(value = "/with/studylist.do")
	public String studyList(Model model) {
		
		model.addAttribute("list", studyBiz.selectList());
		return "studylist";
	}

	@RequestMapping("/with/studydetail.do")
	public String studyDetail(Model model, int class_no, @RequestParam String member_id) {
		int pay_classno = class_no;
		String pay_memberid = member_id;
		
		int review_classno = class_no;
		String review_id = member_id;
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		model.addAttribute("imageList", uploadBiz.selectList(class_no));
		model.addAttribute("payDto", payBiz.selectPay(pay_memberid, pay_classno));
		model.addAttribute("reviewDto", reviewBiz.selectReview(review_id, review_classno));
		
		List<ListenWithDto> list = listenBiz.selectList(member_id);
		boolean trigger = false;
		
		for(ListenWithDto dto : list) {
			int wclass_no = dto.getListen_wclassno();
			if(class_no == wclass_no) {
				trigger = true;
				model.addAttribute("trigger", trigger);
				break;
			}
		}
		
		
		return "studydetail";
	}
	
	@RequestMapping("/with/teacher/studydetail.do")
	public String studyTeacherDetail(Model model, int class_no) {
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		model.addAttribute("imageList", uploadBiz.selectList(class_no));
		
		return "studydetail_teacher";
	}
	
	@RequestMapping(value = "/with/teacher/studyinsert.do") // 강사 마이페이지에서 넘겨야함
	public String insertForm() {
		return "studyinsert_with";
	}

	@RequestMapping(value = "/with/teacher/studyinsertres.do", method = RequestMethod.POST)
	public String studyInsert(MultipartHttpServletRequest multifile, Model model, HttpServletRequest request, Principal principal)
			throws IOException {

		model.addAttribute(principal);
	    //시큐리티 컨텍스트 객체를 얻습니다.
	    SecurityContext context = SecurityContextHolder.getContext();
	      
	    //인증객체를 얻습니다. 
	    Authentication authentication = 
	                              context.getAuthentication();
	                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	    //로그인한 사용자 정보를 가진 객체를 얻습니다.
	    UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                        //유저객체는 UserDetails를 implement 함 
	      
	    String member_id = principal1.getUsername();  //사용자 이름 

	    AdminDto adminDto = adminBiz.selectOne2(member_id);
	    
		String class_title = multifile.getParameter("class_title");
		String class_teachername = adminDto.getMember_name();
		String class_bigcategory = multifile.getParameter("class_bigcategory");
		String class_smallcategory = multifile.getParameter("class_smallcategory");
		String class_info = multifile.getParameter("class_info");
		int class_price = Integer.parseInt(multifile.getParameter("class_price"));

		StudyDto dto = new StudyDto(0, 
									class_title, 
									member_id, 
									class_teachername, 
									null, 
									class_bigcategory,
									class_smallcategory, 
									class_info, 
									class_price);

		int res = studyBiz.insert(dto);

		int class_no = 0;
		
		if (res > 0) {
			
			class_no = studyBiz.selectNum();
			if(class_no != 0) {
				boolean uploadRes = uploadMany(multifile, model, request, class_no);
				if(uploadRes) {
					return "redirect:/studylist.do";
				}
			}
		}
		
		return "studyinsert_with";
	}
	
	@RequestMapping("/with/teacher/studyupdate.do")
	public String studyUpdate(Model model, int class_no) {
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		return "studyupdate";
	}

	@RequestMapping("/with/teacher/studyupdateres.do")
	public String studyUpdateres(StudyDto dto) {

		int res = studyBiz.update(dto);

		if (res > 0) {
			return "redirect:with/studydetail.do?class_no=" + dto.getClass_no();
		}
		return "redirect:with/studyupdate.do?class_no=" + dto.getClass_no();
	}

	@RequestMapping("/with/teacher/studydelete.do")
	public String studyDelete(int class_no) {

		int res = studyBiz.delete(class_no);
		if (res > 0) {
			return "redirect:/studylist.do";
		}
		return "redirect:studydetail.do?class_no=" + class_no;
	}

	// 음 alert 처리?
	@RequestMapping("/with/teacher/imagedelete.do") //댓글 삭제  
    @ResponseBody
    private int imageDelete(@RequestParam int image_no) throws Exception{
		logger.info("이미지 삭제");
        return uploadBiz.delete(image_no);
    }
	
	public boolean uploadMany(MultipartHttpServletRequest multifile, Model model, HttpServletRequest request, int class_no)
			throws IOException {

		List<MultipartFile> fileList = multifile.getFiles("file");
		List<UploadDto> list = new ArrayList<UploadDto>();

		try {

			File storage = new File(uploadPath);

			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}

			for (MultipartFile file : fileList) {
				UploadDto uploadDto = null;
				String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

				if (file.getSize() != 0) {
					File target = new File(uploadPath, filename);
					FileCopyUtils.copy(file.getBytes(), target);
				}

				String insertName = filename;
				uploadDto = new UploadDto(0, insertName, class_no);
				list.add(uploadDto);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		int res = 0;

		res = uploadBiz.insertList(list);
		if (res == list.size()) {
			return true;
		} else
			return false;

	}
	
	@RequestMapping("/header.do")
	public String header(Model model, Principal principal) {
		
		model.addAttribute(principal);
	    //시큐리티 컨텍스트 객체를 얻습니다.
	    SecurityContext context = SecurityContextHolder.getContext();
	      
	    //인증객체를 얻습니다. 
	    Authentication authentication = 
	                              context.getAuthentication();
	                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	    //로그인한 사용자 정보를 가진 객체를 얻습니다.
	    UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                        //유저객체는 UserDetails를 implement 함 
	      
	    String member_id = principal1.getUsername();  //사용자 이름 

	    AdminDto adminDto = adminBiz.selectOne2(member_id);
	    
	    model.addAttribute("adminDto", adminDto);
	    
	    return "header";
	}
}
