-- 질의1 : DEPARTMEMT 릴레이션에서 부서 이름과 부서 번호를 검색하라.
select deptname, deptno from department;

-- 질의2: EMPLOYEE 릴레이션의 모든 애트리뷰트를 검색하라. 
select * from employee;

-- 질의3 : Employee 릴레이션에서 직급 애트리뷰트를 검색하라.
select distinct title from employee;

-- 질의4: 3번 부서에서 근무하는 모든 사원들의 이름과 직급을 검색하라.
SELECT title, empname
FROM employee
WHERE dno = 3
ORDER BY dno, salary desc; -- select 절에 없어도 이에 맞게 수정됨

-- 질의5: 직급이 과장인 모든 사원들의 이름을 검색하라.
select empname
from employee 
where ( title = '과장' );

-- ?질의6: 2000년 2월 1일 이후에 입사한 모든 사원들의 이름과 입사일을 검색하라.
select empname, hiredate
from employee
where hiredate >= '2000-02-01' -- ' ' 잊지 마셈
order by hiredate;

-- 질의7: 직급이 과장이 아닌 모든 사원들의 이름과 직급을 검색하라.
select empname, title
from employee 
where ( title <> '과장' );

-- 질의8: 부서 2에 근무하면서 매월 2,500,000원보다 많은 급여를 받는 모든 사원들의 이름, 직급, 급여를 검색하라. 
select empname, title, salary
from employee 
where ( (dno = 2) AND (salary >= 2500000) );

-- 질의9: 급여가 2,000,000에서 3,000,000원사이인 모든 사원들의 이름, 직급, 급여를 검색하라.
select empname, title, salary
from employee 
where ( (salary <= 3000000) AND (salary >= 2000000) );


-- 질의9: // between 2000000 and 3000000
select empname, title, salary
from employee 
where ( salary between 2000000 and 3000000 );

-- 질의10 : 직급이 과장이 아니면서 급여가3,000,000원보다많은모든 사원들의 이름, 직급, 급여를 검색하라. (2가지)
select empname, title, salary
from employee 
where ( (salary >= 3000000) AND (title <> '과장') );

-- 질의10 : 직급이 과장이 아니면서 급여가3,000,000원보다많은모든 사원들의 이름, 직급, 급여를 검색하라. (2가지)
select empname, title, salary
from employee 
where ( (salary >= 3000000) AND (title not in '과장') );

-- ?질의11: 직급이 대리이거나 과장이거나 부장인 모든 사원들의 이름, 직급, 부서번호를 검색하라. (or / IN)
select empname, title, salary
from employee 
where ( title in ('과장', '부장', '대리') );
// (title <> '대리') or (title <> '과장') or (title <> '부장')

-- ?질의11: 직급이 대리이거나 과장이거나 부장인 모든 사원들의 이름, 직급, 부서번호를 검색하라. (or / IN)
select empname, title, salary
from employee 
where ( (title <> '대리') or (title <> '과장') or (title <> '부장') );

-- 질의12 : 2번 부서에 근무하면서 직급이 대리이거나 과장인 모든 사원들의 이름, 직급 부서번호를 검색하여라
SELECT empname, title, dno
FROM employee
WHERE ( (dno = 2) AND (title = '대리' OR title = '과장') );  -- 직급이 대리이거나 과장인 경우

-- 질의12 : 2번 부서에 근무하면서 직급이 대리이거나 과장인 모든 사원들의 이름, 직급 부서번호를 검색하여라
SELECT empname, title, dno
FROM employee 
WHERE ( (dno = 2) and (title in ( '대리', '과장') ) );

--  ?질의13 : 김씨 성을 가진 모든 사원들의 이름과 직급을 검색하라. !
SELECT empname, title
FROM employee 
WHERE  empname like '김%'; -- like

-- ?질의14 : 직속상사가 없는, 즉 가장 높은 사원의 이름과 직급을 검색하라.
SELECT empname, title
FROM employee 
WHERE manager is null;

-- 질의15 : 모든 사원들의 급여와 이름을 검색하여 급여에 따라 (오름차순/내림차순)으로정렬하라.
SELECT empname, salary  -- 급여를 포함하여 선택
FROM employee 
ORDER BY salary DESC;  -- 급여에 따라 내림차순으로 정렬

