package com.kh.onsoo.qna.model.dto;

import java.util.Date;

public class QnaDto {
	
	private int qnano;
	private String qnaqwriter;
	private String qnatitle;
	private String qnaqcontent;
	private Date qnaqregdate;
	private String qnasecret;
	private String qnaresponse;
	private String qnaawriter;
	private String qnaacontent;
	private Date qnaaregdate;

	public QnaDto() {
	}
	
	public QnaDto(int qnano, String qnaqwriter, String qnatitle, String qnaqcontent, Date qnaqregdate, String qnasecret, String qnaresponse, String qnaawriter, String qnaacontent, Date qnaaregdate) {
		this.qnano = qnano;
		this.qnaqwriter = qnaqwriter;
		this.qnatitle = qnatitle;
		this.qnaqcontent = qnaqcontent;
		this.qnaqregdate = qnaqregdate;
		this.qnasecret = qnasecret;
		this.qnaresponse = qnaresponse;
		this.qnaqwriter = qnaawriter;
		this.qnaqcontent = qnaacontent;
		this.qnaaregdate = qnaaregdate;
	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	public String getQnaqwriter() {
		return qnaqwriter;
	}

	public void setQnaqwriter(String qnaqwriter) {
		this.qnaqwriter = qnaqwriter;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getQnaqcontent() {
		return qnaqcontent;
	}

	public void setQnaqcontent(String qnaqcontent) {
		this.qnaqcontent = qnaqcontent;
	}
	
	public Date getQnaqregdate() {
		return qnaqregdate;
	}

	public void setQnaqregdate(Date qnaqregdate) {
		this.qnaqregdate = qnaqregdate;
	}
	
	public String getQnasecret() {
		return qnasecret;
	}

	public void setQnasecret(String qnasecret) {
		this.qnasecret = qnasecret;
	}

	public String getQnaresponse() {
		return qnaresponse;
	}

	public void setQnaresponse(String qnaresponse) {
		this.qnaresponse = qnaresponse;
	}

	public String getQnaawriter() {
		return qnaawriter;
	}

	public void setQnaawriter(String qnaawriter) {
		this.qnaawriter = qnaawriter;
	}

	public String getQnaacontent() {
		return qnaacontent;
	}

	public void setQnaacontent(String qnaacontent) {
		this.qnaacontent = qnaacontent;
	}

	public Date getQnaaregdate() {
		return qnaaregdate;
	}

	public void setQnaaregdate(Date qnaaregdate) {
		this.qnaaregdate = qnaaregdate;
	}

}
