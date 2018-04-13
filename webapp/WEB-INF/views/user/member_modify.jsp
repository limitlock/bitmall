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
	$(function(){
		
		
		
		$("#find-zip").click(function(){
			alert("업데이트 예정");
		});
	
		$("#btn-reset").click(function(e){
			e.preventDefault();
			$("#form2")[0].reset();
		
		});
	
		
		
		$("#btn-modify").click(function(e) {
			var p1 = $("#password").val();
			var p2 = $("#password2").val()

			if (p1 != p2) {
				alert("비밀번호를 다시 확인해주세요.")
				e.preventDefault();
				return;
			}else if (p1=="" || p2==""){
				alert("비밀번호를 입력해주세요");
				e.preventDefault();
				return;
			}

			var birthday = +$("#birthday1").val() + $("#birthday2").val() + $("#birthday3").val();
			$("#birthday").val(birthday);

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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/member_edit.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>
			
			<form id="form2" name="form2" method="post" action="${pageContext.servletContext.contextPath }/user/member_modify">
			<input type="hidden" id="no" name="no" value="${authUser.no }"/>
			<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
				<tr>
					<td align="center" bgcolor="efefef">
						<table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>아이디</b></font>
											</td>
											<td>
												<input type="text" id="id" name="id" maxlength = "12" value="${authUser.id }" size="20" class="cmfont1" readonly> 
												<a href="javascript:check_id();"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0"></a>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호</b></font>
											</td>
											<td>
												<input TYPE="password" id = "password" name="password" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호 확인</b></font>
											</td>
											<td>
												<input TYPE="password" id = "password2" name="password2" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>이 름</b></font>
											</td>
											<td>
												<input type="text" name="name" maxlength = "10" value = "${authUser.name }" size="20" class="cmfont1" readonly>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>생년월일</b></font>
											</td>
											<td>
												<input type="text" id="birthday1" name='birthday1' size = "4" maxlength = "4" value = "${fn:substring(authUser.birthday,0,4) }" class="cmfont1" readonly> <font color="898989">년</font> 
												<input type="text" id="birthday2" name='birthday2' size = "2" maxlength = "2" value = "${fn:substring(authUser.birthday,4,6) }" class="cmfont1" readonly> <font color="898989">월</font> 
												<input type="text" id="birthday3" name='birthday3' size = "2" maxlength = "2" value = "${fn:substring(authUser.birthday,6,8) }" class="cmfont1" readonly> <font color="898989">일</font> 
												<input type="hidden" id="birthday" name="birthday" value=""/>
												<!-- <input type="radio" name='sm' value = "1" checked> <font color="898989">양력</font> 
												<input type="radio" name='sm' value = "2" > <font color="898989">음력</font></td> -->
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>전화 번호</b></font>
											</td>
											<td>
												<input type="text" id="tel1" name='tel1' size = "4" maxlength = "4" value = "${fn:substring(authUser.tel,0,3) }" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel2" name='tel2' size = "4" maxlength = "4" value = "${fn:substring(authUser.tel,3,7) }" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="tel3" name='tel3' size = "4" maxlength = "4" value = "${fn:substring(authUser.tel,7,11) }" class="cmfont1">
												<input type="hidden" id="tel" name="tel" value=""/>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<input type="text" id="phone1" name='phone1' size = "4" maxlength = "4" value = "${fn:substring(authUser.phone,0,3)}" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone2" name='phone2' size = "4" maxlength = "4" value = "${fn:substring(authUser.phone,3,7)}" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="phone3" name='phone3' size = "4" maxlength = "4" value = "${fn:substring(authUser.phone,7,11)}" class="cmfont1">
												<input type="hidden" id="phone" name="phone" value=""/>
											</td>
										</tr>
										<tr>
											<td width="127" height="50">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td>
												<input type="text" id="zip1" name='zip1' size = "4" maxlength = "3" value = "${fn:substring(authUser.zip,0,3)}" class="cmfont1"><font color="898989">-</font>
												<input type="text" id="zip2" name='zip2' size = "4" maxlength = "3" value = "${fn:substring(authUser.zip,3,6)}" class="cmfont1"> 
												<input type="hidden" id="zip" name="zip" value=""/>
												<a href="#" id="find-zip"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a><br>
												<input type="text" name='address' size = "50" maxlength = "200" value = "${authUser.address }" class="cmfont1"><br>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>E-Mail</b></font>
											</td>
											<td>
												<input type="text" name='email' size = "50" maxlength = "50" value = "${authUser.email }" class="cmfont1">
											</td>
										</tr>
									</table>
			
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td height="45" align="right">
						<input id="btn-modify" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_add.gif" border="0">&nbsp;&nbsp;
						<input id ="btn-reset" type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_reset.gif" border="0"></a>
					</td>
				</tr>
			</table>
			</form>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>