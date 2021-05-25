package shopping.otheraddress.model;

public class Otheraddress {
	
	private int fid;
	private String mid;
	private String fname;
	private String zipcode;
	private String roadaddress;
	private String address1;
	private String address2;
	private String extraaddress;
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
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
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	@Override
	public String toString() {
		return "Otheraddress [fid=" + fid + ", mid=" + mid + ", fname=" + fname + ", zipcode=" + zipcode
				+ ", roadaddress=" + roadaddress + ", address1=" + address1 + ", address2=" + address2
				+ ", extraaddress=" + extraaddress + "]";
	}
	
}
