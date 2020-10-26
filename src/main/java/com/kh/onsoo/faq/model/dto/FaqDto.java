package com.kh.onsoo.faq.model.dto;

public class FaqDto {
	
	private int faqseq;
	private String faqtitle;
	private String faqcontent;
	
	public FaqDto() {
		
	}
	
	public FaqDto(int faqseq, String faqtitle, String faqcontent) {
		this.faqseq = faqseq;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
	}

	public int getFaqseq() {
		return faqseq;
	}

	public void setFaqseq(int faqseq) {
		this.faqseq = faqseq;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}

}
