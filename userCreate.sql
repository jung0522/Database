alter session set "_oracle_script"=true;

-- KIM, LEE ����� �����ϱ�
Create User Kim Identified By Bluesky
  Default Tablespace Users
  Temporary Tablespace Temp;

Create User Lee Identified By Redsun
  Default Tablespace Users
  Temporary Tablespace Temp;

-- Grant ������� ����, ��� ���� �ֱ�
Grant Connect, Resource, Create Session, Create View To Kim;
Grant Connect, Resource, Create Session, Create View To Lee;

-- Kim ��� �����ϱ�
ALTER USER KIM identified by shinystar;