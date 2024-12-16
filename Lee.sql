create view emp_dno (eno, ename, title)
as select empno, empname, title
from employee
where dno = 3;

create view emp_planning2 
as select e.empname, e.title, e.salary
from employee e, department d
where e.dno = d.deptno
and d.deptname = '기획';

--뷰에 있는 열이어야 함
select * from emp_dno where ename = '이수민';

--뷰에 있는 열이어야 함
select * from emp_planning1 where title = '부장';

create view avg_sal1(dno, avgsal)
as select dno, avg(salary)
from employee
group by dno;

select * from avg_sal;

-- 집단함수는 update는 안 됨
update avg_sal
set avgsa1 = 1000000
where dno = 2;

-- 문자열은 대소문자 구분이므로 다 대문자로 해줘야 한다
select * from all_catalog where owner = 'LEE';

--'EMPLOYEE' 역시 대문자로
select table_name, column_name, data_type from User_tab_columns where table_name = 'EMPLOYEE';

select view_name, text from user_views;
create index empdno_idx on employee(dno);

-- 인덱스 생성
create index empdno_idx on employee(dno);

-- distinct 확인
SELECT INDEX_NAME,INITIAL_EXTENT,DISTINCT_KEYS, 
NUM_ROWS,SAMPLE_SIZE,LAST_ANALYZED 
FROM USER_INDEXES 
WHERE INDEX_NAME = 'EMPDNO_IDX';

insert into employee values (2000, '조이', '사원', 2106, 1500000, '1996-01-05', 2);

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