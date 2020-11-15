package com.kh.onsoo.study.video.model.dto;

public class VideoDto {

	private int video_no;
	private String video_title;
	private String video_directory;
	private String video_runtime;
	private int class_no;
	
	public VideoDto() {
		
	}

	public VideoDto(int video_no, String video_title, String video_runtime, String video_directory, int class_no) {
		super();
		this.video_no = video_no;
		this.video_title = video_title;		
		this.video_runtime = video_runtime;
		this.video_directory = video_directory;
		this.class_no = class_no;
	}

	public int getVideo_no() {
		return video_no;
	}

	public void setVideo_no(int video_no) {
		this.video_no = video_no;
	}

	public String getVideo_title() {
		return video_title;
	}

	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}

	public String getVideo_runtime() {
		return video_runtime;
	}

	public void setVideo_runtime(String video_runtime) {
		this.video_runtime = video_runtime;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getVideo_directory() {
		return video_directory;
	}

	public void setVideo_directory(String video_directory) {
		this.video_directory = video_directory;
	}
	
	
	
}
