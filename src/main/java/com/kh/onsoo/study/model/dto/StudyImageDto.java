package com.kh.onsoo.study.model.dto;

import com.kh.onsoo.study.image.model.dto.UploadDto;

public class StudyImageDto {
	private StudyDto studyDto;
	private UploadDto uploadDto;
	
	public StudyImageDto() {
		
	}

	public StudyImageDto(StudyDto studyDto, UploadDto uploadDto) {
		super();
		this.studyDto = studyDto;
		this.uploadDto = uploadDto;
	}

	public StudyDto getStudyDto() {
		return studyDto;
	}

	public void setStudyDto(StudyDto studyDto) {
		this.studyDto = studyDto;
	}

	public UploadDto getUploadDto() {
		return uploadDto;
	}

	public void setUploadDto(UploadDto uploadDto) {
		this.uploadDto = uploadDto;
	}
	
	
}
