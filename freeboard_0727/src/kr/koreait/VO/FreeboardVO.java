package kr.koreait.VO;

import java.util.Date;

public class FreeboardVO {

	private int idx;				// 메인 글 번호
	private String name;			// 작성자
	private String password;		// 비밀번호
	private String subject;			// 제목
	private String content;			// 내용
	private int hit;				// 조회수
	private Date writeDate;			// 작성일
	private String ip;				// 작성자 IP
	private String notice = "";		// 공지글
	private int replyCount;			// 댓글의 개수
	
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "FreeboardVO [idx=" + idx + ", name=" + name + ", password=" + password + ", subject=" + subject
				+ ", content=" + content + ", hit=" + hit + ", writeDate=" + writeDate + ", ip=" + ip + ", notice="
				+ notice + "]";
	}
	
}
