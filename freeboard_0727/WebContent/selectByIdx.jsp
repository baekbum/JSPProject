<%@page import="kr.koreait.VO.FreeboardCommentVO"%>
<%@page import="kr.koreait.Service.FreeboardCommentService"%>
<%@page import="kr.koreait.VO.FreeboardCommentList"%>
<%@page import="kr.koreait.Service.FreeboardService"%>
<%@page import="kr.koreait.VO.FreeboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	이전 페이지에서 넘어오는 글 번호, 돌아갈 페이지 번호, job을 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job");
	
//	넘겨받은 글번호에 해당되는 글 한 건을 얻어온다.
	FreeboardVO vo = FreeboardService.getInstance().selectByIdx(idx);

//	얻어온 글, 돌아갈 페이지 번호, 줄바꿈에 사용할 "\r\n"을 request 영역에 저장하고 view.jsp로 넘겨준다.
	request.setAttribute("vo", vo);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("rn", "\r\n");
	
//	얻어온 글의 댓글을 얻어와 request 영역에 저장하고 view.jsp로 넘겨준다.
	FreeboardCommentList commentList = FreeboardCommentService.getInstance().selectCommentList(idx);
	request.setAttribute("commentList", commentList);
	
	pageContext.forward(job + ".jsp");
%>
</body>
</html>




