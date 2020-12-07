package com.kh.onsu.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		//겹쳐지지 않는 파일명을 위한 유니크한 값 생성
		UUID uid = UUID.randomUUID();
		
		//원본파일 이름과 UUID 결합
		String savedName = uid.toString() + "_" + originalName;
		
		//파일을 저장할 폴더 생성(년 월 일 기준)
		String savedPath = calcPath(uploadPath);
		
		//저장할 파일준비
		File target = new File(uploadPath + savedPath, savedName);
		
		//파일을 저장
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		
		//uploadedFileName는 썸네일명으로 화면에 전달된다.
		return uploadedFileName;
	}//
	
	//폴더 생성 함수
	@SuppressWarnings("unused")
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}//calcPath
	
	//폴더 생성 함수
	private static void makeDir(String uploadPath, String... paths) {
		
		if (new File(uploadPath + paths[paths.length -1]).exists()) {
			return;
		}//if
		
		for (String path : paths) {
			
			File dirPath = new File(uploadPath + path);
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}//if
			
		}//for
		
	}//makeDir
	
	//음??? 아이콘? 이미지 파일이 아닌경우  썸네일을 대신?
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