-- 질의16 : 모든 사원들의 급여와 이름을 검색하여 부서 번호에 대해서는 오름차순으로, 급여에 대해서는 내림차순으로 정렬하라.
SELECT empname, salary  -- 급여를 포함하여 선택
FROM employee 
ORDER BY dno asc, salary DESC;

-- ?질의17: 3번 부서에 근무하는 사원들의 수와 평균급여를 검색하라. !
select count(dno), avg(salary)
from employee
where dno =3;

-- ?질의18: 모든 사원들에 대해서 이름과 근무하는 층을 검색하라. (where절을 사용하는 경우와 내부 조인을 이용하는 경우 연습) !
SELECT e.empname, d.floor
FROM employee e, department d
WHERE e.dno = d.deptno;

-- ?질의18: 모든 사원들에 대해서 이름과 근무하는 층을 검색하라. (where절을 사용하는 경우와 내부 조인을 이용하는 경우 연습) !
SELECT e.empname, d.floor
FROM employee e
inner join department d on e.dno = d.deptno;

-- 질의19 : 개발 부서에 근무하는 모든 사원들에 대해서 이름과 직급을 검색하라. !
SELECT empname, title, d.deptname
FROM employee e, department d
WHERE e.dno = 
( select deptno 
from department 
where deptname = '개발');

-- ?질의20 : 김상원과 같은 부서에 근무하는 사원들의 이름과 직급을 검색하여라
SELECT empname, title
FROM employee 
WHERE dno in 
( select dno
from employee 
where empname = '김상원');

-- 질의21 : 전체 사원들의 평균 급여보다 급여가 높은 사원들의 이름을 검색하라. 
SELECT empname
FROM employee 
WHERE salary >
( select avg(salary)
from employee); 

-- ?질의22 : 8층이나 9층에 위치한 부서에 근무하는 사원들의 이름을 검색하라. !
SELECT empname
FROM employee 
WHERE dno in -- in 써줘야 함 값이 여러개가 리턴되기 때문이다
( select deptno
from department
where floor in (8, 9) ); 

-- ?질의22 : 8층이나 9층에 위치한 부서에 근무하는 사원들의 이름을 검색하라. !
SELECT empname, title
FROM employee e, department d
WHERE e.dno = d.deptno and d.floor in (8, 9);

-- ?질의23: 소속사원이 한 명도 없는 부서에 대해서 부서번호, 부서이름, 층을 검색하라. !
SELECT deptno, deptname, floor
FROM department
WHERE deptno NOT IN (  
    SELECT dno
    FROM employee
);

-- ?질의23: 소속사원이 한 명도 없는 부서에 대해서 부서번호, 부서이름, 층을 검색하라. !
SELECT deptno, deptname, floor
FROM department d
WHERE NOT EXISTS (  -- 사원이 존재하지 않는 부서 필터링
    SELECT *
    FROM employee e
    WHERE e.dno = d.deptno  -- 부서 번호와 일치하는 사원이 있는지 확인
);

-- ?질의23: 소속사원이 한 명도 없는 부서에 대해서 부서번호, 부서이름, 층을 검색하라. !
SELECT deptno, deptname, floor
FROM department d
where not exists (select d.deptno
from employee e
where e.dno=d.deptno);

-- ?질의24 : 조민희와 같은 부서에서 근무하면서 같은 직급을 가진 사원들의 이름, 직급, 부서번호를 검색하라. (1. 상관중첩질의/ 2 튜플의 비교)
SELECT empname, title, dno
FROM employee e1
where (e1.dno, e1.title) in
(select e2.dno, e2.title
from employee e2
where e2.empname = '조민희');

SELECT empname, title, dno
FROM employee e1
WHERE e1.dno = (SELECT dno FROM employee WHERE empname = '조민희')  -- 조민희와 같은 부서
AND e1.title = (SELECT title FROM employee WHERE empname = '조민희');  -- 조민희와 같은 직급

-- ?질의24 : 조민희와 같은 부서에서 근무하면서 같은 직급을 가진 사원들의 이름, 직급, 부서번호를 검색하라. (1. 상관중첩질의/ 2 튜플의 비교)
SELECT empname, title, dno
FROM employee e1
WHERE (e1.dno, e1.title) IN (  -- 부서 번호와 직급을 튜플로 비교
    SELECT e2.dno, e2.title
    FROM employee e2
    WHERE e2.empname = '조민희'
);

