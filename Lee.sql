create view emp_dno (eno, ename, title)
as select empno, empname, title
from employee
where dno = 3;

create view emp_planning2 
as select e.empname, e.title, e.salary
from employee e, department d
where e.dno = d.deptno
and d.deptname = '��ȹ';

--�信 �ִ� ���̾�� ��
select * from emp_dno where ename = '�̼���';

--�信 �ִ� ���̾�� ��
select * from emp_planning1 where title = '����';

create view avg_sal1(dno, avgsal)
as select dno, avg(salary)
from employee
group by dno;

select * from avg_sal;

-- �����Լ��� update�� �� ��
update avg_sal
set avgsa1 = 1000000
where dno = 2;

-- ���ڿ��� ��ҹ��� �����̹Ƿ� �� �빮�ڷ� ����� �Ѵ�
select * from all_catalog where owner = 'LEE';

--'EMPLOYEE' ���� �빮�ڷ�
select table_name, column_name, data_type from User_tab_columns where table_name = 'EMPLOYEE';

select view_name, text from user_views;
create index empdno_idx on employee(dno);

-- �ε��� ����
create index empdno_idx on employee(dno);

-- distinct Ȯ��
SELECT INDEX_NAME,INITIAL_EXTENT,DISTINCT_KEYS, 
NUM_ROWS,SAMPLE_SIZE,LAST_ANALYZED 
FROM USER_INDEXES 
WHERE INDEX_NAME = 'EMPDNO_IDX';

insert into employee values (2000, '����', '���', 2106, 1500000, '1996-01-05', 2);

select * from employee;

SELECT INDEX_NAME,INITIAL_EXTENT,DISTINCT_KEYS, 
NUM_ROWS,SAMPLE_SIZE,LAST_ANALYZED 
FROM USER_INDEXES 
WHERE INDEX_NAME = 'EMPDNO_IDX'; 

SELECT *
FROM USER_INDEXES 
WHERE table_NAME = 'EMPLOYEE'; 

SELECT *
FROM USER_IND_COLUMNS
WHERE table_NAME = 'EMPLOYEE'; 