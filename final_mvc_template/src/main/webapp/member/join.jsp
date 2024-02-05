<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
<form id="joinForm" action="joinSubmit.mc" method="post">
	<table class="join">
		<tr>
			<td colspan="2"><h1>회원가입</h1></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" autofocus required placeholder="이름 작성" /></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="email" name="id" required placeholder="ID 작성" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pass" required placeholder="비밀번호 작성"/></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<!-- 서버에서도 비밀번호 확인할 수 있도록 name 추가 -->
			<td><input type="password" id="re_pass" name="re_pass" required placeholder="비밀번호 확인"/></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="number" name="age" required placeholder="나이 작성"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
					<input type="radio" name="gender" value="male" checked/> 남성
				</label>
				<input type="radio" id="female" name="gender" value="female"/>
				<label for="female"> 여성 </label>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" onclick="javascript:directJoin();" value="회원가입" />
				 | 
				<button type="button" onclick="javascript:directLogin();">로그인</button>
			</td>
		</tr>
	</table>
</form>
</section>
<script>
	/* login page로 이동 */
	function directLogin(){
		
	}

	/* 회원가입 요청 처리 */
	function directJoin(){
		var form = document.getElementById("joinForm");
		var u_id = form.id;
		var u_pass = form.pass;
		var u_re_pass = document.getElementById("re_pass");
		var u_age = form.age;
		
		var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;       // 이메일
		
		console.log(regexEmail.test(u_id.value));
		
		if(!regexEmail.test(u_id.value)){
			alert('아이디는 이메일 형식으로 작성해주세요.');
			u_id.value = "";
			u_id.focus();
		}else if(u_pass.value.length > 8 || u_pass.value.length < 4){
			alert('비밀번호는 4~8글자이내에서 작성해주세요.');
			u_pass.value="";
			u_pass.focus();
		}else if(u_pass.value != u_re_pass.value){
			console.log(u_pass);
			console.log(u_re_pass);
			alert('비밀번호가 임마 일치하지 않습니다.');
			u_re_pass.value="";
			u_re_pass.focus();
		}else if(u_age.value == null || u_age.value == '' || isNaN(u_age.value)){
			u_age.value="";
			u_age.focus();
		}else{
			form.submit();
		}
	}
</script>
<%@ include file="/common/footer.jsp"  %>






