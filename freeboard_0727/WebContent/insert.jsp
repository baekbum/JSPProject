<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유 게시판 글 쓰기</title>
</head>
<body>
<form action="insertOK.jsp" method="post">
<table width="500" align="center" border="1">
	<tr><th colspan="3">자유 게시판 글 쓰기</th></tr>
	<tr>
		<td width="100">이름</td>
		<td width="320"><input type="text" name="name"/></td>
		<td width="80">공지글<input type="checkbox" name="notice" value="notice"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td colspan="2"><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="2"><input type="text" name="subject"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="2"><textarea rows="10" cols="50" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" value="저장하기"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="목록보기" onclick="location.href='list.jsp'"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>











