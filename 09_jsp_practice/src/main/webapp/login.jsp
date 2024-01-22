<%@ page pageEncoding="UTF-8"%>
 <!-- login.jsp -->
 <%@ include file="common/header.jsp"  %>
<section>
	<script type="text/javascript" src="js/input.js" ></script>
	 <form action="loginCheck.jsp" method="POST">
	 	<table>
	 		<tr>
	 			<td colspan="2"><h1>로그인</h1></td>
	 		</tr>
	 		<tr>
	 			<td>아이디</td>
	 			<td>
	 				<input type="text" name="id" data-msg="아이디"/>
				</td>
	 		</tr>
	 		<tr>
	 			<td>비밀번호</td>
	 			<td>
	 				<input type="password" name="pass" data-msg="비밀번호"/>
				</td>
	 		</tr>
	 		<!-- 로그인 상태 유지 기능 추가 -->
	 		<tr>
	 			<td colspan="2">
	 				<label><input type="checkbox" name="rememberMe" value="true"/>
	 				로그인 상태 유지
	 				</label>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2">
	 				<button>로그인</button>
	 			</td>
	 		</tr>
	 	</table>	
	 </form>
</section>
<%@ include file="common/footer.jsp"  %>
 
 
 
 
 
 
 
 
 