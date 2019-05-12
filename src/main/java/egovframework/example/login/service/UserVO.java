package egovframework.example.login.service;

public class UserVO {

	private String id;
	private String password;
	private String name;
	private String e_mail;
	private String phone_number;
	private String sex;
	private String address;
	private String address_detail;
	private String post_number;
	private String comment;
	private String profile_picture;
	
	public UserVO() {
		this.id 			= "";
		this.password 		= "";
		this.name 			= "";
		this.e_mail 		= "";
		this.phone_number 	= "";
		this.sex 			= "";
		this.address 		= "";
		this.address_detail = "";
		this.post_number 	= "";
		this.comment		= "";
		this.profile_picture= "";	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", e_mail=" + e_mail
				+ ", phone_number=" + phone_number + ", sex=" + sex + ", address=" + address + ", address_detail="
				+ address_detail + ", post_number=" + post_number + ", comment=" + comment + ", profile_picture="
				+ profile_picture + "]";
	}

	public String getProfile_picture() {
		return profile_picture;
	}

	public void setProfile_picture(String profile_picture) {
		this.profile_picture = profile_picture;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getId() {
		return id;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public String getPost_number() {
		return post_number;
	}

	public void setPost_number(String post_number) {
		this.post_number = post_number;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

		
}
