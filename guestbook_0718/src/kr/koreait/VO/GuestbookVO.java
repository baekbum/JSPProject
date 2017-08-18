package kr.koreait.VO;

import java.util.Date;

//	게시글 1건을 저장할 클래스
public class GuestbookVO {

	private int idx;			// 글번호
	private String name;		// 작성자
	private String password;	// 비밀번호
	private String content;		// 내용
	private Date writeDate;		// 작성일
	private String ip;			// 접속자 IP
	
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
		return "GuestbookVO [idx=" + idx + ", name=" + name + ", password=" + password + ", content=" + content
				+ ", writeDate=" + writeDate + ", ip=" + ip + "]";
	}
	
}
