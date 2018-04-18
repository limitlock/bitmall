<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/search.jsp"/>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="20"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title1.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td colspan="5" height="3" bgcolor="#0066CC"></td></tr>
				<tr bgcolor="F2F2F2">
					<td width="80" height="30" align="center">주문일</td>
					<td width="100"  align="center">주문번호</td>
					<td width="290" align="center">제품명</td>
					<td width="100" align="center">금액</td>
					<td width="115" align="center">주문상태</td>
				</tr>
				<tr><td colspan="5" bgcolor="DEDCDD"></td></tr>

				<c:forEach items="${list }" var="vo">
					<tr>
						<td height="30" align="center"><font color="686868">2007-01-02</font></td>
						<td align="center">
							<a href="jumun_info?orderNo=${vo.orderNo }"><font color="#0066CC">${vo.orderNo }</font></a>
						</td>
						<c:choose>
						<c:when test="${vo.count > 1 }">
						<td align="right"><font color="686868">${vo.productTitle } (외 ${vo.count -1 })</font></td>					
						</c:when>
						<c:otherwise>
						<td align="right"><font color="686868">${vo.productTitle }</font></td>
						</c:otherwise>
						</c:choose>
						
						<td align="right"><font color="686868"><fmt:formatNumber value="${vo.price }" pattern="#,###" /> 원</font></td>
						<c:choose>
			    			<c:when test="${vo.statusNo == 1 }">
				    			<td align="center"><font color="#0066CC">주문신청</font></td>
			    			</c:when>
			    			<c:when test="${vo.statusNo == 2 }">
				    			<td align="center"><font color="#0066CC">주문확인</font></td>
			    			</c:when>
			    			<c:when test="${vo.statusNo == 3 }">
				    			<td align="center"><font color="#0066CC">입금확인</font></td>
			    			</c:when>
			    			<c:when test="${vo.statusNo == 4 }">
			    				<td align="center"><font color="#0066CC">배송중</font></td>
			    			</c:when>
			    			<c:when test="${vo.statusNo == 5 }">
			    				<td align="center"><font color="#686868">주문완료</font></td>
			    			</c:when>
			    			<c:otherwise>
			    				<td align="center"><font color="#D06404">주문취소</font></td>
			    			</c:otherwise>
			    		</c:choose>
						
					</tr>
					<tr><td colspan="5" background="${pageContext.servletContext.contextPath }/assets/images/line_dot.gif"></td></tr>
				</c:forEach>
				

			</table>
			<br>
		
<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	
		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>