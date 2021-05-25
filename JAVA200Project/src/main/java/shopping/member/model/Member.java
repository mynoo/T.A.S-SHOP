package shopping.member.model;

public class Member {
	private String id;
	private String name;
	private String password;
	private String email;
	private String gender;
	private String zipcode;
	private String roadaddress;
	private String address1;
	private String address2;
	private String extraaddress;
	private String birth;
	private String phonenumber;
	
	public String getPhonenumber() {
		if(phonenumber == null)
		{
			this.phonenumber = "";
		}
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getId() {
	return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		if(name == null)
		{
			this.name = "";
		}
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", gender="
				+ gender + ", zipcode=" + zipcode + ", roadaddress=" + roadaddress + ", address1=" + address1
				+ ", address2=" + address2 + ", extraaddress=" + extraaddress + ", birth=" + birth + ", point=" 
				+ ", phonenumber=" + phonenumber + "]";
	}
}