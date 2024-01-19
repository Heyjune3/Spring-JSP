#### Eclipse IDE for Enterprise Java and Web Developers
- (JSP로 개발 시 다운로드)

# 스프링
## 스프링 다운로드
- 브라우저 주소창 spring.io
    - 상단 projects 메뉴바에 **Spring Tools 4**
    - 내려가다보면 Spring Tools 4 for Eclipse에 WINDOWS용 클릭
    - jar파일 다운로드 후 해당폴더로 이동 후 더블클릭(UnZip)
    - 압춘 푼 폴더 내 exe파일 바로가기 생성
> 바로가기 실행 후 Eclipse처럼 파일 생성할 폴더 지정 후 Launch
>> Help -> EclipseMarketPlace
>>> web 검색 -> Eclipse IDE for Enterprise Java and Web Developers Install

### 서버등록
- File -> New -> Others -> Server -> Server -> Next
    - 다운받은 톰캣 넣기
        - Apache 맨 마지막 Tomcat v10.1 Server
        - Next 후 압축해제한 Tomcat 폴더 지정 후 Finish
### 한글등록
1. Preferences에서 검색 -> encoding
2. Web CSS Files, HTML Files, JSP Files의 Encoding을
3. ISO 10646/Unicode(UTF-8)로 지정 후 각각 Apply 후 Apply and Close

##### (※ http = port 8080번, https = port 8443번)

## 스프링 실행
1. New -> others -> Web -> Dynamic Web Project
2. 자바 프로젝트처럼 이름 지정후 Next2번
3. Gnerate... 체크박스 체크 후 Finish

- webapp = 웹 표준 : **정적인** 구현되어있는 페이지만 출력
    - META-INF : 웹을 짜기 위한 초기 세팅
    - WEB-INF : 웹을 짜기 위한 초기 세팅
        - lib : lib pakage에 넣으면 자동 등록
        - web.xml : 따로 설정할 수 있도록 세팅
        <br>=  **최초에 한번만** 등록된 걸 실행될 수 있게 만들어줌
        <br>=> 다음 실행시 재실행 시켜줘야함
        <br>**프로젝트 내 web.xml**이 Servers의 web.xml 보다 우선권을 가짐
        <br>
### 파일 생성
- WEB-INF 폴더 내 web.xml의
 ```
 <welcome-file></welcome-file>
 ```
 을
 ```
 <welcome-file>home.html</welcome-file>
 ```
 로 지정
 - 이후 webapp에 새로운 HTML 파일 생성
    - 파일 명을 위의 home.html로 지정
```
<title>home.html</title>
```
 - Run as = run on server -> Next 후 configured 에 서버 확인 후 finish
 - web.xml이 등록이 됨
 - 실행
### Path
contextPath
- Console이 있는 위치에 Servers에 실행되고 있는 서버 더블클릭
    - Modules에 Web Modules에 우측에 Edit...클릭
    - Path를 /로 변경가능
    - Path를 변경할 시저장 후 콘솔 정지 실행하듯  Servers를 재실행
    - 경로 자체가 localhost로 바뀜