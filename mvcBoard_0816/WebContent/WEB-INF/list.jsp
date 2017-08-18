<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
</head>
<body>
<table width="800" align="center" border="1">
	<tr><th colspan="5">게시글 목록 보기</th></tr>
	<tr>
		<td width="80" align="center">글번호</td>
		<td width="100" align="center">이름</td>
		<td width="400" align="center">제목</td>
		<td width="140" align="center">작성일</td>
		<td width="80" align="center">조회수</td>
	</tr>
	<c:forEach var="vo" items="${list.list }">
	<tr>
		<td>${vo.idx }</td>
		<td>
			<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
			<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
			${name }
		</td>
		<td>
			<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
			<a href="increment.nhn?idx=${vo.idx}">${subject }</a>
		</td>
		<td>
			<fmt:formatDate value="${vo.writedate }" pattern="yyyy.MM.dd(E)"/>
		</td>
		<td>${vo.hit }</td>		
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5" align="right">
			<input type="button" value="글쓰기" onclick="location.href='insert.nhn'"/>
		</td>
	</tr>
</table>
</body>
</html>