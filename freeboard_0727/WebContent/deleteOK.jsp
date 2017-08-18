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
//	delete.jsp에서 넘어오는 삭제할 글 번호, 돌아갈 페이지 번호, 삭제하기 위해 입력한 비밀번호를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String password = request.getParameter("password");
	
//	삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호를 비교하기 위해 테이블에서 삭제할 글을 얻어온다.
	FreeboardVO original = FreeboardService.getInstance().selectByIdx(idx);

//	삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호를 비교해 같으면 글을 삭제한다.
	out.println("<script>");
	if(original.getPassword().trim().equals(password.trim())) {
		
		FreeboardService.getInstance().delete(idx);
		
		out.println("alert('" + idx + "번 글 삭제완료')");
	} else {
		out.println("alert('비밀번호가 올바르지 않습니다.')");
	}
	out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>
</body>
</html>




