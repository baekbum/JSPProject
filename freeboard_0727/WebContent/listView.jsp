<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 보기</title>
</head>
<body>
<table width="800" align="center" border="1">
	<tr><th colspan="5">게시판 보기</th></tr>
	<tr>
		<td align="right" colspan="5">
			${free.totalCount}(${free.currentPage}/${free.totalPage}Page)
		</td>
	</tr>
	<tr>
		<td align="center" width="80">글번호</td>
		<td align="center" width="100">이름</td>
		<td align="center" width="420">제목</td>
		<td align="center" width="120">작성일</td>
		<td align="center" width="80">조회수</td>
	</tr>
	<jsp:useBean id="date" class="java.util.Date"/>
	
	<c:forEach var="vo" items="${notice}">
	<tr bgcolor="yellow">
		<td><img src="./images/notice.png"></td>
		<td>
			<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
			<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
			${name}
		</td>
		<td>
			<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
			<a href="increment.jsp?idx=${vo.idx}&currentPage=${free.currentPage}">${subject}</a>
			(${vo.replyCount})
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
					date.date == vo.writeDate.date}">
				<img src="./images/new.png"/>
			</c:if>
			<c:if test="${vo.hit >= 10}">
				<img src="./images/hot.gif"/>
			</c:if>
		</td>
		<td>
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
					date.date == vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="HH:mm"/> 
			</c:if>
			<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
					date.date != vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/> 
			</c:if>
		</td>
		<td>${vo.hit}</td>
	</tr>
	</c:forEach>
	
	<c:set var="no" value="${free.totalCount - (free.currentPage - 1) * free.pageSize}"/>
	
	<c:forEach var="vo" items="${free.list}">
	<tr>
		<td><%-- ${vo.idx}, --%>${no}</td>
		<c:set var="no" value="${no - 1}"/>
		<td>
			<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
			<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
			${name}
		</td>
		<td>
			<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
			<a href="increment.jsp?idx=${vo.idx}&currentPage=${free.currentPage}">${subject}</a>
			(${vo.replyCount})
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
					date.date == vo.writeDate.date}">
				<img src="./images/new.png"/>
			</c:if>
			<c:if test="${vo.hit >= 10}">
				<img src="./images/hot.gif"/>
			</c:if>
		</td>
		<td>
			<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
					date.date == vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="HH:mm"/> 
			</c:if>
			<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
					date.date != vo.writeDate.date}">
				<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/> 
			</c:if>
		</td>
		<td>${vo.hit}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5" align="center">
			<c:if test="${free.startPage > 1}">
				<input type="button" value="start" 
						onclick="location.href='list.jsp?currentPage=1'"/>
				<input type="button" value="&lt;10" 
						onclick="location.href='list.jsp?currentPage=${free.startPage - 1}'"/>
			</c:if>
			<c:if test="${free.startPage <= 1}">
				<input type="button" value="start" disabled="disabled"/>
				<input type="button" value="&lt;10" disabled="disabled"/>
			</c:if>
			<c:if test="${free.currentPage > 1}">
				<input type="button" value="&lt;1" 
						onclick="location.href='list.jsp?currentPage=${free.currentPage - 1}'"/>
			</c:if>
			<c:if test="${free.currentPage <= 1}">
				<input type="button" value="&lt;1" disabled="disabled"/>
			</c:if>
		
			<c:forEach var="i" begin="${free.startPage}" end="${free.endPage}" step="1">
				<input type="button" value="${i}" onclick="location.href='list.jsp?currentPage=${i}'"/>
			</c:forEach>
			
			<c:if test="${free.currentPage < free.totalPage}">
				<input type="button" value="&gt;1" 
							onclick="location.href='list.jsp?currentPage=${free.currentPage + 1}'"/>
			</c:if>
			<c:if test="${free.currentPage >= free.totalPage}">
				<input type="button" value="&gt;1" disabled="disabled"/>
			</c:if>
			<c:if test="${free.endPage < free.totalPage}">
				<input type="button" value="&gt;10" 
						onclick="location.href='list.jsp?currentPage=${free.endPage + 1}'"/>
				<input type="button" value="end" 
						onclick="location.href='list.jsp?currentPage=${free.totalPage}'"/>
			</c:if>
			<c:if test="${free.endPage >= free.totalPage}">
				<input type="button" value="&gt;10" disabled="disabled"/>
				<input type="button" value="end" disabled="disabled"/>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td align="right" colspan="5">
			<input type="button" value="글쓰기" onclick="location.href='insert.jsp'"/>
		</td>
	</tr>
	
</table>
</body>
</html>






