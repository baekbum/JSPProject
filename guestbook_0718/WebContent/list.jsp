<%@page import="kr.koreait.Service.SelectService"%>
<%@page import="kr.koreait.VO.GuestbookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
//	이전 페이지에서 넘어오는 검색어와 카테고리를 받는다.
	String item = request.getParameter("item");
	String category = request.getParameter("category");
	
	if(item == null){
		// 검색어가 없으면 세션에 저장된 검색어와 카테고리를 읽는다.
		item = (String)session.getAttribute("item");
		category = (String)session.getAttribute("category");
	} else {
		// 검색어가 있으면 검색어를 세션에 넣어준다.
		session.setAttribute("item", item);
		session.setAttribute("category", category);
	}
	
	// 	이전 페이지에서 넘어오는 페이지 번호를 받는다.
	//	만약 이전 페이지에서 정상적인 페이지 번호가 넘어오지 않았다면 화면에는 1페이지의 글을 표시한다.
	int currentPage = 1;
	try{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (Exception e){
		
	}
	
	// 먼저 한 페이지 분량의 글을 저장할 객체를 선언한다.
	GuestbookList guest = null;
/* 	if(item == null || item.trim().length() == 0 || category == null){
//		화면에 출력할 한 페이지 분량의 글을 얻어온다.
		guest = SelectService.getInstance().selectList(currentPage);		
	} else if(category.trim().equals("내용")){
//		테이블에 저장된 전체 검색어(내용)를 포함하는 글 목록 중에서 화면에 출력할 한 페이지 분량의 글을 얻어온다.
		guest = SelectService.getInstance().selectList(currentPage, item);
	} else if(category.trim().equals("이름")){
//		테이블에 저장된 전체 검색어(이름)를 포함하는 글 목록 중에서 화면에 출력할 한 페이지 분량의 글을 얻어온다.
		guest = SelectService.getInstance().selectListName(currentPage, item);
	} else if(category.trim().equals("이름+내용")){
//		테이블에 저장된 전체 검색어(이름)를 포함하는 글 목록 중에서 화면에 출력할 한 페이지 분량의 글을 얻어온다.
		guest = SelectService.getInstance().selectListNameContent(currentPage, item);
	} */

	if(item == null || item.trim().length() == 0){
		guest = SelectService.getInstance().selectList(currentPage);
	} else {
		guest = SelectService.getInstance().selectList(currentPage, item, category);
	}
	
	// 얻어온 한 페이지 분량의 글을 request 영역에 저장한다.
	request.setAttribute("guest", guest);
	request.setAttribute("rn", "\r\n");
	// request 영역에 저장된 내용을 가지고 화명에 글을 표시하는 뷰 페이지로 이동한다.
	pageContext.forward("listView1.jsp");
%>
</body>
</html>