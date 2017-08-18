<%@page import="kr.koreait.Service.FreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 한글 깨짐 방지하고 insert.jsp에서 넘어오는 내용을 받는다. -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="kr.koreait.VO.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
//	폼에 저장되서 넘어오지 않는 접속자 ip는 별도로 받는다.
	vo.setIp(request.getRemoteAddr());
//	insert.jsp에서 넘겨받은 내용을 테이블에 저장한 후 list.jsp로 넘겨준다.
	FreeboardService.getInstance().insert(vo);
	response.sendRedirect("list.jsp");
%>
</body>
</html>