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
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.number.js"></script>
<script type="text/javascript">
$(function(){

	$("#price").on("keyup",function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		$("#price").number(true);
	});
	
	
	$("#btn-product-edit").click(function(e){
		if($("input:checkbox[name='checkno1']").is(":checked")){
			$("#imagename1").val("");
		}else if($("input:checkbox[name='checkno2']").is(":checked")){
			$("#imagename2").val("");
		}else if($("input:checkbox[name='checkno3']").is(":checked")){
			$("#imagename3").val("");
		}else{
		}
		
		
		
		
		
		if ($("input:checkbox[name='icon']").is(":checked")) {
			$('input[name="icon"]:checked').each(function() {
				var icon = $(this).val();
				$("#icon").val(icon);
			});
		}else{
			$("#icon").val("");
		}
		
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
		
		var regDate = $("#regday1").val() +"-"+ $("#regday2").val()+"-" +$("#regday3").val();
		$("#regDate").val(regDate);
		
		
		
		
	});
	
	
	
	
});
</script>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="center">
<br>
<jsp:include page="/WEB-INF/views/include/admin-menu.jsp"/>
<hr width='900' size='3'>

<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<form name="form1" method="post" action="${pageContext.servletContext.contextPath }/ad/product_edit" enctype="multipart/form-data">
<c:forEach items="${product }" var="item">
<input type="hidden" id="no" name="no" value="${item.no }"/>
<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
    	<td width="700" bgcolor="#F2F2F2">
			<select id="categoryNo" name="categoryNo">
				<c:forEach items="${category }" var="vo">
					<c:choose>
						<c:when test="${item.categoryNo == vo.no }">
							<option value="${vo.no }" selected>${vo.title }</option>
						</c:when>
						<c:otherwise>
							<option value="${vo.no }">${vo.title }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr height="23"> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품코드</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="productCode" value="${item.productCode }" size="20" maxlength="20">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="title" value="${item.title }" size="60" maxlength="60">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제조사</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" name="maker" value="${item.maker }" size="30" maxlength="30">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
		<td width="700"  bgcolor="#F2F2F2">
			<input type="text" id="price" name="price" value="${item.price }" size="12" maxlength="12"> 원
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">옵션</td>
    <td width="700"  bgcolor="#F2F2F2">
			<select id="optNo1" name="optNo1">
					<c:forEach items="${option }" var="vo">
						<c:choose>
							<c:when test="${item.optNo1 == vo.no }">
								<option value="${vo.no }" selected>${vo.title }</option>
							</c:when>
							<c:otherwise>
								<option value="${vo.no }">${vo.title }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</select> &nbsp; &nbsp; 
			<select id="optNo2" name="optNo2">
					<c:forEach items="${option }" var="vo">
						<c:choose>
							<c:when test="${item.optNo2 == vo.no }">
								<option value="${vo.no }" selected>${vo.title }</option>
							</c:when>
							<c:otherwise>
								<option value="${vo.no }">${vo.title }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</select> &nbsp; &nbsp; 
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">제품설명</td>
		<td width="700"  bgcolor="#F2F2F2">
			<textarea name="info" rows="4" cols="70">${item.info }</textarea>
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">상품상태</td>
    	<td width="700"  bgcolor="#F2F2F2">
    		<c:choose>
    			<c:when test="${item.status == 1 }">
	    			<input type="radio" name="status" value="1" checked> 판매중
					<input type="radio" name="status" value="2"> 판매중지
					<input type="radio" name="status" value="3"> 품절
    			</c:when>
    			<c:when test="${item.status == 2 }">
    				<input type="radio" name="status" value="1"> 판매중
					<input type="radio" name="status" value="2" checked> 판매중지
					<input type="radio" name="status" value="3"> 품절
    			</c:when>
    			<c:otherwise>
    				<input type="radio" name="status" value="1"> 판매중
					<input type="radio" name="status" value="2"> 판매중지
					<input type="radio" name="status" value="3" checked> 품절
    			</c:otherwise>
    		</c:choose>
			
		</td>
	</tr>
	<tr> 			
		<td width="100" bgcolor="#CCCCCC" align="center">아이콘</td>
		<td width="700"  bgcolor="#F2F2F2">
				<c:set var="array" value="${ fn:split(item.icon, ',') }" />
				<c:set var="count" value="${fn:length(array) }"/>
					<c:choose>
						<c:when test="${count > 2 }">
							<input type="checkbox" name="icon" value="1" checked> New &nbsp;&nbsp	
							<input type="checkbox" name="icon" value="2" checked> Hit &nbsp;&nbsp	
							<input type="checkbox" name="icon" value="3" checked onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
							할인율 : <input type="text" name="discount" value="${item.discount }" size="3" maxlength="3"> %			
						</c:when>
						<c:when test="${count > 1  }">
							<c:choose>
								<c:when test="${array[0] == 1 and array[1] == 2 }">
									<input type="checkbox" name="icon" value="1" checked> New &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="2" checked> Hit &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="3" onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
									할인율 : <input type="text" name="discount" value="${item.discount }" size="3" maxlength="3" disabled> %			
								</c:when>
									<c:when test="${array[0] == 1 and array[1] == 3 }">
									<input type="checkbox" name="icon" value="1" checked> New &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="2"> Hit &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="3" checked onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
									할인율 : <input type="text" name="discount" value="${item.discount }" size="3" maxlength="3"> %			
									
								</c:when>
									<c:when test="${array[0] == 2 and array[1] == 3 }">
									<input type="checkbox" name="icon" value="1"> New &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="2" checked> Hit &nbsp;&nbsp	
									<input type="checkbox" name="icon" value="3" checked onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
									할인율 : <input type="text" name="discount" value="${item.discount }" size="3" maxlength="3"> %			
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="icon" value="1"> New &nbsp;&nbsp	
							<input type="checkbox" name="icon" value="2"> Hit &nbsp;&nbsp	
							<input type="checkbox" name="icon" value="3" onclick="form1.discount.disabled=!form1.discount.disabled;"> Sale &nbsp;&nbsp
							할인율 : <input type="text" name="discount" value="${item.discount }" size="3" maxlength="3" disabled> %						
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="icon"  value="">
			</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">등록일</td>
		<td width="700"  bgcolor="#F2F2F2">
			<c:set var="array" value="${ fn:split(item.regDate, '-') }" />
			<input type="text" id="regday1" name="regday1" value="${array[0] }" size="4" maxlength="4"> 년 &nbsp
			<input type="text" id="regday2" name="regday2" value="${array[1] }" size="2" maxlength="2"> 월 &nbsp
			<input type="text" id="regday3" name="regday3" value="${array[2] }" size="2" maxlength="2"> 일 &nbsp
			<input type="hidden" id="regDate" name="regDate" value="">
		</td>
	</tr>
	<tr> 
		<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
		<td width="700"  bgcolor="#F2F2F2">

			<table border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									&nbsp;<input type="checkbox" name="checkno1" value="1"> <b>이미지1</b>: ${item.file1 }
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="file1" name="image1" size="20" value="">
									<input type="hidden" id="imagename1" name="imagename1" value="${item.file1 }">
								</td>
							</tr> 
							<tr>
								<td>
									&nbsp;<input type="checkbox" name="checkno2" value="1"> <b>이미지2</b>: ${item.file2 }
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="file2" name="image2" size="20" value="">
									<input type="hidden" id="imagename2" name="imagename2" value="${item.file2 }">
								</td>
							</tr> 
							<tr>
								<td>
									&nbsp;<input type="checkbox" name="checkno3" value="1"> <b>이미지3</b>:${item.file3 }
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="file" id="file3" name="image3" size="20" value="">
									<input type="hidden"  id="imagename3" name="imagename3" value="${item.file3 }">
								</td>
							</tr> 
							<tr>
								<td><br>&nbsp;&nbsp;&nbsp;※ 삭제할 그림은 체크를 하세요.</td>
							</tr> 
				  	</table>
						<br><br><br><br><br>
						<table width="390" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  valign="middle">&nbsp;
									<img src="${pageContext.servletContext.contextPath }${item.file1}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_1.jpg')">&nbsp;
									<img src="${pageContext.servletContext.contextPath }${item.file2}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/s001_2.jpg')">&nbsp;
									<img src="${pageContext.servletContext.contextPath }${item.file3}" width="50" height="50" border="1" style='cursor:hand' onclick="imageView('${pageContext.servletContext.contextPath }/assets/images/product/nopic.jpg')">&nbsp;
								</td>
							</tr>				 
						</table>
					</td>
					<td>
						<td align="right" width="310"><img name="big" src="${pageContext.servletContext.contextPath }${item.file1}" width="300" height="300" border="1"></td>
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>
 </c:forEach>
<br>
<table width="800" border="0" cellspacing="0" cellpadding="5">
	<tr> 
		<td align="center">
			<input type="submit" id="btn-product-edit" value="수정하기"> &nbsp;&nbsp
			<a href="product"><input id="btn" type="button" value="이전화면"></a><!-- product -->
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>
