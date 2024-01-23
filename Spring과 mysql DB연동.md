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


### mysql 파일 eclipse로 열기
- help -> install new Software -> https://download.eclipse.org/releases/2023-09/ <br/>-> Database Development -> 다운로드 목록 확인 후 Finish -> selectAll
- Window ->  show View -> Data Source Explorer
	- 밑의 console 창에 Data Source Explorer 창 생성
	- 창 내의 Database Connections에 우클릭 후 New..
	- Mysql 지정 후 next 
	- Database : 사용할 데이터베이스 이름 지정
	- URL : ex> jdbc:mysql://localhost:3306/database
	- User name : 사용자 이름 지정
	- password : 비밀번호
- 상단 Drivers 콤보박스 우측에 New Driver Definition
	- Name/Type : 사용할 Mysql Driver 클릭 ex> 5.1
	- JAR List : 원래 있던 파일 Remove JAR/Zip <br/>
	-> Add JAR/Zip -> mysql-connector-J 파일 등록
- Test Connection 후 Finish
- Data Source Explorer에 New MySQL 우측 클릭 후 Connect
#### mysql 파일 생성
- Project Explorer에 New -> SQLfile 생성
	- File name : 파일 이름
	- Database server type : MySQL 5.1
	- Connection profile name : 위의 생성된 New MYSQL
	- Database name : 위의 지정한 데이터베이스 이름
	- Finish