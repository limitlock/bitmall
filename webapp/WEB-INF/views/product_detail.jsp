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
	__result_price = 0;
	__no = 0;
	
	function getProduct(){
		$.ajax({
			url:"/bitmall/product_detail/getProduct",
			type:"get",
			data:{"no" : ${param.no}},
			dataType:"json", 
			success: function(list){
				$.each(list, function(index, item){
					
					var no = item.no;
					__no = no;
					
					var title = item.title;
					__title = title;
					
					var price = item.price;
					__price = price;
					var info = item.info;
					
					if(item.icon != null){
						var icon = item.icon.split(',');
					}else{
						var icon = item.icon;
					}

					var discount = item.discount;
					
					
					var innerTitleIconHTML ='<font color="282828">'+title+'</font><br>';
					
					if(icon != null){
						if(icon.length>2){
							innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
							innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
							innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
						} else if(icon.length >1){
							if(icon[0] == 1 && icon[1] == 2){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
							}else if(icon[0] == 1 && icon[1] == 3){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
							}else if(icon[0] == 2 && icon[1] == 3){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
							}
						} else{
							if(icon[0] ==1){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
							}else if(icon[0] ==2){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
							}else if(icon[0] ==3){
								innerTitleIconHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
							}
						}
					}
					
					$("#title").html(innerTitleIconHTML); 
					
					
					if(discount == 0){
						var innerOriginalPriceHTML = '<font color="666666">'+numberWithCommas(price)+' 원</font>';
					}else{
						innerOriginalPriceHTML = '<strike><font color="666666">'+numberWithCommas(price)+' 원</font><strike>';
					}
					
					$("#original_price").html(innerOriginalPriceHTML); 
					
					
					if(discount == 0){
						var StringPriceArray = price.split(',');
						var StringPrice = "";
						
						for(var i in StringPriceArray){
							StringPrice += StringPriceArray[i];
						}
						
						var IntegerPrice = Number(StringPrice);
						
						var result_price = IntegerPrice * $("#num").val();
						__result_price = result_price;
						var innerDiscountPriceHTML = '<font color="0288DD"><b>'+numberWithCommas(result_price)+' 원</b></font>';
					}else{
						var StringPriceArray = price.split(',');
						var StringPrice = "";
						
						for(var i in StringPriceArray){
							StringPrice += StringPriceArray[i];
						}
						
						var IntegerPrice = Number(StringPrice);
						
						var discount_price = (IntegerPrice * discount) / 100;
						var result_price = (IntegerPrice - discount_price) * $("#num").val();
						
						__result_price = result_price;
						
						innerDiscountPriceHTML = '<font color="0288DD"><b>'+numberWithCommas(result_price)+' 원</b></font>';
					}
					
					$("#discount_price").html(innerDiscountPriceHTML); 

					
					
					if(item.optNo1 > 1 && item.optNo2 > 1 ){
						var optNo1 = item.optNo1;
						var optNo2 = item.optNo2;
						getOpts(no,optNo1,optNo2);
					}else if(item.optNo1 > 1){
						var optNo1 = item.optNo1;
						getOpts(no,optNo1,optNo2);
					}else if(item.optNo2 > 1){
						var optNo2 = item.optNo2;
						getOpts(no,optNo1,optNo2);
					}
					
					
					
					file1 = item.file1;
				
					
					var file2 = item.file2;
					var file3 = item.file3;
				
					var innerMainImageHTML = '<img src="/bitmall'+file1+'" height="315" border="0" align="absmiddle" STYLE="cursor:hand">';
					$("#image1").html(innerMainImageHTML);
					
				var innerDetailImageHTML = ''+info+'<br><img src="/bitmall'+file2+'" width=770><br><br><br><img src="/bitmall'+file3+'" width=770>';
					$("#detail_image").html(innerDetailImageHTML);  
					
					
				});
				
				
			},
			error: function(xhr, status, e){
				console.error(e);
			}	
		});	
		
	}
	
	function getOpts(no,optNo1, optNo2){
		$.ajax({
			url:"/bitmall/product_detail/getOpts",
			type:"get",
			data:{"no" : no,
				  "optNo1" :optNo1,
				  "optNo2" :optNo2},
			dataType:"json", 
			success: function(list){
				console.log(list);
				var innerOptsOneHTML = '<option value="">선택하세요</option>';
				var innerOptsTwoHTML = '<option value="">선택하세요</option>';
				$.each(list, function(index, item){
					var no = item.no;
					var title = item.title;
					var optNo = item.optNo
					
					if(optNo == optNo1){
						if(no != null){
							innerOptsOneHTML += '<option value="'+no+'">'+title+'</option>'; 
						}else{
							innerOptsOneHTML += '--------------';
						}

						$("#opts1").html(innerOptsOneHTML); 
					}
						
					if(optNo == optNo2){
						if(no != null){
							innerOptsTwoHTML += '<option value="'+no+'">'+title+'</option>'; 
						}else{
							innerOptsTwoHTML += '--------------';
						}

						$("#opts2").html(innerOptsTwoHTML);
					}
				});	
			},
			error: function(xhr, status, e){
				console.error(e);
			}	
		});
	}
	
	
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
	$(function(){
		getProduct();
		
		
		$("#order").click(function(e){
			
			
			if(${authUser == null}){
				alert("회원만 구입할 수 있습니다.")
				e.preventDefault();
				return;
			}
			var no = __no;
			var title = __title;
			var optNo1 = $("#opts1 option:selected").text();
			var optNo2 = $("#opts2 option:selected").text();
			var price = __price;
			var result_price = __result_price;
			
			var num = $("#num").val();
		
			if($("#opts1").val() == ""){
				alert("[옵션 1]을 선택해주세요.");
				e.preventDefault();
				return;
			}
			if($("#opts2").val() == ""){
				alert("[옵션 2]를선택해주세요.");
				e.preventDefault();
				return;
			}
			
			$.ajax({
				url:"/bitmall/order/tempOrder",
				type:"get",
				data:{"productNo": no, "productTitle":title, "optNo1":optNo1, "optNo2":optNo2, 
						"price":price, "num":num, "file1":file1,"result_price":result_price,
					},
				dataType:"json", 
				contentType : "application/json",
				success: function(list){
					console.log(list);
				},error: function(xhr, status, e){
					console.error(e);
				}	
			});
			
		});
		
		$("#cart").click(function(e){
			
			
			if(${authUser == null}){
				alert("회원만 구입할 수 있습니다.")
				e.preventDefault();
				return;
			}
			var no = __no;
			var title = __title;
			var optNo1 = $("#opts1 option:selected").text();
			var optNo2 = $("#opts2 option:selected").text();
			var price = __price;
			var result_price = __result_price;
			
			var num = Number($("#num").val());
		
			if($("#opts1").val() == ""){
				alert("[옵션 1]을 선택해주세요.");
				e.preventDefault();
				return;
			}
			if($("#opts2").val() == ""){
				alert("[옵션 2]를선택해주세요.");
				e.preventDefault();
				return;
			}
			

			$.ajax({
				url:"/bitmall/cart/plus?userNo=${authUser.no}",
				type:"get",
				data:{"productNo": no, "productTitle":title, "optNo1":optNo1, "optNo2":optNo2, 
						"price":price, "num":num, "file1":file1,"result_price":result_price,
					},
				dataType:"json", 
				contentType : "application/json",
				success: function(list){
					
				},error: function(xhr, status, e){
					console.error(e);
				}	
			});
			
		});
		
		
		
		$("#num").on("change keyup paste", function(){
		   getProduct();
		})
		
		
		
		
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
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			<!-- form2 시작  -->
			<form id="order_form" name="form2" method="post" action="insertOrder">
			

			<table border="0" cellpadding="0" cellspacing="0" width="745">
				<tr>
					<td width="335" align="center" valign="top">
						<!-- 상품이미지 -->
						<table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
							<tr>
								<td id="image1" bgcolor="white" align="center">
								</td>
							</tr>
						</table>
					</td>
					<td width="410 " align="center" valign="top">
						<!-- 상품명 -->
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<tr>
								<td width="80" height="45" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>제품명</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td id="title" style="padding-left:10px">
								
								
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 시중가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>소비자가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td id="original_price"width="289" style="padding-left:10px">
								
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 판매가 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>판매가</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td id="discount_price" style="padding-left:10px">
								
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 옵션 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>옵션선택</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td id="opts_td" style="padding-left:10px">
								
									<select id="opts1" name="opts1" class="cmfont1">
									</select> &nbsp;
									
									<select id="opts2" name="opts2" class="cmfont2">
									</select>
									
									
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							<!-- 수량 -->
							<tr>
								<td width="80" height="35" style="padding-left:10px">
									<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
									<font color="666666"><b>수량</b></font>
								</td>
								<td width="1" bgcolor="E8E7EA"></td>
								<td style="padding-left:10px">
									<input type="text" id ="num" name="num" value="1" size="3" maxlength="5" class="cmfont1" > <font color="666666">개</font>
								</td>
							</tr>
							<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="70" align="center">
								<!-- 주문하기 -->
									<a href="order?userNo=${authUser.no}&flag=1" id="order"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp;
								<!-- 장바구니 -->	
									<a href="cart" id="cart"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="absmiddle"></a>
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
							<tr>
								<td height="30" align="center">
									<img src="${pageContext.servletContext.contextPath }/assets/images/product_text1.gif" border="0" align="absmiddle">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</form>
			<!-- form2 끝  -->

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td id="detail_image" height="200" valign=top style="line-height:14pt">
						본제품의 상세설명은 다음과 같습니다.
					
					</td>
				</tr>
			</table>

			<!-- 교환배송정보 -->
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td align="center" class="cmfont">배송정보 어쩌고저쩌고........</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" class="cmfont">
				<tr><td height="10"></td></tr>
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