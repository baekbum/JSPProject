<%@page import="kr.koreait.Service.FreeboardCommentService"%>
<%@page import="kr.koreait.VO.FreeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.koreait.Service.FreeboardService"%>
<%@page import="kr.koreait.VO.FreeboardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (Exception e) { }
	
	FreeboardService service = FreeboardService.getInstance();
	FreeboardCommentService commentService = FreeboardCommentService.getInstance();
	
//	공지 글만 테이블에서 얻어와 request 객체에 저장한 후 listView.jsp로 넘겨준다.
	ArrayList<FreeboardVO> notice = service.selectNotice();
//	공지 글의 댓글 개수를 얻어와 notice 객체의 replyCount에 저장한다.
	for(FreeboardVO vo : notice) {
		vo.setReplyCount(commentService.replyCount(vo.getIdx()));
	}
	request.setAttribute("notice", notice);
	
//	화면에 출력할 페이지에 해당되는 글을 테이블에서 얻어와 request 객체에 저장한 후 listView.jsp로 넘겨준다.
	FreeboardList free = service.selectList(currentPage);
//	메인 글의 댓글 개수를 얻어와 notice 객체의 replyCount에 저장한다.
	for(FreeboardVO vo : free.getList()) {
		vo.setReplyCount(commentService.replyCount(vo.getIdx()));
	}
	request.setAttribute("free", free);
	pageContext.forward("listView.jsp");
%>
</body>
</html>