-- 질의25. : 부서별로부서의이름과 급여의평균을검색하라.(별칭사용)
-- e.salary 두 번 나와서 오류 발생 max(e.slary) 집단 함수는 2번 이상 나와도 ok
SELECT d.deptname ,avg(e.salary) as avg_salary 
FROM department d, employee e
where d.deptno = e.dno
group by d.deptname;



-- 질의25. : 부서별로 부서의 이름과 급여의 평균을 검색하라.(별칭사용)
SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d, employee e
WHERE d.deptno = e.dno
GROUP BY d.deptname; --select 절에 애트리뷰트는 group by 절에도 포함

-- 질의26 : 부서에 속한 직원들의 급여의 합계가 10,000,000원과 15,000,000원 사이인 부서에 대하여 부서별로 부서 이름과 급여의 합계를 검색하라. 
select d.deptname, sum(e.salary) as sum_salary
from department d, employee e
where d.deptno = e.dno
group by d.deptname
having sum(e.salary) between 10000000 and 15000000;

SELECT empname, title
FROM employee
order by dno, salary desc; 
// dno 부서 번호도 

SELECT count(empno) as numberOfEmployee, avg(Salary) as numberOfSalary
FROM employee
where dno = 3; 
// as로 이름 변경 가능

SELECT EMPNO, AVG(SALARY)
FROM EMPLOYEE
GROUP BY EMPNO;

// 단일 값 x

select empname, floor
from department d, employee e
where d.deptno = e.dno;

SELECT e.empname, d.floor
FROM department d
inner JOIN employee e
ON d.deptno = e.dno;

select empname, floor
from department d, employee e
where d.deptno = e.dno and deptname = '개발';

       


SELECT deptno, deptname, floor
FROM department d
where not exists (select d.deptno
from employee e
where e.dno=d.deptno);

SELECT E1.EMPNAME AS EMPLOYEE, E2.EMPNAME AS MANAGER
FROM EMPLOYEE E1, EMPLOYEE E2
WHERE E1.MANAGER = E2.EMPNO;


SELECT empname, title, dno
from employee e
where (title, dno) = ( select title, dno from employee e where e.empname = '조민희');

SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d, employee e
WHERE d.deptno = e.dno
GROUP BY d.deptname;

SELECT d.deptname, SUM(e.salary) AS total_salary
FROM department d
INNER JOIN employee e ON d.deptno = e.dno
GROUP BY d.deptname
HAVING SUM(e.salary) BETWEEN 10000000 AND 15000000;

-- 문제1 1. 가장 오래 근무한 사원에 관한 모든 데이터를 검색하라.
SELECT * 
FROM EMPLOYEE
WHERE HIREDATE = (
    SELECT MIN(HIREDATE) FROM EMPLOYEE
);

--  2. 최종철과같은부서에근무하는사원에관한모든데이터를검색하라.
SELECT * 
FROM EMPLOYEE
WHERE DNO in (
    SELECT DNO 
    FROM EMPLOYEE 
    WHERE EMPNAME = '최종철'
);
-- AND EMPNAME != '최종철';

--  3. 회사의전체사원수를검색하라
select count(empno) -- count(*)
from employee;

--  4. 회사에몇개의부서가있는가를검색하라.
select count(deptno) -- count(*)
from department;

-- 5. 기획부에근무하는사원들의이름과직급을검색하라.
select empname, title
from employee
where dno = 
(select deptno
from department
where deptname ='기획');

-- 6. 한명이상의사원이근무하는부서의개수를검색하라.
select count(distinct dno)
from employee
WHERE DNO IS NOT NULL; -- 붙여주기

--  7. 사원이한명도근무하지않는부서를검색하라.
select deptname 
from department
where deptno not in
(select distinct dno -- distinct
from employee
where dno is not null);

--  7. 사원이한명도근무하지않는부서를검색하라.
SELECT deptname 
FROM department d
WHERE NOT EXISTS (
    SELECT 1 
    FROM employee e
    WHERE e.dno = d.deptno
);


--8. 사원이한명이상속한부서에대해서평균급여를검색하라. !!
 SELECT DNO, AVG(SALARY) AS 평균급여 FROM EMPLOYEE
 GROUP BY DNO;
 
 --9. 부서에속한사원들의평균급여가가장많은부서의이름과평균급여를검색하라.
SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d
JOIN employee e ON d.deptno = e.dno
GROUP BY d.deptname
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;  -- Oracle에서는 상위 1개만 가져올 때 사용

