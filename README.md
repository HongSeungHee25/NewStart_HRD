# 과정평가형 정보처리산업기사 
### 1. 오라클 데이터 베이스 생성
SQL > connect system
SQL > system 패스워드 입력
1️⃣ 계정 생성
SQL > create user <만들고자 하는 DB ID> identified by <비밀번호>;
2️⃣ 생성한 계정이 DBMS 사용할 수 있는 권한 설정
SQL > grant resource, connect to <위에서 입력한 DB ID>;
3️⃣ 생성한 계정으로 접속
SQL > connect<위에서 입력한 DB ID/PW>
