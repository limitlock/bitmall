<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table width="450" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left"  width="250" height="50" valign="bottom">&nbsp 옵션수 : <font color="#FF0000">${size }</font></td>
		<td align="right" width="200" height="50" valign="bottom">
			<a href="${pageContext.servletContext.contextPath }/ad/opt_new"><input type="button" value="신규입력"></a> &nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="2"></td></tr>
</table>

<table width="450" border="1" cellspacing="0" cellpadding="4"  bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="20"> 
		<td width="50"  align="center"><font color="#142712">번호</font></td>
		<td width="200" align="center"><font color="#142712">옵션명</font></td>
		<td width="100" align="center"><font color="#142712">수정/삭제</font></td>
		<td width="100" align="center"><font color="#142712">소옵션편집</font></td>
	</tr>
	<c:forEach var="vo" items="${list }" varStatus="index">
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="50"  align="center">${index.count }</td>
		<td width="200" align="left">${vo.title }</td>
		<td width="100" align="center">
		<c:choose>
			<c:when test="${vo.no == 1 }">
				<a href="#">불가</a>
			</c:when>
			<c:otherwise>	
				<a href="opt_edit?no=${vo.no }">수정</a>/
				<a href="#">삭제</a>
			</c:otherwise>
		</c:choose>
		</td>
		<c:choose>
			<c:when test="${vo.no == 1 }">
				<td width="100" align="center"><a href="#">없음</a></td>
			</c:when>
			<c:otherwise>	
				<td width="100" align="center"><a href="${pageContext.servletContext.contextPath }/ad/opts?no=${vo.no}&title=${vo.title}">소옵션편집</a></td>
			</c:otherwise>
		</c:choose>
		
	</tr>
	</c:forEach>
</table>
<br>
</div>
</body>
</html>