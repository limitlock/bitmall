<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.servletContext.contextPath }/assets/css/font.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
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
					
					
					/* var post = 
						'<input type="hidden" name="no" value="">'+
						'<input type="hidden" name="userNo" value="">'+
						'<input type="hidden" name="optNo1" value="'+list.optNo1+'">'+
						'<input type="hidden" name="optNo2" value="'+list.optNo2+'">'+
						'<input type="hidden" name="num" value="'+list.num+'">'+
						'<input type="hidden" name="price" value="'+list.price+'">'+
						'<input type="hidden" name="result_price" value="'+list.result_price+'">'+
						'<input type="hidden" name="productTitle" value="'+list.productTitle+'">'+
						'<input type="hidden" name="productNo" value="'+list.productNo+'">'+
						'<input type="hidden" name="file1" value="'+list.file1+'">'+
						'<input type="hidden" name="orderNo" value="">';
					
					
					
					console.log(post);
					$("#post").html(post);  */
						
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

				
				console.log(list);
				

					
				//$("#cartProduct_post").html(innerCartProductHTML);
				
				
				
			},error: function(xhr, status, e){
				console.error(e);
			}	
		});
		
		
	}

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$(function(){
		// 1==바로구매
		if(${param.flag==1}){
		getOrder();
		}else{
			getCartOrder();
		}
		
		
		$("#btn-pay").click(function(e) {
			
			var cardNo = $("#cardNo1").val() + $("#cardNo2").val() + $("#cardNo3").val();
			$("#cardNo").val(cardNo);
			
			var cardDate = $("#card_month").val() + $("#card_year").val();
			$("#cardDate").val(cardDate);

			

			
		});
		
			
	});
	
	
	

	</script>
