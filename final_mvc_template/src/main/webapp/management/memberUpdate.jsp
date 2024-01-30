<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<section class="wrap">
<form action="<c:url value='/managementUpdate.mc'/>" method="POST">
	<table>
		<tr>
			<td colspan=2><h3>회원정보 수정</h3></td>
		</tr>
		<tr>
			<td>회원번호</td>
			<td>
				<input type="text" name="num" value="" readonly />
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" value="" readonly />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" value="" required />
				<button type="button" onclick="changePass(this);">비밀번호 보기</button>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" value="" required />
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
					<input type="radio" name="gender" value="male" /> 남성
				</label>
					<input type="radio" id="female" name="gender" value="female"/>
				<label for="female"> 여성 </label>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="수정완료"/>
			</td>
		</tr>
	</table>
</form>
<script>
	function changePass(btn){
		let el = btn.parentNode.firstElementChild;
		console.log(el);
		let attr = el.getAttribute("type");
		if(attr == 'password'){
			el.setAttribute('type','text');
			btn.innerText = '비밀번호 감추기';
		}else{
			el.setAttribute('type','password');
			btn.innerHTML = '비밀번호 보기';
		}
	}
</script>
</section>
<%@ include file="/common/footer.jsp" %>























