<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- DB연결 정보 Connection & java.sql.* import -->
<%@ include file="connection.jsp" %>    
<%
	/* updateForm.jsp 에서 전달된 파라미터 */
	String strNum = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	// 사용자가 변경한 값으로 변경할 것이다. ?, ?
	String sql ="UPDATE member SET name =?, addr=? WHERE num=?";
	PreparedStatement pstmt = null;
	try{
		pstmt = conn.prepareStatement(sql);
		int num = Integer.parseInt(strNum);
		pstmt.setString(1,name);
		pstmt.setString(2,addr);
		pstmt.setInt(3,num);
		
		int result = pstmt.executeUpdate();
%>
<script>
	alert('<%=result%>개의 행 수정완료!');
	location.href='memberList.jsp';
</script>
<%		
	}catch(Exception e){
%>
<script>
	alert('수정 작업 실패');
	history.go(-1);
</script>
<%		
	}finally{
		if(pstmt != null)pstmt.close();
		if(conn != null)conn.close();
	}
	
	
%>