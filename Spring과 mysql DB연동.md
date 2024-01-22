### Library 다운로드 사이트 : Maven Repository
- https://mvnrepository.com/

## mysql-Connector J.jar
- 위 파일을 Spring 프로젝트에
- webapp -> WEB-INF -> lib 폴더에 추가
- Java Resources에 Libraries 내에 Web App Libraries에<br/>
  추가되어있는지 확인

## mysql
1. 스키마 생성
2. 계정 생성 및 권한 주기
    - Users and Privileges
    - 이름, 비밀번호 작성
    - Schema Privileges -> add Entry...
    -> selected schema : 해당 스키마 선택 후 ok
    - Apply위의 Select"ALL" 또는 원하는 권한 주고 Apply
3. 새로운 Connection 생성
    - Home 화면에 +키
    - Username을 위 계정 이름으로 작성
    - Default Schema를 위 생성한 스키마 이름으로 작성 후 생성
4. USE 스키마 이름;
5. 테이블 생성
    - CREATE TABLE IF NOT EXISTS member( ... );
6. 이후 생성된 sql파일을 프로젝트폴더에 저장

## Spring
- 메인.jsp 파일에서 코드 작성
```
<%
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/스키마이름";
		String userName = "계정 이름";
		String password = "비밀번호";
		// JDBC - 객체는 java.sql.*
		Connection conn = null;
		
		try{
		Class.forName(driver);
		out.println("Driver Class가 존재합니다.<br/>");
		conn = DriverManager.getConnection(url, userName, password);
		out.println("DB 연결 완료 : ");
		out.println(conn+"<br/>");
		}catch(ClassNotFoundException e){
			out.println("Driver class를 찾을 수 없습니다.");
		}catch(SQLException e){
			out.println("연결 요청 정보 오류 : " + e.toString());
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
```
- Connection 연결 확인 = Server 실행
