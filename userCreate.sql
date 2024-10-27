alter session set "_oracle_script"=true;

-- KIM, LEE 사용자 생성하기
Create User Kim Identified By Bluesky
  Default Tablespace Users
  Temporary Tablespace Temp;

Create User Lee Identified By Redsun
  Default Tablespace Users
  Temporary Tablespace Temp;

-- Grant 명령으로 접속, 사용 권한 주기
Grant Connect, Resource, Create Session, Create View To Kim;
Grant Connect, Resource, Create Session, Create View To Lee;

-- Kim 비번 변경하기
ALTER USER KIM identified by shinystar;