SELECT D.DEPTNAME, AVG(E.SALARY) AS 평균급여
FROM EMPLOYEE E , DEPARTMENT D 
WHERE E.DNO = D.DEPTNO 
GROUP BY D.DEPTNAME 
HAVING AVG(E.SALARY) = (SELECT MAX(AVG_SALARY) 
FROM (SELECT AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEE 
GROUP BY dno) ); -- employee의 애트리뷰트 꼭 select 절에 들어간 거 필요 x

--10. EMPLOYEE와DEPARTMENT 릴레이션을조인하고부서번호순서에따라정렬하라.
select * from employee e, department d 
where e.dno = d.deptno 
order by deptno;

--10. EMPLOYEE와DEPARTMENT 릴레이션을조인하고부서번호순서에따라정렬하라.
select * from employee e
join department d on e.dno = d.deptno 
order by deptno;

--11. 모든사원들을직급별로그룹화하고각그룹별사원수와평균급여를검색하라.
select count(empno) as 사원수, avg(salary) as 평균급여
from employee
group by title;

--11. 모든사원들을직급별로그룹화하고각그룹별사원수와평균급여를검색하라.
 SELECT TITLE, COUNT(*) AS 사원수, ROUND(AVG(SALARY), 2) AS 평균급여
FROM EMPLOYEE
 GROUP BY TITLE;

--12. 모든사원들을직급별로그룹화하고동일직급을갖는사원수가2명이상인직급에대해서직급, 사원수, 연간급여를검색하라.
 SELECT TITLE, COUNT(*) AS 사원수, SUM(SALARY*12) AS 연간급여
FROM EMPLOYEE
 GROUP BY TITLE
 HAVING COUNT(*) >= 2;
 
 --13. 직급이대리인사원이적어도2명이상속한부서의이름을검색하라.
 select d.deptname 
 from department d, employee e
 where e.dno = d.deptno and e.title = '대리'
 group by d.deptname
 having count(e.empno) >= 2;
 
 --10. EMPLOYEE와DEPARTMENT 릴레이션을조인하고부서번호순서에따라정렬하라.
 SELECT * 
FROM EMPLOYEE E, DEPARTMENT D
 WHERE E.DNO = D.DEPTNO
 ORDER BY D.DEPTNO;
 
 --14. 모든부서에대해서이름, 층, 각부서에근무하는사원수를검색하라. 사원이없는부서도포함시켜라.
 SELECT D.DEPTNAME, D.FLOOR, COUNT(E.EMPNO) AS 사원수
FROM DEPARTMENT D
left join EMPLOYEE E ON D.DEPTNO = E.DNO
 GROUP BY D.DEPTNAME, D.FLOOR;
 

--15. 부서1, 2, 3에공통으로있는직급을검색하라.
 SELECT TITLE FROM EMPLOYEE
 WHERE DNO IN (1, 2, 3)
 GROUP BY TITLE
 HAVING COUNT(DISTINCT DNO) = 3;
 
--18. 소속사원수가4명이하인부서의이름과사원수를검색하라.
select d.deptname, count(e.empno)
from department d, employee e
where d.deptno = e.dno
group by d.deptname
having count(e.empno) <= 4;

--19. 자신이속한부서의평균급여보다많이받는사원의이름, 부서번호, 급여를검색하라
SELECT e.empname AS 이름, 
       e.dno AS 부서번호, 
       e.salary AS 급여
FROM employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.dno = e.dno
    GROUP BY e2.dno
);

--20. 각부서에서가장많은급여를받는사원들의이름, 부서번호, 급여를검색하라.
select e.salary
from employee e
where e.salary =
(select max(e2.salary) 
from employee e2
WHERE e2.dno = e.dno
group by e2.dno);

 SELECT EMPNAME, DNO, SALARY
 FROM EMPLOYEE E1
 WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE E2 WHERE E1.DNO = E2.DNO);
 
 --22. 최종철또는이수민과같은직급을가진모든사원에대해서사원의이름과직급을검색하라.
 SELECT EMPNAME, TITLE
 FROM EMPLOYEE
 where title in 
 (select e2.title from employee e2 where e2.empname in ('최종철', '이수민') );
 
 --24. DEPARTMENT 릴레이션에튜플(5, '홍보', 8)을삽입하라
 insert into department values(5, '홍보', 8);
 
 --26. 부서번호2에근무하는사원들의급여를5% 인상하라.
 UPDATE EMPLOYEE
 SET SALARY = SALARY * 1.05
 WHERE DNO = 2;
 
 
 

