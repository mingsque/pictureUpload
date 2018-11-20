package egovframework.example.board.service;

import java.security.Timestamp;

public class BoardPsVO {
	private int seq_no;
	private String title;
	private String content;
	private String imagefile1;
	private String imagefile2;
	private String answer;
	private String email;
	private String phonenum;
	private Timestamp registerdate;
	private Timestamp answerdate;
	private int view;
	public int getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagefile1() {
		return imagefile1;
	}
	public void setImagefile1(String imagefile1) {
		this.imagefile1 = imagefile1;
	}
	public String getImagefile2() {
		return imagefile2;
	}
	public void setImagefile2(String imagefile2) {
		this.imagefile2 = imagefile2;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public Timestamp getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}
	public Timestamp getAnswerdate() {
		return answerdate;
	}
	public void setAnswerdate(Timestamp answerdate) {
		this.answerdate = answerdate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public BoardPsVO() {
		
	}
	@Override
	public String toString() {
		return "BoardPsVO [seq_no=" + seq_no + ", title=" + title + ", content=" + content + ", imagefile1="
				+ imagefile1 + ", imagefile2=" + imagefile2 + ", answer=" + answer + ", email=" + email + ", phonenum="
				+ phonenum + ", registerdate=" + registerdate + ", answerdate=" + answerdate + ", view=" + view + "]";
	}
	
	
	
	
	
}
