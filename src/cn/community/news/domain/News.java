package cn.community.news.domain;

public class News {
	private String nid;
	private String title;
	private String image_n;
	private String content;
	private String abstracts;
	private String writer;
	private String time;
	private int orderBy;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getImage_n() {
		return image_n;
	}

	public void setImage_n(String image_n) {
		this.image_n = image_n;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAbstracts() {
		return abstracts;
	}

	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}

	@Override
	public String toString() {
		return "News [nid=" + nid + ", title=" + title + ", image_n=" + image_n
				+ ", content=" + content + ", abstracts=" + abstracts
				+ ", writer=" + writer + ", time=" + time + ", orderBy="
				+ orderBy + "]";
	}

}
