<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@ include file="checkAdmin.jsp" %>
<%
	String strNum = request.getParameter("num");
	MemberVO m = null;
	
	Connection conn = JDBCUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM test_member WHERE num = ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(strNum));
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			m = new MemberVO(
				rs.getInt(1),				// num
				rs.getString(2),			// id
				rs.getString(3),			// pass
				rs.getString(4),			// name
				rs.getString(5),			// addr
				rs.getString(6),			// phone
				rs.getString(7),			// gender
				rs.getInt(8)				// age
			);
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCUtil.close(conn, pstmt, rs);
	}
%>

<section>
<!-- memberUpdateForm.jsp -->
<script type="text/javascript" src="js/inputCheck.js"></script>
<form action="memberUpdate.jsp" method="POST">
	<table>
		<tr>
			<th colspan="2"><h1>회원정보 수정</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
			<!-- disabled : 아예 사용하지 않겠다.  readonly : 변경하지 않겠다. -->
				<input type="text" name="id" data-msg="아이디" value="<%=m.getId()%>" readonly onclick="alert('id는 변경할 수 없습니다.');"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호" value="<%=m.getPass()%>"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" data-msg="이름" value="<%=m.getName()%>"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" data-msg="주소" value="<%=m.getAddr()%>"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" data-msg="전화번호" value="<%=m.getPhone()%>"/>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
				<input type="radio" name="gender" value="남성" 
				<%= m.getGender().equals("남성") ? "checked" : "" %>/>
				남성
				</label>
				<label>
				<input type="radio" name="gender" value="여성" 
				<%= m.getGender().equals("여성") ? "checked" : "" %>/>
				여성
				</label>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" data-msg="나이" value="<%=m.getAge()%>"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button>회원 정보 수정</button>
			</th>
		</tr>
	</table>
</form>
</section>
<%@ include file="common/footer.jsp" %>









