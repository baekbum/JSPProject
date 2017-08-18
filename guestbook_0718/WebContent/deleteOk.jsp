<%@page import="kr.koreait.Service.DeleteService"%>
<%@page import="kr.koreait.Service.SelectService"%>
<%@page import="kr.koreait.VO.GuestbookVO"%>
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
//	delete.jsp에서 넘어오는 삭제할 글 번호, 돌아갈 페이지 번호, 삭제하기 위해 입력한 비밀번호를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String password = request.getParameter("password");
	
	// 삭제하기 위해 입력한 비밀번호가 삭제할 글의 비밀번호와 같은가 비교해야 하므로 테이블에 저장되어 있는
	// 삭제할 글을 얻어온다.
	GuestbookVO original = SelectService.getInstance().selectByIdx(idx);
	
	// 삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호를 비교해 같으면 글을 삭제하고 목록으로 돌아가고
	// 같지 않으면 메시지를 출력하고 목록으로 돌아간다.
	if(original.getPassword().trim().equals(password.trim())){
		// 삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호가 일치하므로 테이블의 글을 삭제한다.
		DeleteService.getInstance().delete(idx);		
		
		out.println("<script>");
		out.println("alert('"+ idx + "번 글 삭제 완료')");
		out.println("location.href='list.jsp?curentPage='" + currentPage + "'");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('비밀번호가 옳바르지 않습니다.)");
		out.println("location.href='list.jsp?curentPage='" + currentPage + "'");
		out.println("</script>");
	}
%>
</body>
</html>