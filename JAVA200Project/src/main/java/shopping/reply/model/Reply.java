package shopping.reply.model;

public class Reply {
	private int rno ;
	private int groupno ;
	private String mid;
	private String comments;
	private String redate;
	
	public Reply() {}
	
	
	public Reply(int rno, int groupno, String mid, String comments, String redate) {
		super();
		this.rno = rno;
		this.groupno = groupno;
		this.mid = mid;
		this.comments = comments;
		this.redate = redate;
	}


	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getcomments() {
		return comments;
	}

	public void setcomments(String comments) {
		this.comments = comments;
	}

	public String getredate() {
		return redate;
	}

	public void setredate(String redate) {
		this.redate = redate;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", groupno=" + groupno + ", mid=" + mid + ", comments=" + comments + ", redate=" + redate
				+ "]";
	}

	
	
}
