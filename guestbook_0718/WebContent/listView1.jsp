<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl 함수 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 보기</title>
</head>
<body>
<table width="800" align="center" border="1">
	<tr><th>방명록 보기</th></tr>
	<tr>
		<td align="right">
			${guest.totalCount}(${guest.currentPage}/${guest.totalPage})
		</td>
	</tr>
	<tr>
		<td>
		
		<!-- jstl로 구현하는 향상된 for -->
		<%-- <c:forEach var="변수명" items="ArrayList 객체명"> --%>
		<%--
			<c:forEach var="vo" items="${guest.guest}">
				${vo}<br/>
			</c:forEach>
		--%>
		<!-- jstl로 구현하는 일반 for, step을 생략하면 1씩 증가하고 증가치에 음수를 사용할 수 없다. -->
		<%-- <c:forEach var="변수명" begin="초기값" end="최종값" step="증가치"> --%>
		<%--
		<c:set var="list" value="${guest.guest}"/>
		<c:forEach var="i" begin="0" end="${list.size() - 1}">
			${list.get(i)}<br/>
		</c:forEach>
		--%>
		
		<!-- useBean을 이용해서 현재 컴퓨터 시스템의 날짜와 시간을 얻어온다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
		
		<c:forEach var="vo" items="${guest.guest}">
		<table width="100%" align="center" border="1" cellspacing="0">
			<tr>
				<td>
					${vo.idx}. 
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(vo.content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(vo.content, rn, '<br/>')}"/>
					${vo.name}(${vo.ip})님이 
					
					<!-- jstl로 구현하는 향상된 if, else를 사용할 수 없다. -->
					<%--
						<c:if test="${조건식}">
							조건식이 참일 경우 실행할 내용
						</c:if>
					--%>
					<!-- 오늘 입력된 글인가 판단한다. -->
					<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
					</c:if>
					
					<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
							date.date != vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
					</c:if>
					
					에 남긴글
					<input type="button" value="수정" 
						onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guest.currentPage}&job=update'">
					<input type="button" value="삭제" 
						onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guest.currentPage}&job=delete'">
					<br/>
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(content, rn, '<br/>')}"/>
					${content}
				</td>
			</tr>
		</table>
		</c:forEach>
		
		</td>
	</tr>
	<tr>
		<td align="center">
		
			<!-- startPage가 1보다 크다면 이전 10개의 페이지가 있다. -->
			<c:if test="${guest.startPage > 1}">
				<input type="button" value="start" 
						onclick="location.href='list.jsp?currentPage=1'"/>
				<input type="button" value="&lt;10" 
						onclick="location.href='list.jsp?currentPage=${guest.startPage - 1}'"/>
			</c:if>
			<c:if test="${guest.startPage <= 1}">
				<input type="button" value="start" disabled="disabled"/>
				<input type="button" value="&lt;10" disabled="disabled"/>
			</c:if>
			
			<!-- currentPage가 1보다 크다면 이전 페이지가 있다. -->
			<c:if test="${guest.currentPage > 1}">
				<input type="button" value="&lt;1" 
						onclick="location.href='list.jsp?currentPage=${guest.currentPage - 1}'"/>
			</c:if>
			<c:if test="${guest.currentPage <= 1}">
				<input type="button" value="&lt;1" disabled="disabled"/>
			</c:if>
			
			<!-- 페이지 이동 하이퍼링크 또는 버튼을 삽입한다. -->
			<c:forEach var="i" begin="${guest.startPage}" end="${guest.endPage}" step="1">
				<input type="button" value="${i}" onclick="location.href='list.jsp?currentPage=${i}'"/>
			</c:forEach>
			
			<!-- currentPage가 totalPage보다 작다면 이전 페이지가 있다. -->
			<c:if test="${guest.currentPage < guest.totalPage}">
				<input type="button" value="&gt;1" 
							onclick="location.href='list.jsp?currentPage=${guest.currentPage + 1}'"/>
			</c:if>
			<c:if test="${guest.currentPage >= guest.totalPage}">
				<input type="button" value="&gt;1" disabled="disabled"/>
			</c:if>
			
			<!-- endPage가 totalPage보다 작다면 이전 10개의 페이지가 있다. -->
			<c:if test="${guest.endPage < guest.totalPage}">
				<input type="button" value="&gt;10" 
						onclick="location.href='list.jsp?currentPage=${guest.endPage + 1}'"/>
				<input type="button" value="end" 
						onclick="location.href='list.jsp?currentPage=${guest.totalPage}'"/>
			</c:if>
			<c:if test="${guest.endPage >= guest.totalPage}">
				<input type="button" value="&gt;10" disabled="disabled"/>
				<input type="button" value="end" disabled="disabled"/>
			</c:if>
			
		</td>
	</tr>
	
	<!-- 검색어를 입력 받는 폼을 만든다 -->
	<tr>
		<td align="center">
			<form action="list.jsp" method="post"">
				<!-- 카테고리를 만든다. -->
				<select	name="category">
					<option>이름</option>
					<option>내용</option>
					<option>이름+내용</option>			
				</select>
				<input type="text" name="item">
				<input type="submit" value="검색">
			</form>
		</td>
	</tr>
	<tr>
		<td align="right">
			<input type="button" value="글쓰기" onclick="location.href='insert.jsp'"/>
		</td>
	</tr>
</table>
</body>
</html>





