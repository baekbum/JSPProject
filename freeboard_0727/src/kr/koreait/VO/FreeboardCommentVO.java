package kr.koreait.VO;

import java.util.Date;

public class FreeboardCommentVO {
	
	private int idx;				// 댓글 글 번호
	private int ref;				// 메인글 글 번호, 어떤 글의 댓글인가 기억한다.
	private String name;			// 작성자
	private String password;		// 비밀번호
	private String content;			// 내용
	private Date writeDate;			// 작성일
	private String ip;				// 작성자 IP
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getName() {
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Override
	public String toString() {
		return "FreeboardCommentList [idx=" + idx + ", ref=" + ref + ", name=" + name + ", password=" + password
				+ ", content=" + content + ", writeDate=" + writeDate + ", ip=" + ip + "]";
	}
	
}
