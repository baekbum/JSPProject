<%@page import="kr.koreait.Service.InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	한글 깨짐 방지하고 insert.jsp에서 넘어오는 내용을 받는다.
	request.setCharacterEncoding("UTF-8");
%>
<!-- GuestbookVO 클래스의 멤버 변수로 존재하는 값은 useBean으로 받고 존재하지 않는 값은 별도로 받는다. -->
<jsp:useBean id="vo" class="kr.koreait.VO.GuestbookVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	vo.setIp(request.getRemoteAddr());
//	out.println(vo + "<br/>");
//	테이블에 글을 저장하는 메소드를 실행한다.
	InsertService.getInstance().insert(vo);
//	화면에 출력할 한 페이지 분량의 글을 얻어오는 페이지로 넘겨준다.
	response.sendRedirect("list.jsp");
%>
</body>
</html>










