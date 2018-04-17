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
	
	function getOrderByCart(){
		
		$.ajax({
			url:"/bitmall/cart/getOrder?userNo=${authUser.no}",
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
				
				
			}
		});
		
		
	}

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
	$(function(){
		getOrderByCart();
		
	
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
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0"></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr><td height="10"></td></tr>
			</table>

			<table id="cart-table" border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
			
			</table>
			
			
			
			
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="44">
					<td width="710" align="center" valign="middle">
						<a href="index"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0"></a>&nbsp;&nbsp;
						<a href="/bitmall/cart/deleteAll?userNo=${authUser.no }"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0"></a>&nbsp;&nbsp;
						<a href="order?flag=2&userNo=${authUser.no }" id="order"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></a>
					</td>
				</tr>
			</table>

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