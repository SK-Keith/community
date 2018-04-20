package cn.community.information.domain;

public class Information {
	private String iid;
	private String title;
	private String image_i;
	private String abstracts;
	private String content;
	private String writer;
	private String time;
	private int orderBy;
	private String uid;

	public String getIid() {
		return iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage_i() {
		return image_i;
	}

	public void setImage_i(String image_i) {
		this.image_i = image_i;
	}

	public String getAbstracts() {
		return abstracts;
	}

	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Information [iid=" + iid + ", title=" + title + ", image_i="
				+ image_i + ", abstracts=" + abstracts + ", content=" + content
				+ ", writer=" + writer + ", time=" + time + ", orderBy="
				+ orderBy + ", uid=" + uid + "]";
	}

}
