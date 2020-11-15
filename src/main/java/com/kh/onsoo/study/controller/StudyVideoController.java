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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.pay.model.biz.PayBiz;
import com.kh.onsoo.study.image.model.biz.UploadBiz;
import com.kh.onsoo.study.image.model.dto.UploadDto;
import com.kh.onsoo.study.model.biz.StudyVideoBiz;
import com.kh.onsoo.study.model.biz.StudyWithBiz;
import com.kh.onsoo.study.model.dto.StudyDto;
import com.kh.onsoo.study.model.dto.StudyImageDto;
import com.kh.onsoo.study.video.model.biz.VideoBiz;
import com.kh.onsoo.study.video.model.dto.VideoDto;

@Controller
public class StudyVideoController {

	private static final Logger logger = LoggerFactory.getLogger(StudyVideoController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private UploadBiz uploadBiz;

	@Autowired
	private StudyVideoBiz studyBiz;

	@Autowired
	private StudyWithBiz studyWithBiz;

	@Autowired
	private VideoBiz videoBiz;
	
	@Autowired
	private AdminBiz adminBiz;
	
	@Autowired
	private PayBiz payBiz;
	
	@RequestMapping(value = "/video/studylist.do")
	public String studyVideoList(Model model, Principal principal) {
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

	    model.addAttribute("member_id", member_id);
		model.addAttribute("list", studyBiz.selectList());
		return "studylist";
	}

	@RequestMapping("/video/studydetail.do")
	public String studyDetail(Model model, int class_no, @RequestParam String member_id) {
		int pay_classno = class_no;
		String pay_memberid = member_id;
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		model.addAttribute("imageList", uploadBiz.selectList(class_no));
		model.addAttribute("videoList", videoBiz.videoList(class_no));
		model.addAttribute("payDto", payBiz.selectPay(pay_memberid, pay_classno));
		
		return "studydetail";
	}

	// 강사 마이페이지 -> 본인 강의 리스트
	@RequestMapping(value = "/studylist.do")
	public String studyList(Model model) {

		model.addAttribute("withList", studyWithBiz.selectListTeacher());
		model.addAttribute("videoList", studyBiz.selectListTeacher());
		return "studylist_teacher";
	}

	@RequestMapping("/video/teacher/studydetail.do")
	public String studyTeacherDetail(Model model, int class_no) {
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		model.addAttribute("imageList", uploadBiz.selectList(class_no));
		model.addAttribute("videoList", videoBiz.videoList(class_no));
		
		return "studydetail_teacher";
	}

	@RequestMapping(value = "/video/teacher/studyinsert.do") // 강사 마이페이지에서 넘겨야함
	public String insertForm() {
		return "studyinsert_video";
	}

	@RequestMapping(value = "/video/teacher/studyinsertres.do", method = RequestMethod.POST)
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
		
		return "studyinsert_video";
	}

	@RequestMapping("/video/teacher/studyupdate.do")
	public String studyUpdate(Model model, int class_no) {
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		return "studyupdate";
	}

	@RequestMapping("/video/teacher/studyupdateres.do")
	public String studyUpdateres(StudyDto dto) {

		int res = studyBiz.update(dto);

		if (res > 0) {
			return "redirect:video/studydetail.do?class_no=" + dto.getClass_no();
		}
		return "redirect:video/studyupdate.do?class_no=" + dto.getClass_no();
	}

	@RequestMapping("/video/teacher/studydelete.do")
	public String studyDelete(int class_no) {

		int res = studyBiz.delete(class_no);

		if (res > 0) {
			return "redirect:/studylist.do";
		}
		return "redirect:video/studydetail.do?class_no=" + class_no;
	}
	// 음 alert 처리?

	@RequestMapping("/video/teacher/videoform.do")
	public String videoForm(Model model, int class_no) {

		model.addAttribute("class_no", class_no);
		return "videoinsert";
	}

	@RequestMapping("/video/videodetail.do")
	public String videoShow(Model model, int video_no) {
		model.addAttribute("videoDto", videoBiz.videoOne(video_no));
		return "videoshow";
	}

	@RequestMapping("/video/teacher/videodetail.do")
	public String videoTeacherShow(Model model, int video_no) {
		model.addAttribute("videoDto", videoBiz.videoOne(video_no));
		return "videoshow";
	}
	
	// 동영상 업로드
	@RequestMapping(value = "/video/teacher/videoinsertres.do", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, Model model, HttpServletRequest request, String videoname, int class_no)
			throws IOException {
		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		VideoDto videoDto = null;
		String insertName = null;
		
		try {

			File storage = new File(uploadPath);

			// 폴더 생성
			if (!storage.exists()) {
				storage.mkdir();
			}

			if (file.getSize() != 0) {
				File target = new File(uploadPath, filename);
				FileCopyUtils.copy(file.getBytes(), target);
			}

			insertName = filename;
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "redirect:videoinsert.do?class_no=" + class_no;
		}
		
		videoDto = new VideoDto(0, videoname, "0", insertName, class_no);
		
		int res = 0;

		res = videoBiz.insert(videoDto);
		if (res > 0) {
			return "redirect:studydetail.do?class_no=" + class_no;
		} else
			return "redirect:videoinsert.do?class_no=" + class_no;
	}
	
	@RequestMapping("/video/teacher/videoupdateform.do")
	public String videoUpdateForm(Model model, int video_no) {
		
		model.addAttribute("videoDto", videoBiz.videoOne(video_no));
		
		return "videoupdate";
	}
	
	@RequestMapping("/video/teacher/videoupdateres.do")
	public String videoUpdate(Model model, VideoDto videoDto, int class_no) {
		
		int res = videoBiz.update(videoDto);
		
		if(res > 0) {
			
			return "redirect:studydetail.do?class_no=" + class_no;
		}
		
		return "videoupdate";
	}
	
	@RequestMapping("/video/teacher/videodelete.do")
	public String videoUpdate(int video_no, int class_no) {
		
		int res = videoBiz.delete(video_no);
		
		if(res > 0) {
			
			return "redirect:studydetail.do?class_no=" + class_no;
		}
		
		return "redirect:studydetail.do?class_no=" + class_no;
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
}
