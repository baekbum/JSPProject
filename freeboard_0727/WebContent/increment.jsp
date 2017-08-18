<%@page import="kr.koreait.VO.FreeboardVO"%>
<%@page import="kr.koreait.Service.FreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//	listView.jsp에서 제목의 하이퍼링크를 클릭했을 때 넘어오는 글 번호와 돌아갈 페이지 번호를 받는다.
	String tempIdx = request.getParameter("idx");
	String tempCurrentPage = request.getParameter("currentPage");
//	글 번호와 돌아갈 페이지 번호가 하나라도 null일 경우 list.jsp로 돌려보낸다.
	if(tempIdx != null && tempCurrentPage != null) {
		
//		글 번호와 돌아갈 페이지 번호가 하나라도 숫자가 아닐 경우 list.jsp로 돌려보낸다.
		try {
			
			int idx = Integer.parseInt(tempIdx);
			int currentPage = Integer.parseInt(tempCurrentPage);
			
			FreeboardService service = FreeboardService.getInstance();
//			조회수를 증가시킬 글이 존재하는가 확인하기 위해 테이블에서 글번호에 해당되는 글 한 건을 얻어온다.
			FreeboardVO vo = service.selectByIdx(idx);
//			out.println(vo + "<br/>");
//			조회수를 증가시킬 글 번호에 해당되는 글이 테이블에 존재하지 않으면 list.jsp로 돌려보낸다.
			if(vo != null) {
				
//				글 번호에 해당하는 글이 존재하므로 조회수를 증가시킨다.
				service.increment(idx);
				response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage +
						"&job=view");
				
			} else {
				out.println("<script>");
				out.println("alert('글 번호에 해당하는 글이 존재하지 않습니다.')");
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
		out.println("<script>");
		out.println("alert('글 번호 또는 페이지 번호가 null 입니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>









