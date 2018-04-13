<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script type="text/javascript">
	</script>
	
	
	
	<style type="text/css">
		
		div.pager {
			width:100%;
			text-align:center;
		}
		div.pager  ul {
			height:20px;
			margin:10px auto;
		}
		div.pager  ul li 		  { display:inline-block; margin:5px 0; width:20px ; font-weight:bold; color:#ddd }
		div.pager  ul li.selected { text-decoration: underline; color:#f40808 }
		div.pager  ul li a,
		div.pager  ul li a:visited,
		div.pager  ul li a:link,
		div.pager  ul li a:active { text-decoration: none; color:#555 }
		div.pager  ul li a:hover { text-decoration: none; color:#f00 }
	
	</style>
</head>
<div align="center">
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form name="form1" method="get" action="search_product">
<input type="hidden" name="page" value="1">
<table width="800" border="0" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td align="left"  width="150" valign="bottom">&nbsp 제품수 : <font color="#FF0000">${max }</font></td>
		<td align="right" width="550" valign="bottom">
			<select name="sel1">
				<option value="0" >상품상태</option>
				<option value="1" >판매중</option>
				<option value="2" >판매중지</option>
				<option value="3" >품절</option>
			</select> &nbsp 
			<select name="sel2">
				<option value="0" >아이콘선택</option>
				<option value="1" >New</option>
				<option value="2" >Hit</option>
				<option value="3" >Sale</option>
			</select> &nbsp 
			<select name="sel3">
				<option value="0" >분류선택</option>
				<option value="1" >아우터</option>
				<option value="2" >상의</option>
				<option value="3" >하의</option>
			</select> &nbsp 
			<select name="sel4">
				<option value="1" selected>제품이름</option>
				<option value="2" >제품번호</option>
			</select>
			<input type="text" name="search_text" size="10" value="">&nbsp
		</td>
		<td align="left" width="120" valign="bottom">
			<input type="submit" value="검색">
			&nbsp;
			<a href="${pageContext.servletContext.contextPath }/ad/product_new"><input type="button" value="새상품"></a>
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form>

<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">제품분류</td>
		<td width="100" align="center">제품코드</td>
		<td width="280" align="center">제품명</td>
		<td width="70"  align="center">판매가</td>
		<td width="50"  align="center">상태</td>
		<td width="120" align="center">이벤트</td>
		<td width="80"  align="center">수정/삭제</td>
	</tr>
	<c:forEach items="${product }" var="vo">
		<tr bgcolor="#F2F2F2" height="23">	
		<c:choose>
				<c:when test="${vo.categoryNo == 1}">
						<td width="50" align="center">아우터</td>
				</c:when>
				<c:when test="${vo.categoryNo == 2}">
						<td width="50" align="center">상의</td>
				</c:when>
				<c:when test="${vo.categoryNo == 3}">
						<td width="50" align="center">하의</td>
				</c:when>
		</c:choose>
		<td width="100">${vo.productCode }</td>
		<td width="280">${vo.title }</td>	
		<td width="70"  align="right">${vo.price }</td>
						<c:choose>
							<c:when test="${vo.status == 1}">
								<td width="50" align="center">판매중</td>
							</c:when>
							<c:when test="${vo.status == 2}">
								<td width="50" align="center">판매중지</td>
							</c:when>
							<c:when test="${vo.status == 3}">
								<td width="50" align="center">품절</td>
							</c:when>
						</c:choose>
						
						<c:set var="array" value="${ fn:split(vo.icon, ',') }" />
						<c:set var="count" value="${fn:length(array) }"/>
					
						<c:choose>
							<c:when test="${count > 2 }">
								<td width="120" align="center">New Hit Sale(${vo.discount}%)</td>	
							</c:when>
						
							<c:when test="${count > 1 }">
								<c:choose>
								<c:when test="${array[0] == 1 and array[1] == 2}">
									<td width="120" align="center">New Hit</td>	
								</c:when>
								<c:when test="${array[0] == 2 and array[1] == 3}">
									<td width="120" align="center">Hit Sale(${vo.discount}%)</td>	
								</c:when>
								<c:when test="${array[0] == 1 and array[1] == 3}">
									<td width="120" align="center">New Sale(${vo.discount}%)</td>	
								</c:when>
								<c:otherwise>
								<td width="120" align="center">${array[0] }${array[1] }${array[2] }</td>	 
								</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>			
								<c:when test="${array[0] == 1}">
								<td width="120" align="center">New</td>	 
								</c:when>
								<c:when test="${array[0] == 2 }">
								<td width="120" align="center">Hit</td>	
								</c:when>
								<c:when test="${array[0] == 3 }">
								<td width="120" align="center">Sale(${vo.discount}%)</td>	
								</c:when>
								<c:otherwise>
								<td width="120" align="center"></td>	 
								</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
			<td width="80"  align="center">
			<a href="product_edit?no=${vo.no }">수정</a>/
			<a href="product_delete?no=${vo.no }&page=${param.page}" id="btn-product_delete">삭제</a>
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
								<a href="product?page=${(param.page-1) }" ><img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
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
											<li><a href="product?page=${i }">[${i }]</a></li>
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
								<a href="product?page=${(param.page+1) }"><img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
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