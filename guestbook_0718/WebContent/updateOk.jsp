<%@page import="kr.koreait.Service.UpdateService"%>
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
	request.setCharacterEncoding("UTF-8");
%>
	<!-- update.jsp에서 넘어오는 내용 중에서 GuestbookVO 클래스에 멤버 변수로 존재하는 값은 useBean으로 받는다.	-->
	<jsp:useBean id="vo" class=kr.koreait.VO.GuestbookVO>
		<jsp:setProperty property="*" name="vo" />
	</jsp:useBean>
<%
	// update.jsp에서 넘어오는 내용 중에서 GuestbookVO 클래스에 멤버 변수로 존재하지 않는 값은 별도로 받는다.
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	// 수정하기 위해 입력한 비밀번호가 수정할 글의 비밀번호와 같은가 비교해야 하므로 테이블에 저장되어 있는
	// 수정할 글을 얻어온다.
	GuestbookVO original = SelectService.getInstance().selectByIdx(vo.getIdx());
	
	// 수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교해 같으면 글을 수정하고 목록으로 돌아가고
	// 같지 않으면 메시지를 출력하고 목록으로 돌아간다.
	if(original.getPassword().trim().equals(vo.getPassword().trim())){
		// 수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호가 일치하므로 테이블의 글을 수정한다.		
		UpdateService.getInstance().update(vo);
		
		out.println("<script>");
		out.println("alert('"+ vo.getIdx() + "번 글 수정 완료')");
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