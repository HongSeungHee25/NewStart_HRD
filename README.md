# 과정평가형 정보처리산업기사 
### 1. 오라클 데이터 베이스 생성
SQL > connect system <br>
SQL > system 패스워드 입력<br>
1️⃣ 계정 생성<br>
SQL > create user <만들고자 하는 DB ID> identified by <비밀번호>;<br>
2️⃣ 생성한 계정이 DBMS 사용할 수 있는 권한 설정<br>
SQL > grant resource, connect to <위에서 입력한 DB ID>;<br>
3️⃣ 생성한 계정으로 접속<br>
SQL > connect<위에서 입력한 DB ID/PW><br>

### 2. 개발환경 세팅
window ▶ Preferences ▶ Encoding ▶ Workspace, CSS Files, HTML Files, JSP Files ▶ UTF-8 로 변경<br>
Servers  ▶ HTTP/1.1 8080 은 오라클에서 사용하고 있으므로 충돌남. 다른 Port Number 로 변경 후 저장<br>
main ▶ webapp ▶ WEB-INF ▶ lib 에 jdbc 연결을 위해 ojdbc6.jar 파일 복붙해서 넣기 <br>

### 3. 테이블 생성(Create, Insert)
Open Perspective ▶ Database Development Open ▶ Database Connections 마우스 오른쪽 클릭 ▶ New ▶ Oracle 선택 후 Name 변경 ▶ 오라클 드라이버 추가<br>
![image](https://github.com/HongSeungHee25/NewStart_HRD/assets/127941381/881f70a6-6a5e-4791-89d1-5f806722bafd)<br>
![image](https://github.com/HongSeungHee25/NewStart_HRD/assets/127941381/8a22e239-f905-43d2-8fce-5b874175487b)<br>
