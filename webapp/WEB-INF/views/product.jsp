<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>비트닷컴 쇼핑몰</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/pager.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	function ProductByCategory(){
		
		$.ajax({
			url:"/bitmall/product/getProductList",
			type:"get",
			data:{"categoryNo" : ${param.categoryNo},
				  "page" : ${param.page}},
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
	ProductByCategory();
		
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

				<!-- 하위 상품목록 --> <!-- form2 시작 -->
				<form name="form2" method="post" action="product.jsp">
					<input type="hidden" name="menu" value="1">

					<table border="0" cellpadding="0" cellspacing="5" width="767"
						class="cmfont" bgcolor="#efefef">
						<tr>
							<td bgcolor="white" align="center">
								<table border="0" cellpadding="0" cellspacing="0" width="751"
									class="cmfont">
									<tr>
										<td align="center" valign="middle">
											<table border="0" cellpadding="0" cellspacing="0" width="730"
												height="40" class="cmfont">
												<tr>
													<td width="500" class="cmfont"><font color="#C83762"
														class="cmfont"><b>주메뉴1 &nbsp</b></font>&nbsp</td>
													<td align="right" width="274">

														<table id="product_option" width="100%" border="0"
															cellpadding="0" cellspacing="0" class="cmfont">
															<tr>
																<td align="right"><font color="EF3F25"><b>${max }</b></font> 개의 상품.&nbsp;&nbsp;&nbsp</td>
																<td width="100"><select name="sort" size="1"
																	class="cmfont" onChange="form2.submit()">
																		<option value="new" selected>신상품순 정렬</option>
																		<option value="up">고가격순 정렬</option>
																		<option value="down">저가격순 정렬</option>
																		<option value="name">상품명 정렬</option>
																</select></td>
															</tr>
														</table>


												</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form> 
				
				<!-- form2 -->

				<table id="AllProduct-Table" border="0" cellpadding="0" cellspacing="0"></table>
			</br>
			<table width="800" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30" class="cmfont" align="center">
						<c:choose>
								<c:when test="${max == 0}">
									<c:set var="getMax" value="${max+1 }" />
								</c:when>
								<c:otherwise>
									<c:set var="getMax" value="${max }" />
								</c:otherwise>
							</c:choose>
							 <fmt:parseNumber var="totalPage" value="${(((getMax-1)/5)+1)}"
								integerOnly="true" /> <c:choose>
								<c:when test="${param.page > 5 }">
									<fmt:parseNumber var="startPage"
										value="${((param.page-1)/totalPage) * totalPage + 1} "
										integerOnly="true" />
								</c:when>
								<c:otherwise>
									<fmt:parseNumber var="startPage"
										value="${((1-1)/totalPage) * totalPage + 1} "
										integerOnly="true" />
								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${endPage > totalPage }">
									<fmt:parseNumber var="endPage"
										value="${((startPage + totalPage ) -1) } " integerOnly="true" />
								</c:when>
								<c:otherwise>
									<fmt:parseNumber var="endPage" value="${totalPage}"
										integerOnly="true" />
								</c:otherwise>
							</c:choose>
							<div id="underpoint" class="pager">
								<ul>
									<c:choose>
										<c:when test="${startPage <= param.page && param.page != 1}">
											<a href="member?page=${(param.page-1) }"><img
												src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif"
												align="absmiddle" border="0"> </a>
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif"
												align="absmiddle" border="0">
										</c:otherwise>
									</c:choose>

									<c:forEach begin="${startPage }" end="${startPage+4}" step="1"
										var="i" varStatus="status">

										<c:choose>
											<c:when test="${totalPage >= i }">
												<c:choose>
													<c:when test="${param.page == i }">
														<li><font color="red">[${i }]</font></li>
													</c:when>
													<c:otherwise>
														<li><a href="member?page=${i }">[${i }]</a></li>
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
											<a href="member?page=${(param.page+1) }"><img
												src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif"
												align="absmiddle" border="0"> </a>
										</c:when>
										<c:when test="${totalPage <= param.page }">
											<img
												src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif"
												align="absmiddle" border="0">
										</c:when>
									</c:choose>
								</ul>
							</div></td>
					</tr>
				</table> 
		<!-------------------------------------------------------------------------------------------->
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