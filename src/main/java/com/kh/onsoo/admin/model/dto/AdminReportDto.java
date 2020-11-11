package com.kh.onsoo.admin.model.dto;

import java.sql.Date;

public class AdminReportDto {

	private int report_no;
	private String report_title;
	private String report_content;
	private Date report_date;
	private String report_filename;
	private String report_id;
	private String report_ided;
	private String report_category;
	
	public AdminReportDto() {
		
	}

	public AdminReportDto(int report_no, String report_title, String report_content, Date report_date,
			String report_filename, String report_id, String report_ided, String report_category) {
		super();
		this.report_no = report_no;
		this.report_title = report_title;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_filename = report_filename;
		this.report_id = report_id;
		this.report_ided = report_ided;
		this.report_category = report_category;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
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

	public String getReport_filename() {
		return report_filename;
	}

	public void setReport_filename(String report_filename) {
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
