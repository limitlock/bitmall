<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script type="text/javascript">
	function getOrder(){
		
		$.ajax({
			url:"/bitmall/order/getOrder",
			type:"get",
			data:"",
			dataType:"json", 
			success: function(list){
				console.log(list);
				var totalPrice = 0;
				var innerHTML = '<tr bgcolor="F0F0F0" height="23" class="cmfont">'+
								'<td width="420" align="center">상품</td><td width="70"  align="center">수량</td>'+
								'<td width="80"  align="center">가격</td>'+
								'<td width="90"  align="center">합계</td>'+
								'<td width="50"  align="center">삭제</td>'+
								'</tr>';


			 		var optNo1 = list.optNo1;
					var optNo2 = list.optNo2;
					var num = list.num;			
					var price = list.price;
					var result_price = list.result_price;
					var productTitle = list.productTitle;
					var productNo = list.productNo;
					var file1 = list.file1;
					
					innerHTML += '<tr bgcolor="#FFFFFF">';
					innerHTML += '<td height="60" align="center">';
					innerHTML += '<table cellpadding="0" cellspacing="0" width="100%">';
					innerHTML += '<tr><td width="60">';
					innerHTML += '<a href="product_detail?no='+productNo+'"><img src="/bitmall'+file1+'" width="50" height="50" border="0"></a></td>';
					innerHTML += '<td class="cmfont">';
					innerHTML += '<a href="product_detail?no='+productNo+'"><font color="#0066CC">'+productTitle+'</font></a><br>';
					
					if(optNo2 == ""){
					innerHTML += '[옵션]</font> '+optNo1+'';
					}else{
						innerHTML += '[옵션]</font> '+optNo1+' / '+optNo2+'';
					}
				
					innerHTML += '</td></tr></table></td>';
					innerHTML += '<td align="center"><font color="#464646">'+num+'&nbsp개</font></td>';
					innerHTML += '<td align="center"><font color="#464646">'+price+'</font> 원</td>';
					innerHTML += '<td align="center"><font color="#464646">'+numberWithCommas(result_price)+'</font> 원</td>';
					
					innerHTML += '<td align="center" bgcolor="#FFFFFF">'
					innerHTML += '<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>';
					innerHTML += '<a href="/bitmall/cart/delete?productNo='+productNo+'"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp';
					innerHTML += '</td>';


					totalPrice += Number(result_price);
					
				
					
					innerHTML +='<tr>';
					innerHTML +=	'<td colspan="5" bgcolor="#F0F0F0">';
					innerHTML +=		'<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">';
					innerHTML +=			'<tr>';
					innerHTML +=				'<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>';
					innerHTML +=				'<td id = "total_price" align="right" bgcolor="#F0F0F0">';
					
					innerHTML +=				'</td>';
					innerHTML +=			'</tr>';
					innerHTML +=		'</table>';
					innerHTML +=	'</td>';
					innerHTML +='</tr>';
					var innerTotalPriceHTML ='<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금('+numberWithCommas(totalPrice)+'원) + 배송료(2,500원) = '+
												'<font color="#FF3333"><b>('+numberWithCommas(totalPrice+2500)+') 원</b></font>&nbsp;&nbsp';
					
					$("#cart-table").html(innerHTML); 
					$("#total_price").html(innerTotalPriceHTML);
			},error: function(xhr, status, e){
				console.error(e);
			}	
		});
	}
	
	function getCartOrder(){
		
		$.ajax({
			url:"/bitmall/order/getCartOrder?userNo=${authUser.no}",
			type:"get",
			data:"",
			dataType:"json", 
			success: function(list){
				console.log(list);
				var totalPrice = 0;
				var innerHTML = '<tr bgcolor="F0F0F0" height="23" class="cmfont">'+
								'<td width="420" align="center">상품</td><td width="70"  align="center">수량</td>'+
								'<td width="80"  align="center">가격</td>'+
								'<td width="90"  align="center">합계</td>'+
								'<td width="50"  align="center">삭제</td>'+
								'</tr>';
				$.each(list, function(index, item){
					
			 		var optNo1 = item.optNo1;
					var optNo2 = item.optNo2;
					var num = item.num;			
					var price = item.price;
					var result_price = item.result_price;
					var productTitle = item.productTitle;
					var productNo = item.productNo;
					var file1 = item.file1;
					
					innerHTML += '<tr bgcolor="#FFFFFF">';
					innerHTML += '<td height="60" align="center">';
					innerHTML += '<table cellpadding="0" cellspacing="0" width="100%">';
					innerHTML += '<tr><td width="60">';
					innerHTML += '<a href="product_detail?no='+productNo+'"><img src="/bitmall'+file1+'" width="50" height="50" border="0"></a></td>';
					innerHTML += '<td class="cmfont">';
					innerHTML += '<a href="product_detail?no='+productNo+'"><font color="#0066CC">'+productTitle+'</font></a><br>';
					
					if(optNo2 == ""){
					innerHTML += '[옵션]</font> '+optNo1+'';
					}else{
						innerHTML += '[옵션]</font> '+optNo1+' / '+optNo2+'';
					}
				
					innerHTML += '</td></tr></table></td>';
					innerHTML += '<td align="center"><font color="#464646">'+num+'&nbsp개</font></td>';
					innerHTML += '<td align="center"><font color="#464646">'+price+'</font> 원</td>';
					innerHTML += '<td align="center"><font color="#464646">'+numberWithCommas(result_price)+'</font> 원</td>';
					
					innerHTML += '<td align="center" bgcolor="#FFFFFF">'
					innerHTML += '<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_edit1.gif" border="0">&nbsp<br>';
					innerHTML += '<a href="/bitmall/cart/delete?productNo='+productNo+'"><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp';
					innerHTML += '</td>';


					totalPrice += Number(result_price);
					
					/* var totalPrice = Number(result_price)+2500;
					var innerTotalPriceHTML = '<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금('+numberWithCommas(result_price)+'원) + 배송료(2,500원) = '+
												'<font color="#FF3333"><b>('+numberWithCommas(totalPrice)+') 원</b></font>&nbsp;&nbsp';
					
					 */
					 
					 
					 
					 
					 
					 
				});
				
				

				
				innerHTML +='<tr>';
				innerHTML +=	'<td colspan="5" bgcolor="#F0F0F0">';
				innerHTML +=		'<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">';
				innerHTML +=			'<tr>';
				innerHTML +=				'<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>';
				innerHTML +=				'<td id = "total_price" align="right" bgcolor="#F0F0F0">';
				
				innerHTML +=				'</td>';
				innerHTML +=			'</tr>';
				innerHTML +=		'</table>';
				innerHTML +=	'</td>';
				innerHTML +='</tr>';
				var innerTotalPriceHTML ='<font color="#0066CC"><b>총 합계금액</font></b> : 상품대금('+numberWithCommas(totalPrice)+'원) + 배송료(2,500원) = '+
											'<font color="#FF3333"><b>('+numberWithCommas(totalPrice+2500)+') 원</b></font>&nbsp;&nbsp';
				
				$("#cart-table").html(innerHTML); 
				$("#total_price").html(innerTotalPriceHTML);
				
				
				
			},error: function(xhr, status, e){
				console.error(e);
			}	
		});
		
		
	}

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
	
	
	function SameCopy(input){
		var input = input;
		
		if(input == 'Y'){
			$('input[name=name]').val($("input[name=o_name]").val());
			$('input[name=tel1]').val($("input[name=o_tel1]").val());
			$('input[name=tel2]').val($("input[name=o_tel2]").val());
			$('input[name=tel3]').val($("input[name=o_tel3]").val());
			$('input[name=phone1]').val($("input[name=o_phone1]").val());
			$('input[name=phone2]').val($("input[name=o_phone2]").val());
			$('input[name=phone3]').val($("input[name=o_phone3]").val());
			$('input[name=email]').val($("input[name=o_email]").val());
			
			$('input[name=zip1]').val($("input[name=o_zip1]").val());
			$('input[name=zip2]').val($("input[name=o_zip2]").val());
			$('input[name=address]').val($("input[name=o_juso]").val());
			
		}else{
			$('input[name=name]').val("");
			$('input[name=tel1]').val("");
			$('input[name=tel2]').val("");
			$('input[name=tel3]').val("");
			$('input[name=phone1]').val("");
			$('input[name=phone2]').val("");
			$('input[name=phone3]').val("");
			$('input[name=email]').val("");
			
			$('input[name=zip1]').val("");
			$('input[name=zip2]').val("");
			$('input[name=address]').val("");
		}
		
	}
	
	$(function(){
		// 1==바로구매
		if(${param.flag==1}){
		getOrder();
		}else{
			getCartOrder();
		}
		
		
		$("#btn-pay").click(function(e) {
			
			if($("#name").val()==""){
				alert("받는 사람의 이름을 입력해주세요.");
				e.preventDefault();
				return;
			}
			
			if($("#phone1").val()==""){
				alert("핸드폰 번호는 필수입니다.");
				e.preventDefault();
				return;
			}
			
			if($("#zip1").val()==""){
				alert("우편 번호는 필수입니다.");
				e.preventDefault();
				return;
			}
			
			
			if($("#address").val()==""){
				alert("주소는 필수입니다.");
				e.preventDefault();
				return;
			}
			

			var tel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
			$("#tel").val(tel);

			var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
			$("#phone").val(phone);

			var zip = $("#zip1").val() + $("#zip2").val();
			$("#zip").val(zip);
			});
		
			
	});
	
	
	
	
	</script>
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
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table id="cart-table" border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				
				
			</table>
			<br><br>

			<!-- 주문자 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>

			<!-- form2 시작  -->
			
			<form name="form2" method="post" action="order_pay">
			<input type="hidden" name ="flag" value="${param.flag }">
			<c:forEach items="${list }" var="vo">
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5">
						<font size="2" color="#B90319"><b>주문자 정보</b></font>
					</td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="hidden" name="userNo" value="${authUser.no }">
									<input id="o_name" type="text" name="o_name" size="20" maxlength="10" value="${vo.name }" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_tel1" size="4" maxlength="4" value="${fn:substring(vo.tel,0,3) }" class="cmfont1"> -
									<input type="text" name="o_tel2" size="4" maxlength="4" value="${fn:substring(vo.tel,3,6)}" class="cmfont1"> -
									<input type="text" name="o_tel3" size="4" maxlength="4" value="${fn:substring(vo.tel,6,11)}" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_phone1" size="4" maxlength="4" value="${fn:substring(vo.phone,0,3)}" class="cmfont1"> -
									<input type="text" name="o_phone2" size="4" maxlength="4" value="${fn:substring(vo.phone,3,7)}" class="cmfont1"> -
									<input type="text" name="o_phone3" size="4" maxlength="4" value="${fn:substring(vo.phone,7,11)}" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_email" size="50" maxlength="50" value="${vo.email }" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" name="o_zip1" size="3" maxlength="3" value="${fn:substring(vo.zip,0,3)}" class="cmfont1" readonly> -
									<input type="text" name="o_zip2" size="3" maxlength="3" value="${fn:substring(vo.zip,3,6)}" class="cmfont1" readonly>
									<input type="text" name="o_juso" size="50" maxlength="200" value="${vo.address }" class="cmfont1" readonly><br>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>
			</c:forEach>
	
			<!-- 배송지 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
					<td align="center" width="560">

						<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr height="25">
								<td width="150"><b>주문자정보와 동일</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="radio" name="same" onclick="SameCopy('Y')">예 &nbsp;
									<input type="radio" name="same" onclick="SameCopy('N')">아니오
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>받으실 분 성명</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input id="name" type="text" name="name" size="20" maxlength="10" value="" class="cmfont1">
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>전화번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="tel1" name="tel1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="tel2" name="tel2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="tel3" name="tel3" size="4" maxlength="4" value="" class="cmfont1">
									<input type="hidden" id="tel" name="tel" value=""/>
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>휴대폰번호</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="phone1" name="phone1" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="phone2" name="phone2" size="4" maxlength="4" value="" class="cmfont1"> -
									<input type="text" id="phone3" name="phone3" size="4" maxlength="4" value="" class="cmfont1">
									<input type="hidden" id="phone" name="phone" value=""/>
								</td>
							</tr>
							<tr height="25">
								<td width="150"><b>E-Mail</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="email" name="email" size="50" maxlength="50" value="${vo.email }" class="cmfont1">
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>주소</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<input type="text" id="zip1" name="zip1" size="3" maxlength="3" value="" class="cmfont1" > -
									<input type="text" id="zip2" name="zip2" size="3" maxlength="3" value="" class="cmfont1" >
									<input type="hidden" id="zip" name="zip" value=""/>
									<a href="javascript:FindZip(2)"><img src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" align="absmiddle" border="0"></a> <br>
									<input type="text" id="address" name="address" size="50" maxlength="200" value="" class="cmfont1" ><br>
								</td>
							</tr>
							<tr height="50">
								<td width="150"><b>배송시요구사항</b></td>
								<td width="20"><b>:</b></td>
								<td width="390">
									<textarea id="req" name="req" cols="60" rows="3" class="cmfont1"></textarea>
								</td>
							</tr>
						</table>

					</td>
				</tr>
				<tr height="10"><td></td></tr>
			</table>
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
				<tr height="10"><td></td></tr>
			</table>

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr>
					<td align="center">
						<input type="image" id="btn-pay" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			
			</form>

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