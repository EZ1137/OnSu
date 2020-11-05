package com.kh.onsoo.online.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.onsoo.online.model.biz.ClassBiz;

@Controller
public class ClassController {
	
	private Logger logger = LoggerFactory.getLogger(ClassController.class);
	
	@Autowired
	private ClassBiz classBiz;

}
