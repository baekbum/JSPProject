<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제할 글 보기</title>
</head>
<body>
<form action="updateOk.jsp" method="post">
<table width="500" align="center" border="1">
	<tr><th colspan="2">삭제할 글 보기</th></tr>
	<tr>
		<td width="100">이름</td>
		<td width="400">
		
			<!-- 삭제할 글 번호와 삭제 후 돌아갈 페이지 번호를 hidden으로 숨긴다. -->
			<input type="hidden" name="idx" value="${vo.idx}" />
			<input type="hidden" name="currentPage" value="${currentPage}" />
						
			<input type="text" name="name" valuse="${fn:trim(vo.name)}" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>				
		<td>
			<textarea rows="10" cols="60" name="content">${vo.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			비밀번호 <input type="password" name="password"/>
			<input type="submit" value="삭제하기"/>
			<input type="reset" value="다시쓰기"/>
			<!-- 목록보기 버튼이 클릭되면 직전에 보던 페이지로 돌려보낸다. -->
			<input type="button" value="목록보기" 
					onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>