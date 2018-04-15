<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	function mainProduct(){
		
		$.ajax({
			url:"/bitmall/getAllProductList",
			type:"get",
			data:"",
			dataType:"json", 
			success: function(list){
				console.log(list);
				var innerHTML = "";
				$.each(list, function(index, item){
					var no = item.no;
					var title = item.title;
					var price = item.price;
					var file1 = "/bitmall"+item.file1;
					
					
					if(item.icon != null){
						var icon = item.icon.split(',');
					}else{
						var icon = item.icon;
					}
				
					var discount = item.discount;
					
					
					if(index % 5 == 0){
						innerHTML += '<tr>';
						innerHTML += '<tr><td height="10"></td></tr>';
					}
					
					innerHTML += '<td width="150" height="205" align="center" valign="top">';
					innerHTML += '<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">';
					innerHTML += '<tr><td align="center"><a href="product_detail?no='+no+'">';
					innerHTML += '<img src="'+file1+'" width="120" height="140" border="0"></a>';
					innerHTML += '</td></tr><tr><td height="5"></td></tr><tr><td height="20" align="center">';
					innerHTML += '<a href="product_detail?no='+no+'"><font color="444444">'+title+'</font></a>&nbsp;'; 
					innerHTML += '</td></tr><tr><td align="center">'
					if(icon != null){
					if(icon.length>2){
						innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
						innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
						innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
					} else if(icon.length >1){
						if(icon[0] == 1 && icon[1] == 2){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
						}else if(icon[0] == 1 && icon[1] == 3){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
						}else if(icon[0] == 2 && icon[1] == 3){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
						}
					} else{
						if(icon[0] ==1){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_new.gif" align="absmiddle" vspace="1">'; 
						}else if(icon[0] ==2){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_hit.gif" align="absmiddle" vspace="1">'; 
						}else if(icon[0] ==3){
							innerHTML += '<img src="${pageContext.servletContext.contextPath }/assets/images/i_sale.gif" align="absmiddle" vspace="1"> <font color="red">'+discount+'%</font>'; 
						}
					}
					}
					innerHTML += '</td></tr>';
					
					if(discount == 0){
						innerHTML += '<tr><td height="20" align="center"><b>'+price+'</b></td></tr>';
					}else{
						innerHTML += '<tr><td height="20" align="center"><strike>'+price+'</strike></td></tr>';
					
						var StringPriceArray = price.split(',');
						var StringPrice = "";
						
						for(var i in StringPriceArray){
							StringPrice += StringPriceArray[i];
						}
						
						var IntegerPrice = Number(StringPrice);
						
						var discount_price = (IntegerPrice * discount) / 100;
						var result_price = IntegerPrice - discount_price;
						console.log(IntegerPrice+":"+discount+":"+discount_price+":"+result_price);
						
						
						innerHTML += '<tr><td height="20" align="center"><b>'+numberWithCommas(result_price)+'</b></td></tr>';	
					}
					
					innerHTML += '</table></td>';
					
					$("#AllProduct-Table").html(innerHTML);  
					  
					
				});
			},
			error: function(xhr, status, e){
				//console.error(status + ":" + e);
			}	
		});
	}

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	$(function(){
		mainProduct();
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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<!---- 화면 우측(신상품) 시작 -------------------------------------------------->	
			<table width="767" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="60">
						<img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
					</td>
				</tr>
			</table>

			<table id="AllProduct-Table" border="0" cellpadding="0" cellspacing="0">
			
			</table>

			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
&nbsp

</body>
</html>