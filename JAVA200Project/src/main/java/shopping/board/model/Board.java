package shopping.board.model;

public class Board {
	private int bno ;
	private String writer;
	private String title;
	private String bcontents;
	private String writedate;
	private int depth;
	
	
	
	public Board(int bno, String writer, String title, String bcontents, String writedate, int depth) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.bcontents = bcontents;
		this.writedate = writedate;
		this.depth = depth;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Board() {}
	
	@Override
	public String toString() {
		return "Board [bno=" + bno + ", writer=" + writer + ", title=" + title + ", bcontents=" + bcontents
				+ ", writedate=" + writedate + ", depth=" + depth + "]";
	}
	
	
	
	
	
	
	
}
