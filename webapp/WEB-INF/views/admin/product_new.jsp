<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>쇼핑몰 관리자 홈페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css"	rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.number.js"></script>
<script type="text/javascript">
$(function(){
	
	
	
	$("#price").on("keyup",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		$("#price").number(true);
	});
	
	
	$("#btn-product").click(function(e) {
				if ($("input:checkbox[name='icon']").is(":checked")) {
					$('input[name="icon"]:checked').each(function() {
						var icon = $(this).val();
						$("#icon").val(icon);
					});
				}else{
					$("#icon").val("");
				}
	
				/* 
				var optNo = $("#optNo1").val() + $("#optNo2").val();
				$("#optNo").val(optNo);
				 */

				if($("#categoryNo").val() == 0){
					alert("카테고리를 선택하세요.");
					e.preventDefault();
					return;
				 }
				 
				 if($("#optNo1").val() == 0){
					alert("'선택안함'을 선택해주세요.");
					e.preventDefault();
					return;
				 }
				 if($("#optNo2").val() == 0){
					alert("'선택안함'을 선택해주세요.");
					e.preventDefault();
					return;
				}
				 
				 if($("#discount").val() > 100){
					 alert("할인률은 100%를 넘을 수 없습니다.")
					 e.preventDefault();
					 return;
				 }
				 
				 
				 if($("#price").val()==""){
					 alert("가격을 적으세요.")
					 e.preventDefault();
					 return;
				 }
				 
				 
				 
				 

			});
});

</script>
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div align="center">
		<br>
		<jsp:include page="/WEB-INF/views/include/admin-menu.jsp" />
		<hr width='900' size='3'>
		<form id="form1" name="form1" method="post" enctype="multipart/form-data" action="${pageContext.servletContext.contextPath }/ad/product_new" >
		<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
			<tr height="23">
				<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
				<td width="700" bgcolor="#F2F2F2">
				<select id="categoryNo" name="categoryNo">
						<option value="0" selected>상품분류를 선택하세요</option>
						<c:forEach items="${category }" var="vo">
							<option value="${vo.no }">${vo.title }</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr height="23">
				<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="text" name="productCode" value="" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="text" name="title" value="" size="60" maxlength="60"></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="text" name="maker" value="" size="30" maxlength="30"></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="text" id="price" name="price"  value="" size="12" maxlength="12" style = "text-align:right;" > 원</td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
				<td width="700" bgcolor="#F2F2F2">
				<select id="optNo1" name="optNo1">
						<c:forEach items="${option }" var="vo">
							<option value="${vo.no }">${vo.title }</option>
						</c:forEach>
				</select> &nbsp; &nbsp; 
				<select id="optNo2" name="optNo2">
						<c:forEach items= "${option }" var="vo">
							<option value="${vo.no }">${vo.title }</option>
						</c:forEach>
				</select> &nbsp; &nbsp; 
		
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
				<td width="700" bgcolor="#F2F2F2">
				<textarea name="info" rows="10" cols="80"></textarea></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="radio" name="status" value="1" checked> 판매중 
				<input type="radio" name="status" value="2"> 판매중지 
				<input type="radio"	name="status" value="3"> 품절
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
				<td width="700" bgcolor="#F2F2F2">
				<input type="checkbox" name="icon" value="1"> New &nbsp;&nbsp 
				<input type="checkbox" name="icon" value="2"> Hit &nbsp;&nbsp
				<input type="checkbox" name="icon" value="3" onclick="form1.discount.disabled=!form1.discount.disabled;">Sale &nbsp;&nbsp 
				할인율 : <input type="text" id="discount" name="discount" value="0" size="3" maxlength="3" disabled> %
				<input type="hidden" id="icon"  value="">
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
				<td width="700" bgcolor="#F2F2F2">
				<b>이미지1</b>:<input type="file" id="file1" name="beforefile1" size="30" value=" " >
				<br> 
				<b>이미지2</b>:<input type="file" id="file2" name="beforefile2"  size="30" value=" ">
				<br> 
				<b>이미지3</b>:<input type="file" id="file3" name="beforefile3" size="30" value=" ">
				<br>
				</td>
			</tr>
		</table>
		<br>
		<table width="800" border="0" cellspacing="0" cellpadding="7">
			<tr>
				<td align="center">
				<input id="btn-product" type="submit" value="등록하기"> &nbsp;&nbsp 
				<a href="product"><input type="button"  value="이전화면"></a>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
