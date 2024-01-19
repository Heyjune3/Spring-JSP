<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrForm.jsp</title>
</head>
<body>
	<!-- 주소표시줄에서 경로를 찾아감 절대경로 /05_implict_object_scope/index.jsp -->
	<!-- <a href="/05_implict_object_scope/index.jsp">메인으로</a> <br/> -->
	<!-- 절대경로 contextPath로 주소를 뿌려줌 -->
	
	<!-- 
	Console창 옆의 Servers -> Modules -> 해당 Path 클릭 후 Edit.. -> Path를 간략히 ex)/05_implict
	-> 이후 Servers가 바뀐 거니 재실행 -> 개발자 창 확인 : <a href="/05_implict/index.jsp">메인으로</a>
	 -->
	<a href="<%=request.getContextPath()%>/index.jsp">메인으로</a> <br/>

	<form action="attrTest1.jsp" method="POST">
		아이디 : <input type="text" name="id" required />
		<button>확인</button>
	</form>
</body>
</html>