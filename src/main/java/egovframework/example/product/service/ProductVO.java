package egovframework.example.product.service;

import java.sql.Timestamp;

public class ProductVO {
	private int seq_No;
	
	private String imagefile;
	private String imagefile2;
	private String imagefile3;
	
	private String product_Name;
	private String product_Size;
	private String product_Color;
	private int product_Cnt;
	private int category_Fk;
	private int small_Category_Fk;
	
	private String category_Name;
	private String small_Category_Name;
	
	private Timestamp registdate;
	private Timestamp updatedate;
	
	public String getImagefile() {
		return imagefile;
	}
	public void setImagefile(String imagefile) {
		this.imagefile = imagefile;
	}
	public String getImagefile2() {
		return imagefile2;
	}
	public void setImagefile2(String imagefile2) {
		this.imagefile2 = imagefile2;
	}
	public String getImagefile3() {
		return imagefile3;
	}
	public void setImagefile3(String imagefile3) {
		this.imagefile3 = imagefile3;
	}
	public int getSeq_No() {
		return seq_No;
	}
	public void setSeq_No(int seq_No) {
		this.seq_No = seq_No;
	}
	public String getProduct_Name() {
		return product_Name;
	}
	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}
	public String getProduct_Size() {
		return product_Size;
	}
	public void setProduct_Size(String product_Size) {
		this.product_Size = product_Size;
	}
	public String getProduct_Color() {
		return product_Color;
	}
	public void setProduct_Color(String product_Color) {
		this.product_Color = product_Color;
	}
	public int getProduct_Cnt() {
		return product_Cnt;
	}
	public void setProduct_Cnt(int product_Cnt) {
		this.product_Cnt = product_Cnt;
	}
	public int getCategory_Fk() {
		return category_Fk;
	}
	public void setCategory_Fk(int category_Fk) {
		this.category_Fk = category_Fk;
	}
	public int getSmall_Category_Fk() {
		return small_Category_Fk;
	}
	public void setSmall_Category_Fk(int small_Category_Fk) {
		this.small_Category_Fk = small_Category_Fk;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	public String getCategory_Name() {
		return category_Name;
	}
	public void setCategory_Name(String category_Name) {
		this.category_Name = category_Name;
	}
	public String getSmall_Category_Name() {
		return small_Category_Name;
	}
	public void setSmall_Category_Name(String small_Category_Name) {
		this.small_Category_Name = small_Category_Name;
	}
	
	
	
}
