<%@page import="kr.koreait.Service.SelectService"%>
<%@page import="kr.koreait.VO.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	listView1.jsp에서 넘어오는 수정 또는 삭제할 글 번호, 돌아갈 페이지 번호, job을 받는다.
	String tempIdx = request.getParameter("idx");
	String tempCurrentPage = request.getParameter("currentPage");
	String job = request.getParameter("job");
	
//	글 번호와 돌아갈 페이지 번호가 정상적으로 넘어왔나(null이 아닌가) 검사한다.
	if(tempIdx != null && tempCurrentPage != null) {
		
//		글 번호와 돌아갈 페이지 번호가 정상적인 숫자가 넘어왔나 검사한다.
		try {
			
			int idx = Integer.parseInt(tempIdx);
			int currentPage = Integer.parseInt(tempCurrentPage);
			
//			테이블에서 글 번호에 해당되는 글 한 건을 얻어온다.
			GuestbookVO original = SelectService.getInstance().selectByIdx(idx);
			out.println(original + "<br/>");
//			글 번호에 해당하는 글이 테이블에 있는가 검사한다.
			if(original != null) {
				
//				테이블에서 얻어온 글을 request 영역에 저장하고 클릭한 버튼이 실행할 페이지로 넘겨준다.
				request.setAttribute("vo", original);				// 화면에 출력할 수정 또는 삭제 할 글
				request.setAttribute("currentPage", currentPage);	// 수정 또는 삭제 후 돌아갈 페이지 번호
				request.setAttribute("rn", "\r\n");					// 줄바꿈에 사용할 이스케이프 시퀀스
				
				pageContext.forward(job + ".jsp");
				
			} else {
				out.println("<script>");
				out.println("alert('해당 글 번호의 글이 테이블에 존재하지 않습니다.')");
				out.println("location.href='list.jsp'");
				out.println("</script>");
			}
		} catch (Exception e) {
			out.println("<script>");
			out.println("alert('글 번호 또는 페이지 번호가 숫자가 아닙니다.')");
			out.println("location.href='list.jsp'");
			out.println("</script>");
		}
	} else {
//		글 번호와 페이지 번호가 정상적으로 넘어오지 않았으면 메시지를 출력하고 list.jsp로 보낸다.
		out.println("<script>");
		out.println("alert('글 번호 또는 페이지 번호가 넘어오지 않았습니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>