<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.koreait.VO.GuestbookVO"%>
<%@page import="java.util.ArrayList"%>
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
	// list.jsp에서 request 영역에 저장되어 넘어오는 한 페이지 분량의 글과 페이지 작업에 사용되는 8개의 변수가
	// 저장된 내용을 받는다. ==> Object 클래스 타입으로 넘어오므로 반드시 형변환을 시켜야한다.
	GuestbookList guest = (GuestbookList)request.getAttribute("guest");
	// 한 페이지 분량의 글을 얻어온다.
	ArrayList<GuestbookVO> list = guest.getGuest();
%>
<table width="800" align="center" border="1">
	<tr><th>방명록 보기</th></tr>
	<tr>
		<td align="right">
			<%=guest.getTotalCount() %>(<%=guest.getCurrentPage() %>/<%=guest.getTotalPage() %>)
		</td>
	</tr>
	<tr>
		<td>
	<%
	// guest.getPageSize() 까지 반복을 시키면 마지막 페이지의 글 목록을 출력하려 할 경우 예외가 발생된다.
	// 출력할 내용이 저장된 ArrayList에 저장된 데이터 개수 만큼 반복시킨다.
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY.MM.dd(E)");
		for(int i=0; i<list.size(); i++){
			// 화면에 출력할 글 한 건을 얻어온다.
			GuestbookVO vo = list.get(i);
			%>
				<table width="100%" align="center" border="1" cellspacing="0">	
					<tr>
						<td>
							<%=vo.getIdx() %>. <%=vo.getName() %>(<%=vo.getIp() %>)님이 <%=sdf.format(vo.getWriteDate()) %>에 남긴 글<br/>
							<!-- 태그 사용 가능, 줄바꿈 불가능  -->
							<%-- <%=vo.getContent() %> --%>
							
							<!-- 태그 사용 불가능, 줄바꿈 불가능  -->
							<%-- <%=vo.getContent().replace("<", "&lt;").replace(">", "&gt;") %> --%>
							
							<!-- 태그 사용 불가능, 줄바꿈 가능  -->
							<!-- replace("\r\n", "<br/>")를 반드시 맨 뒤에 적어야 한다.-->
							<%=vo.getContent().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br/>") %>
							
							
						</td>
					</tr>				
				</table>
			<%
		}
	%>
		</td>
	</tr>
	<tr>
		<td align="right"> 
			<input type="button" value="글쓰기" onclick="location.href='insert.jsp'" />
		</td>
	</tr>
</table>
</body>
</html>