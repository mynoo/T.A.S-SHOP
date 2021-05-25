package shopping.review.model;

public class Review {
	private int vnum;
	private int pno;
	private String mid;
	private String vcomment;
	private String inputdate;
	public int getVnum() {
		return vnum;
	}
	public void setVnum(int vnum) {
		this.vnum = vnum;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getVcomment() {
		return vcomment;
	}
	public void setVcomment(String vcomment) {
		this.vcomment = vcomment;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	@Override
	public String toString() {
		return "Review [vnum=" + vnum + ", pno=" + pno + ", mid=" + mid + ", vcomment=" + vcomment + ", inputdate="
				+ inputdate + "]";
	}
	
	
	
	
	
	
}