</head>
<body style="margin: 0">
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/search.jsp" />
	<table width="959" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		<tr>
			<td height="100%" valign="top"><jsp:include
					page="/WEB-INF/views/include/navigation.jsp" /></td>
			<td width="10"></td>
			<td valign="top">
				<!-------------------------------------------------------------------------------------------->
				<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
				<!-------------------------------------------------------------------------------------------->

				<!--  현재 페이지 자바스크립  --------------------------------------------> <script
					language="javascript">
				
					function Check_Value() {
						if (form2.payMethod[0].checked) {
							if (!form2.cardKind.value) {
								alert("카드종류를 선택하세요.");	form2.card_kind.focus();	return;
							}
							if (!form2.card_no1.value || form2.card_no1.value.length != 4) {
								alert("카드번호를 입력하세요.");	form2.card_no1.focus();	return;
							}
							if (!form2.card_no2.value || form2.card_no2.value.length != 4) {
								alert("카드번호를 입력하세요.");	form2.card_no2.focus();	return;
							}
							if (!form2.card_no3.value || form2.card_no3.value.length != 4) {
								alert("카드번호를 입력하세요.");	form2.card_no3.focus();	return;
							}
							if (!form2.card_no4.value || form2.card_no4.value.length != 4) {
								alert("카드번호를 입력하세요.");	form2.card_no4.focus();	return;
							}
							if (!form2.card_year.value) {
								alert("카드기간 년도를 선택하세요.");	form2.card_year.focus();	return;
							}
							if (!form2.card_month.value) {
								alert("카드기간 월을 선택하세요.");	form2.card_month.focus();	return;
							}
							if (!form2.cardPw.value) {
								alert("카드 암호 뒷의 2자리를 선택하세요.");	form2.card_pw.focus();	return;
							}
						} else {
							if (!form2.bankKind.value) {
								alert("입금할 은행을 선택하세요.");	form2.bank_kind.focus();	return;
							}
							if (!form2.bankSender.value) {
								alert("입금자 이름을 입력하세요.");	form2.bank_sender.focus();	return;
							}
						}
				
						form2.submit();
					}
				
					function PaySel(n) {
						if (n == 0) {
							form2.cardKind.disabled = false;
							form2.card_no1.disabled = false;
							form2.card_no2.disabled = false;
							form2.card_no3.disabled = false;
							form2.card_no4.disabled = false;
							form2.card_year.disabled = false;
							form2.card_month.disabled = false;
							form2.cardPw.disabled = false;
							form2.bankKind.disabled = true;
							form2.bankSender.disabled = true;
						} else {
							form2.cardKind.disabled = true;
							form2.card_no1.disabled = true;
							form2.card_no2.disabled = true;
							form2.card_no3.disabled = true;
							form2.card_no4.disabled = true;
							form2.card_year.disabled = true;
							form2.card_month.disabled = true;
							form2.cardPw.disabled = true;
							form2.bankKind.disabled = false;
							form2.bankSender.disabled = false;
						}
					}
				</script>

				<table border="0" cellpadding="0" cellspacing="0" width="747">
					<tr>
						<td height="13"></td>
					</tr>
					<tr>
						<td height="30" align="center"><img
							src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif"
							width="746" height="30" border="0"></td>
					</tr>
					<tr>
						<td height="13"></td>
					</tr>
				</table>

				<table border="0" cellpadding="0" cellspacing="0" width="710">
					<tr>
						<td><img
							src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif"
							width="65" height="15" border="0"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
				</table>

				<table id="cart-table" border="0" cellpadding="5" cellspacing="1"
					width="710" class="cmfont" bgcolor="#CCCCCC">

				</table> <br>
			<br>

				<table width="710" border="0" cellpadding="0" cellspacing="0"
					class="cmfont">
					<tr height="3" bgcolor="#CCCCCC">
						<td></td>
					</tr>
				</table> <br>
			<br> <br>
			<br> <!-- form2 시작  -->
				<form name="form2" method="post" action="order_ok">
					<table id="post">

					</table>


					<input type="hidden" name="flag" value="${param.flag }"> <input
						type="hidden" name="userNo" value="${authUser.no }"> <input
						type="hidden" name="name" value="${vo.name }"> <input
						type="hidden" name="tel" value="${vo.tel }"> <input
						type="hidden" name="phone" value="${vo.phone }"> <input
						type="hidden" name="email" value="${vo.email }"> <input
						type="hidden" name="zip" value="${vo.zip }"> <input
						type="hidden" name="address" value="${vo.address }"> <input
						type="hidden" name="req" value="${vo.req }">


					<!-- 결재방법 선택 및 입력 -->
					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr height="3" bgcolor="#CCCCCC">
							<td></td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>

					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr>
							<td align="left" valign="top" width="150"
								STYLE="padding-left: 45; padding-top: 5"><font size=2
								color="#B90319"><b>결재방법</b></font></td>
							<td align="center" width="560">

								<table width="560" border="0" cellpadding="0" cellspacing="0"
									class="cmfont">
									<tr height="25">
										<td width="150"><b>결재방법 선택</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><input type="radio" id="payMethod"
											name="payMethod" value="카드" onclick="javascript:PaySel(0);"
											checked>카드 &nbsp; <input type="radio" id="payMethod"
											name="payMethod" value="무통장" onclick="javascript:PaySel(1);">무통장
										</td>
									</tr>
								</table>

							</td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>

					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr height="1" bgcolor="#CCCCCC">
							<td></td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>
					<!-- 카드 -->
					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr>
							<td align="left" valign="top" width="150"
								STYLE="padding-left: 45; padding-top: 5"><font size=2
								color="#B90319"><b>카드</b></font></td>
							<td align="center" width="560">
								<table width="560" border="0" cellpadding="0" cellspacing="0"
									class="cmfont">
									<tr height="25">
										<td width="150"><b>카드종류</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><select name="cardKind" class="cmfont1">
												<option value="">카드종류를 선택하세요.</option>
												<option value="1">국민카드</option>
												<option value="2">신한카드</option>
												<option value="3">우리카드</option>
												<option value="4">하나카드</option>
										</select></td>
									</tr>
									<tr height="25">
										<td width="150"><b>카드번호</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><input type="text" id="cardNo1"
											name="card_no1" size="4" maxlength="4" value=""
											class="cmfont1"> - <input type="text" id="cardNo2"
											name="card_no2" size="4" maxlength="4" value=""
											class="cmfont1"> - <input type="text" id="cardNo3"
											name="card_no3" size="4" maxlength="4" value=""
											class="cmfont1"> - <input type="text" id="cardNo4"
											name="card_no4" size="4" maxlength="4" value=""
											class="cmfont1"> <input type="hidden" id="cardNo"
											name="cardNo" value=""></td>
									</tr>
									<tr height="25">
										<td width="150"><b>카드기간</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><input type="text" id="card_month"
											name="card_month" size="2" maxlength="2" value=""
											class="cmfont1"> 월 / <input type="text"
											id="card_year" name="card_year" size="2" maxlength="2"
											value="" class="cmfont1"> 년 <input type="hidden"
											id="cardDate" name="cardDate" value=""></td>
									</tr>
									<tr height="25">
										<td width="150"><b>카드비밀번호(뒷2자리)</b></td>
										<td width="20"><b>:</b></td>
										<td width="390">**<input type="password" name="cardPw"
											size="2" maxlength="2" value="" class="cmfont1">
										</td>
									</tr>
									<tr height="25">
										<td width="150"><b>할부</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><select name="card_halbu" class="cmfont1">
												<option value="0">일시불</option>
												<option value="3">3 개월</option>
												<option value="6">6 개월</option>
												<option value="9">9 개월</option>
												<option value="12">12 개월</option>
										</select></td>
									</tr>
								</table>

							</td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>

					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr height="1" bgcolor="#CCCCCC">
							<td></td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>
					<!-- 무통장 -->
					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr>
							<td align="left" valign="top" width="150"
								style="padding-left: 45; padding-top: 5"><font size=2
								color="#B90319"><b>무통장 입금</b></font></td>
							<td align="center" width="560">
								<table width="560" border="0" cellpadding="0" cellspacing="0"
									class="cmfont">
									<tr height="25">
										<td width="150"><b>은행선택</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><select name="bankKind" class="cmfont1"
											disabled>
												<option value="">입금할 은행을 선택하세요.</option>
												<option value="국민은행 000-00000-0000">국민은행
													000-00000-0000</option>
												<option value="신한은행 000-00000-0000">신한은행
													000-00000-0000</option>
										</select></td>
									</tr>
									<tr height="25">
										<td width="150"><b>입금자 이름</b></td>
										<td width="20"><b>:</b></td>
										<td width="390"><input type="text" name="bankSender"
											size="15" maxlength="20" value="" class="cmfont1" disabled>
										</td>
									</tr>
								</table>

							</td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>

					<table width="710" border="0" cellpadding="0" cellspacing="0"
						class="cmfont">
						<tr height="3" bgcolor="#CCCCCC">
							<td></td>
						</tr>
						<tr height="10">
							<td></td>
						</tr>
					</table>

				</form>

				<table width="710" border="0" cellpadding="0" cellspacing="0"
					class="cmfont">
					<tr>
						<td align="center"><img
							src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif"
							onclick="Check_Value()" style="cursor: hand"></td>
					</tr>
					<tr height="20">
						<td></td>
					</tr>
				</table> <!-------------------------------------------------------------------------------------------->
				<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
				<!-------------------------------------------------------------------------------------------->

			</td>
		</tr>
	</table>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>