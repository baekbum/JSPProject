package kr.koreait.VO;

import java.util.Date;

public class MvcBoardVO {
	private int idx;
	private	String name;
	private	String subject;
	private	String content;
	private	int ref;
	private	int lev;
	private	int seq;
	private	int hit;
	private	Date writedate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "MvcBoardVO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", content=" + content + ", ref="
				+ ref + ", lev=" + lev + ", seq=" + seq + ", hit=" + hit + ", writedate=" + writedate + "]";
	}
	
}