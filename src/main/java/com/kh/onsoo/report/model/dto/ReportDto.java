package com.kh.onsoo.report.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReportDto {

	private String report_content;
	private Date report_date;
	private String report_savename;
	private String report_id;
	private String report_ided;
	private String report_category;
	
	private MultipartFile report_filename;

	public ReportDto() {
		// default constructor
	}

	public ReportDto(String report_content, String report_savename, Date report_date, MultipartFile report_filename, String report_id,
			String report_ided, String report_category) {
		super();
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_savename = report_savename;
		this.report_filename = report_filename;
		this.report_id = report_id;
		this.report_ided = report_ided;
		this.report_category = report_category;
	}


	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	public String getReport_savename() {
		return report_savename;
	}
	
	public void setReport_savename(String report_savename) {
		this.report_savename = report_savename;
	}
	
	public MultipartFile getReport_filename() {
		return report_filename;
	}

	public void setReport_filename(MultipartFile report_filename) {
		this.report_filename = report_filename;
	}
	
	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getReport_ided() {
		return report_ided;
	}

	public void setReport_ided(String report_ided) {
		this.report_ided = report_ided;
	}
	
	public String getReport_category() {
		return report_category;
	}

	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
}
