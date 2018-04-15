<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.servletContext.contextPath }/assets/css/pager.css" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script type="text/javascript">

	function modifyAlert(){
		alert("[회원 정보 수정]은 차후 업데이트 예정");
	}
	
	</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>


<table width="800" border="0" cellspacing="0" cellpadding="0">
	<form name="form1" method="get" action="search_user">
	<input type="hidden" name="page" value="${param.page }">
	<tr height="40">
		<td width="200" valign="bottom">&nbsp 회원수 : <font color="#FF0000">${max}</font></td>
		<td width="200">&nbsp</td>
		<td width="350" align="right" valign="bottom">
			<select name="sel1" class="combo1">
				<option value="1" >이름</option>
				<option value="2" >아이디</option>
			</select>
			<input type="text" name="search_text" size="15" value="">&nbsp
		</td>
		<td width="50" valign="bottom">
			<input type="submit" value="검색">&nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="4"></td></tr>
	</form>
</table>


<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">ID</td>
		<td width="100" align="center">이름</td>
		<td width="100" align="center">전화</td>
		<td width="100" align="center">핸드폰</td>
		<td width="200" align="center">E-Mail</td>
		<td width="100" align="center">수정/삭제</td>
	</tr>
	<c:set var="count" value="${fn:length(list) }" />
	<c:forEach var="vo" items="${list }" varStatus="status">
	
	<tr bgcolor="#F2F2F2" height="23">	
		<td width="100">&nbsp ${vo.id }</td>	
		<td width="100">&nbsp ${vo.name }</td>
		<td width="100">&nbsp ${vo.tel }</td>	
		<td width="100">&nbsp ${vo.phone }</td>	
		<td width="200">&nbsp ${vo.email }</td>	
		<td width="100" align="center">
		<a href="#" onclick="modifyAlert();">수정</a>/
		<a href="user_delete?no=${vo.no }&page=${param.page}">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="30" class="cmfont" align="center">
		<c:choose>
			<c:when test="${max == 0}">
				<c:set var="getMax" value = "${max+1 }"/>
			</c:when>
			<c:otherwise>
				<c:set var="getMax" value = "${max }"/>
			</c:otherwise>
		</c:choose>
		<fmt:parseNumber var="totalPage" value="${(((getMax-1)/5)+1)}"  integerOnly="true" />
						<c:choose>
							<c:when test="${param.page > 5 }">
								<fmt:parseNumber var="startPage"
									value="${((param.page-1)/totalPage) * totalPage + 1} " integerOnly="true" />
							</c:when>
							<c:otherwise>
								<fmt:parseNumber var="startPage"
									value="${((1-1)/totalPage) * totalPage + 1} " integerOnly="true" />
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${endPage > totalPage }">
								<fmt:parseNumber var="endPage" value="${((startPage + totalPage ) -1) } " integerOnly="true" />
							</c:when>
							<c:otherwise>
								<fmt:parseNumber var="endPage" value="${totalPage}" integerOnly="true" />
							</c:otherwise>
						</c:choose>
						<div id="underpoint" class="pager">
						<ul>
						<c:choose>
							<c:when test="${startPage <= param.page && param.page != 1}">
								<a href="member?page=${(param.page-1) }" ><img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
								</a>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${startPage }" end="${startPage+4}" step="1" var="i" varStatus="status">
						
							<c:choose>
								<c:when test="${totalPage >= i }">	
									<c:choose>
										<c:when test="${param.page == i }">
											<li><font color="red">[${i }]</font></li>
										</c:when>
										<c:otherwise>
											<li><a href="member?page=${i }">[${i }]</a></li>
										</c:otherwise>
									</c:choose>				
								</c:when>
								<c:otherwise>
									<li><font color="#cdcdcd">[${i }]</font></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${totalPage > param.page  }">
								<a href="member?page=${(param.page+1) }"><img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
								</a>
							</c:when>
							<c:when test="${totalPage <= param.page }">
									<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
							</c:when>
						</c:choose>
						</ul>
				</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>