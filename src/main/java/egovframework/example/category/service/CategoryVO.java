package egovframework.example.category.service;

import java.sql.Timestamp;

public class CategoryVO {
	private int seq_No;
	private String category_Name;
	private Timestamp regist_Date;
	private Timestamp change_Date;
	private String is_Used;
	private int sno;
	private int category_Fk;
	private String parent_Name;
	
	public CategoryVO(){
		seq_No 		  = 0;
		category_Name = "";
		parent_Name	  = "";
		is_Used		  = "";
		sno			  = 0;
		category_Fk	  = 0;
	}
	
	public int getSeq_No() {
		return seq_No;
	}
	public void setSeq_No(int seq_No) {
		this.seq_No = seq_No;
	}
	public String getCategory_Name() {
		return category_Name;
	}
	public void setCategory_Name(String category_Name) {
		this.category_Name = category_Name;
	}
	public Timestamp getRegist_Date() {
		return regist_Date;
	}
	public void setRegist_Date(Timestamp regist_Date) {
		this.regist_Date = regist_Date;
	}
	public Timestamp getChange_Date() {
		return change_Date;
	}
	public void setChange_Date(Timestamp change_Date) {
		this.change_Date = change_Date;
	}
	public String getIs_Used() {
		return is_Used;
	}
	public void setIs_Used(String is_Used) {
		this.is_Used = is_Used;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getCategory_Fk() {
		return category_Fk;
	}

	public void setCategory_Fk(int category_Fk) {
		this.category_Fk = category_Fk;
	}

	public String getParent_Name() {
		return parent_Name;
	}

	public void setParent_Name(String parent_Name) {
		this.parent_Name = parent_Name;
	}
	
	
}
