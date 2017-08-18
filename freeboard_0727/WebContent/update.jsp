<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정할 글 보기</title>
</head>
<body>
<form action="updateOK.jsp" method="get">
<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="currentPage" value="${currentPage}"/>
<table width="600" align="center" border="1">
	<tr><th colspan="4">수정할 글 보기</th></tr>
	<tr>
		<td width="70">글번호</td>
		<td width="340">작성자</td>
		<td width="100">작성일</td>
		<td width="70">조회수</td>
	</tr>
	<tr>
		<td>${vo.idx}</td>
		<td>
			<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
			<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
			${name}
		</td>
		<td>
			<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
		</td>
		<td>${vo.hit}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">
			<input type="text" name="subject" value="${vo.subject}"/>
			
			공지글
			<c:if test="${fn:trim(vo.notice) == 'notice'}">
				<input type="checkbox" name="notice" checked="checked"/>
			</c:if>
			<c:if test="${fn:trim(vo.notice) != 'notice'}">
				<input type="checkbox" name="notice" value="notice"/>
			</c:if>
			
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<textarea rows="10" cols="50" name="content">${vo.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			비밀번호 <input type="password" name="password"/>
			<input type="submit" value="수정하기"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="돌아가기" 
				onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=view'"/>
				<!-- onclick="history.back()"/> -->
		</td>
	</tr>
</table>
</form>
</body>
</html>