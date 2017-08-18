<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setting(mode, idx, title, name, content) {
		f = document.commentForm;
		f.mode.value = mode;
		f.idx.value = idx;
		f.commentBtn.value = title;
		f.name.value = name;
		
//		content로 넘겨받은 내용에 더 이상 '<br/>'이 없을 때 까지 반복한다.
		while(content.indexOf("<br/>") != -1) {
			content = content.replace("<br/>", "\r\n");
		}
		
		f.content.value = content;
	}
</script>
</head>
<body>
<table width="600" align="center" border="1">
	<tr><th colspan="4">게시글 보기</th></tr>
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
			<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
			<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
			${subject}
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, rn, '<br/>')}"/>
			${content}
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="button" value="수정하기" 
				onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"/>
			<input type="button" value="삭제하기" 
				onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"/>
			<input type="button" value="목록보기" 
				onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
		</td>
	</tr>
</table><br/>
<!-- 여기 부터 댓글 입력 폼 -->
<form action="commentOK.jsp" method="get" name="commentForm">

<input type="hidden" name="idx" value="${vo.idx}"/>
<input type="hidden" name="ref" value="${vo.idx}"/>
<input type="hidden" name="mode" value="1"/>
<input type="hidden" name="currentPage" value="${currentPage}"/>
<input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>

<table width="600" align="center" border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"/></td>
		<td>비밀번호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<textarea rows="5" cols="50" name="content"></textarea>
			<input type="submit" value="댓글저장" name="commentBtn"/>
			<input type="button" value="다시쓰기" onclick="setting(1, 0, '댓글저장', '', '')"/>
		</td>
	</tr>
	
	<c:if test="${commentList.list.size() == 0}">
	<tr>
		<td colspan="4" align="center">
			댓글이 존재하지 않습니다.
		</td>
	</tr>
	</c:if>
	
	<c:if test="${commentList.list.size() != 0}">
	<c:forEach var="comment" items="${commentList.list}">
	<tr>
		<td colspan="4">
			${comment.name}님(${comment.ip})이 
			<fmt:formatDate value="${comment.writeDate}" pattern="yyyy.MM.dd(E)"/>에 남긴글
			<c:set var="content" value="${fn:replace(comment.content, '<', '&lt;')}"/>
			<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
			<c:set var="content" value="${fn:replace(content, rn, '<br/>')}"/>
			<!-- "\r\n"를 자바스크립트의 인수로 넘길 수 없으므로 "\r\n"를 "<br/>"로 바꿔서 넘긴다. -->
			<input type="button" value="댓글수정" 
				onclick="setting(2, ${comment.idx}, '댓글수정', '${comment.name}', '${content}')"/>
			<input type="button" value="댓글삭제" 
				onclick="setting(3, ${comment.idx}, '댓글삭제', '${comment.name}', '${content}')"/>
			<br/>
			${content}
		</td>
	</tr>
	</c:forEach>
	</c:if>	
</table>
</form>
</body>
</html>






