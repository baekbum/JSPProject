<%@page import="kr.koreait.Service.FreeboardCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	한글 깨짐 방지하고 FreeboardCommentVO 클래스의 멤버는 useBean으로 받고 나머지는 별도로 받는다.
	request.setCharacterEncoding("UTF-8");
	int mode = Integer.parseInt(request.getParameter("mode"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
<jsp:useBean id="vo" class="kr.koreait.VO.FreeboardCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
 	FreeboardCommentService service = FreeboardCommentService.getInstance();
//	넘겨받은 mode에 저장된 값에 따라 1은 댓글 저장, 2는 댓글 수정, 3은 댓글 삭제 작업을 실행한다.
	out.println("<script>");
	switch (mode) {
		case 1:				// 댓글 저장
			service.insertComment(vo);
			break;
		case 2:				// 댓글 수정
			if(service.updateComment(vo)) {
				out.println("alert('댓글 수정 완료')");
			} else {
				out.println("alert('비밀번호가 올바르지 않습니다.')");
			}
			break;
		case 3:				// 댓글 삭제
			if(service.deleteComment(vo)) {
				out.println("alert('댓글 삭제 완료')");
			} else {
				out.println("alert('비밀번호가 올바르지 않습니다.')");
			}
			break;
	}
	out.println("location.href='selectByIdx.jsp?idx=" + + vo.getRef() + "&currentPage=" + currentPage +
			"&job=view'");
	out.println("</script>");
//	response.sendRedirect("selectByIdx.jsp?idx=" + vo.getRef() + "&currentPage=" + currentPage + "&job=view");
%>
</body>
</html>









