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
	function getCartOrder(){
		$.ajax({
			url:"/bitmall/jumun_info/getOrderProduct?orderNo=${param.orderNo}",
			type:"get",
			data:"",
			dataType:"json", 
			success: function(list){
				
				var totalPrice = 0;
				var innerHTML = '<tr bgcolor="F0F0F0" height="23" class="cmfont">'+
								'<td width="420" align="center">상품</td><td width="70"  align="center">수량</td>'+
								'<td width="80"  align="center">가격</td>'+
								'<td width="90"  align="center">합계</td>'+
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
			getCartOrder();
		
	
	
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
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title2.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>

			<table id="cart-table" border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
			
			</table>

			<br><br><br>
			<c:forEach items="${orderinfo }" var="recipient">
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title3.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.orderNo }<font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제금액</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#D06404"><b><fmt:formatNumber value="${price }" pattern="#,###" /> 원</b></font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.payMethod }</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;승인번호</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868"></font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;카드종류</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.cardKind }</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;할부</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.cardHalbu }</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;결제방식</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.payMethod } (${recipient.bankKind })</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;보낸사람</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.bankSender }</font></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<br><br><br>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title4.gif" border="0" align="absmiddle"></td>
				</tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>
			
			
			<table border="0" cellpadding="0" cellspacing="1" width="685" bgcolor="#EEEEEE" class="cmfont">
				<c:forEach items="${sender }" var="sender">
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;주문자명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${sender.name }</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${sender.tel }</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${sender.phone }</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;이메일</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${sender.email }</font></td>
				</tr>
				</c:forEach>
				<tr><td height="1" bgcolor="8B9CBF" colspan="4"></td></tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;수취인명</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${recipient.name }</font></td>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;전화번호</td>
					<td width="242" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.tel }</font></td>
					<td width="100" bgcolor="#F2F2F2">&nbsp;휴대폰</td>
					<td width="243" bgcolor="#FFFFFF">&nbsp;<font color="#686868">${recipient.phone }</font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;배달주소</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${recipient.address }  </font></td>
				</tr>
				<tr height="25">
					<td width="100" bgcolor="#F2F2F2">&nbsp;메모</td>
					<td bgcolor="#FFFFFF" colspan="3">&nbsp;<font color="#686868">${recipient.req }</font></td>
				</tr>
				
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr><td height="2" bgcolor="8B9CBF"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td height="40" class="cmfont" align="right">
						<a href="jumun?userNo=${authUser.no }"><img src="${pageContext.servletContext.contextPath }/assets/images/b_list.gif" border="0"></a>&nbsp;&nbsp;&nbsp
					</td>
				</tr>
			</table>
			</c:forEach>


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