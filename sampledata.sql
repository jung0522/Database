-- DEPARTMENT ���̺� ����
CREATE TABLE DEPARTMENT (
	DEPTNO	NUMBER	NOT NULL,
	DEPTNAME	CHAR(10),
	FLOOR		NUMBER,
	PRIMARY KEY(DEPTNO)
);

INSERT INTO DEPARTMENT VALUES(1, '����', 8);
INSERT INTO DEPARTMENT VALUES(2, '��ȹ', 10);
INSERT INTO DEPARTMENT VALUES(3, '����', 9);
INSERT INTO DEPARTMENT VALUES(4, '�ѹ�', 7);

-- EMPLOYEE ���̺� ����
CREATE TABLE EMPLOYEE (
	EMPNO	NUMBER	NOT NULL,
	EMPNAME	CHAR(10)	UNIQUE,
	TITLE	CHAR(10)	DEFAULT '���',
	MANAGER	NUMBER,
	SALARY NUMBER	CHECK (SALARY < 6000000),
	DNO	NUMBER DEFAULT 1 CHECK (DNO IN (1,2,3,4)),
	PRIMARY KEY(EMPNO),
  FOREIGN KEY(MANAGER) REFERENCES EMPLOYEE(EMPNO),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO) ON DELETE CASCADE
);

INSERT INTO EMPLOYEE VALUES(4377, '�̼���', '����', NULL, 5000000, 2);
INSERT INTO EMPLOYEE VALUES(3426, '�ڿ���', '����', 4377, 3000000, 1);
INSERT INTO EMPLOYEE VALUES(3011, '�̼���', '����', 4377, 4000000, 3);
INSERT INTO EMPLOYEE VALUES(3427, '����ö', '���', 3011, 1500000, 3);
INSERT INTO EMPLOYEE VALUES(1003, '������', '����', 4377, 3000000, 2);
INSERT INTO EMPLOYEE VALUES(2106, '��â��', '�븮', 1003, 2500000, 2);
INSERT INTO EMPLOYEE VALUES(1365, '����', '���', 3426, 1500000, 1);

-- EMP_PLANNING �� ����
CREATE VIEW EMP_PLANNING
AS
SELECT E.EMPNAME, E.TITLE, E.SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DEPTNO AND D.DEPTNAME='��ȹ';
