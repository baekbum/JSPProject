<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 쓰기</title>

<script type="text/javascript" src="formCheck.js"></script>

</head>
<body>
<form action="insertOK.jsp" method="post" onsubmit="return formCheck(this)">
<table width="600" align="center" border="1">
	<tr><th colspan="2">방명록 쓰기</th></tr>
	<tr>
		<td width="150">이름</td>
		<td width="450"><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="repassword"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="60" name="content"></textarea>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="저장하기"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="목록으로" onclick="location.href='list.jsp'" />
		</td>
	</tr>
</table>
</form>
</body>
</html>








