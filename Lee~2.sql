-- ����1 : DEPARTMEMT �����̼ǿ��� �μ� �̸��� �μ� ��ȣ�� �˻��϶�.
select deptname, deptno from department;

-- ����2: EMPLOYEE �����̼��� ��� ��Ʈ����Ʈ�� �˻��϶�. 
select * from employee;

-- ����3 : Employee �����̼ǿ��� ���� ��Ʈ����Ʈ�� �˻��϶�.
select distinct title from employee;

-- ����4: 3�� �μ����� �ٹ��ϴ� ��� ������� �̸��� ������ �˻��϶�.
SELECT title, empname
FROM employee
WHERE dno = 3
ORDER BY dno, salary desc; -- select ���� ��� �̿� �°� ������

-- ����5: ������ ������ ��� ������� �̸��� �˻��϶�.
select empname
from employee 
where ( title = '����' );

-- ?����6: 2000�� 2�� 1�� ���Ŀ� �Ի��� ��� ������� �̸��� �Ի����� �˻��϶�.
select empname, hiredate
from employee
where hiredate >= '2000-02-01' -- ' ' ���� ����
order by hiredate;

-- ����7: ������ ������ �ƴ� ��� ������� �̸��� ������ �˻��϶�.
select empname, title
from employee 
where ( title <> '����' );

-- ����8: �μ� 2�� �ٹ��ϸ鼭 �ſ� 2,500,000������ ���� �޿��� �޴� ��� ������� �̸�, ����, �޿��� �˻��϶�. 
select empname, title, salary
from employee 
where ( (dno = 2) AND (salary >= 2500000) );

-- ����9: �޿��� 2,000,000���� 3,000,000�������� ��� ������� �̸�, ����, �޿��� �˻��϶�.
select empname, title, salary
from employee 
where ( (salary <= 3000000) AND (salary >= 2000000) );


-- ����9: // between 2000000 and 3000000
select empname, title, salary
from employee 
where ( salary between 2000000 and 3000000 );

-- ����10 : ������ ������ �ƴϸ鼭 �޿���3,000,000�����ٸ������ ������� �̸�, ����, �޿��� �˻��϶�. (2����)
select empname, title, salary
from employee 
where ( (salary >= 3000000) AND (title <> '����') );

-- ����10 : ������ ������ �ƴϸ鼭 �޿���3,000,000�����ٸ������ ������� �̸�, ����, �޿��� �˻��϶�. (2����)
select empname, title, salary
from employee 
where ( (salary >= 3000000) AND (title not in '����') );

-- ?����11: ������ �븮�̰ų� �����̰ų� ������ ��� ������� �̸�, ����, �μ���ȣ�� �˻��϶�. (or / IN)
select empname, title, salary
from employee 
where ( title in ('����', '����', '�븮') );
// (title <> '�븮') or (title <> '����') or (title <> '����')

-- ?����11: ������ �븮�̰ų� �����̰ų� ������ ��� ������� �̸�, ����, �μ���ȣ�� �˻��϶�. (or / IN)
select empname, title, salary
from employee 
where ( (title <> '�븮') or (title <> '����') or (title <> '����') );

-- ����12 : 2�� �μ��� �ٹ��ϸ鼭 ������ �븮�̰ų� ������ ��� ������� �̸�, ���� �μ���ȣ�� �˻��Ͽ���
SELECT empname, title, dno
FROM employee
WHERE ( (dno = 2) AND (title = '�븮' OR title = '����') );  -- ������ �븮�̰ų� ������ ���

-- ����12 : 2�� �μ��� �ٹ��ϸ鼭 ������ �븮�̰ų� ������ ��� ������� �̸�, ���� �μ���ȣ�� �˻��Ͽ���
SELECT empname, title, dno
FROM employee 
WHERE ( (dno = 2) and (title in ( '�븮', '����') ) );

--  ?����13 : �达 ���� ���� ��� ������� �̸��� ������ �˻��϶�. !
SELECT empname, title
FROM employee 
WHERE  empname like '��%'; -- like

-- ?����14 : ���ӻ�簡 ����, �� ���� ���� ����� �̸��� ������ �˻��϶�.
SELECT empname, title
FROM employee 
WHERE manager is null;

-- ����15 : ��� ������� �޿��� �̸��� �˻��Ͽ� �޿��� ���� (��������/��������)���������϶�.
SELECT empname, salary  -- �޿��� �����Ͽ� ����
FROM employee 
ORDER BY salary DESC;  -- �޿��� ���� ������������ ����

-- ����16 : ��� ������� �޿��� �̸��� �˻��Ͽ� �μ� ��ȣ�� ���ؼ��� ������������, �޿��� ���ؼ��� ������������ �����϶�.
SELECT empname, salary  -- �޿��� �����Ͽ� ����
FROM employee 
ORDER BY dno asc, salary DESC;

-- ?����17: 3�� �μ��� �ٹ��ϴ� ������� ���� ��ձ޿��� �˻��϶�. !
select count(dno), avg(salary)
from employee
where dno =3;

-- ?����18: ��� ����鿡 ���ؼ� �̸��� �ٹ��ϴ� ���� �˻��϶�. (where���� ����ϴ� ���� ���� ������ �̿��ϴ� ��� ����) !
SELECT e.empname, d.floor
FROM employee e, department d
WHERE e.dno = d.deptno;

-- ?����18: ��� ����鿡 ���ؼ� �̸��� �ٹ��ϴ� ���� �˻��϶�. (where���� ����ϴ� ���� ���� ������ �̿��ϴ� ��� ����) !
SELECT e.empname, d.floor
FROM employee e
inner join department d on e.dno = d.deptno;

-- ����19 : ���� �μ��� �ٹ��ϴ� ��� ����鿡 ���ؼ� �̸��� ������ �˻��϶�. !
SELECT empname, title, d.deptname
FROM employee e, department d
WHERE e.dno = 
( select deptno 
from department 
where deptname = '����');

-- ?����20 : ������ ���� �μ��� �ٹ��ϴ� ������� �̸��� ������ �˻��Ͽ���
SELECT empname, title
FROM employee 
WHERE dno in 
( select dno
from employee 
where empname = '����');

-- ����21 : ��ü ������� ��� �޿����� �޿��� ���� ������� �̸��� �˻��϶�. 
SELECT empname
FROM employee 
WHERE salary >
( select avg(salary)
from employee); 

-- ?����22 : 8���̳� 9���� ��ġ�� �μ��� �ٹ��ϴ� ������� �̸��� �˻��϶�. !
SELECT empname
FROM employee 
WHERE dno in -- in ����� �� ���� �������� ���ϵǱ� �����̴�
( select deptno
from department
where floor in (8, 9) ); 

-- ?����22 : 8���̳� 9���� ��ġ�� �μ��� �ٹ��ϴ� ������� �̸��� �˻��϶�. !
SELECT empname, title
FROM employee e, department d
WHERE e.dno = d.deptno and d.floor in (8, 9);

-- ?����23: �Ҽӻ���� �� �� ���� �μ��� ���ؼ� �μ���ȣ, �μ��̸�, ���� �˻��϶�. !
SELECT deptno, deptname, floor
FROM department
WHERE deptno NOT IN (  
    SELECT dno
    FROM employee
);

-- ?����23: �Ҽӻ���� �� �� ���� �μ��� ���ؼ� �μ���ȣ, �μ��̸�, ���� �˻��϶�. !
SELECT deptno, deptname, floor
FROM department d
WHERE NOT EXISTS (  -- ����� �������� �ʴ� �μ� ���͸�
    SELECT *
    FROM employee e
    WHERE e.dno = d.deptno  -- �μ� ��ȣ�� ��ġ�ϴ� ����� �ִ��� Ȯ��
);

-- ?����23: �Ҽӻ���� �� �� ���� �μ��� ���ؼ� �μ���ȣ, �μ��̸�, ���� �˻��϶�. !
SELECT deptno, deptname, floor
FROM department d
where not exists (select d.deptno
from employee e
where e.dno=d.deptno);

-- ?����24 : ������� ���� �μ����� �ٹ��ϸ鼭 ���� ������ ���� ������� �̸�, ����, �μ���ȣ�� �˻��϶�. (1. �����ø����/ 2 Ʃ���� ��)
SELECT empname, title, dno
FROM employee e1
where (e1.dno, e1.title) in
(select e2.dno, e2.title
from employee e2
where e2.empname = '������');

SELECT empname, title, dno
FROM employee e1
WHERE e1.dno = (SELECT dno FROM employee WHERE empname = '������')  -- ������� ���� �μ�
AND e1.title = (SELECT title FROM employee WHERE empname = '������');  -- ������� ���� ����

-- ?����24 : ������� ���� �μ����� �ٹ��ϸ鼭 ���� ������ ���� ������� �̸�, ����, �μ���ȣ�� �˻��϶�. (1. �����ø����/ 2 Ʃ���� ��)
SELECT empname, title, dno
FROM employee e1
WHERE (e1.dno, e1.title) IN (  -- �μ� ��ȣ�� ������ Ʃ�÷� ��
    SELECT e2.dno, e2.title
    FROM employee e2
    WHERE e2.empname = '������'
);

-- ����25. : �μ����κμ����̸��� �޿���������˻��϶�.(��Ī���)
-- e.salary �� �� ���ͼ� ���� �߻� max(e.slary) ���� �Լ��� 2�� �̻� ���͵� ok
SELECT d.deptname ,avg(e.salary) as avg_salary 
FROM department d, employee e
where d.deptno = e.dno
group by d.deptname;



-- ����25. : �μ����� �μ��� �̸��� �޿��� ����� �˻��϶�.(��Ī���)
SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d, employee e
WHERE d.deptno = e.dno
GROUP BY d.deptname; --select ���� ��Ʈ����Ʈ�� group by ������ ����

-- ����26 : �μ��� ���� �������� �޿��� �հ谡 10,000,000���� 15,000,000�� ������ �μ��� ���Ͽ� �μ����� �μ� �̸��� �޿��� �հ踦 �˻��϶�. 
select d.deptname, sum(e.salary) as sum_salary
from department d, employee e
where d.deptno = e.dno
group by d.deptname
having sum(e.salary) between 10000000 and 15000000;

SELECT empname, title
FROM employee
order by dno, salary desc; 
// dno �μ� ��ȣ�� 

SELECT count(empno) as numberOfEmployee, avg(Salary) as numberOfSalary
FROM employee
where dno = 3; 
// as�� �̸� ���� ����

SELECT EMPNO, AVG(SALARY)
FROM EMPLOYEE
GROUP BY EMPNO;

// ���� �� x

select empname, floor
from department d, employee e
where d.deptno = e.dno;

SELECT e.empname, d.floor
FROM department d
inner JOIN employee e
ON d.deptno = e.dno;

select empname, floor
from department d, employee e
where d.deptno = e.dno and deptname = '����';

       


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
where (title, dno) = ( select title, dno from employee e where e.empname = '������');

SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d, employee e
WHERE d.deptno = e.dno
GROUP BY d.deptname;

SELECT d.deptname, SUM(e.salary) AS total_salary
FROM department d
INNER JOIN employee e ON d.deptno = e.dno
GROUP BY d.deptname
HAVING SUM(e.salary) BETWEEN 10000000 AND 15000000;

-- ����1 1. ���� ���� �ٹ��� ����� ���� ��� �����͸� �˻��϶�.
SELECT * 
FROM EMPLOYEE
WHERE HIREDATE = (
    SELECT MIN(HIREDATE) FROM EMPLOYEE
);

--  2. ����ö�������μ����ٹ��ϴ»�������Ѹ�絥���͸��˻��϶�.
SELECT * 
FROM EMPLOYEE
WHERE DNO in (
    SELECT DNO 
    FROM EMPLOYEE 
    WHERE EMPNAME = '����ö'
);
-- AND EMPNAME != '����ö';

--  3. ȸ������ü��������˻��϶�
select count(empno) -- count(*)
from employee;

--  4. ȸ�翡��Ǻμ����ִ°����˻��϶�.
select count(deptno) -- count(*)
from department;

-- 5. ��ȹ�ο��ٹ��ϴ»�������̸����������˻��϶�.
select empname, title
from employee
where dno = 
(select deptno
from department
where deptname ='��ȹ');

-- 6. �Ѹ��̻��ǻ���̱ٹ��ϴºμ��ǰ������˻��϶�.
select count(distinct dno)
from employee
WHERE DNO IS NOT NULL; -- �ٿ��ֱ�

--  7. ������Ѹ��ٹ������ʴºμ����˻��϶�.
select deptname 
from department
where deptno not in
(select distinct dno -- distinct
from employee
where dno is not null);

--  7. ������Ѹ��ٹ������ʴºμ����˻��϶�.
SELECT deptname 
FROM department d
WHERE NOT EXISTS (
    SELECT 1 
    FROM employee e
    WHERE e.dno = d.deptno
);


--8. ������Ѹ��̻���Ѻμ������ؼ���ձ޿����˻��϶�. !!
 SELECT DNO, AVG(SALARY) AS ��ձ޿� FROM EMPLOYEE
 GROUP BY DNO;
 
 --9. �μ������ѻ��������ձ޿������帹���μ����̸�����ձ޿����˻��϶�.
SELECT d.deptname, AVG(e.salary) AS avg_salary
FROM department d
JOIN employee e ON d.deptno = e.dno
GROUP BY d.deptname
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;  -- Oracle������ ���� 1���� ������ �� ���

SELECT D.DEPTNAME, AVG(E.SALARY) AS ��ձ޿�
FROM EMPLOYEE E , DEPARTMENT D 
WHERE E.DNO = D.DEPTNO 
GROUP BY D.DEPTNAME 
HAVING AVG(E.SALARY) = (SELECT MAX(AVG_SALARY) 
FROM (SELECT AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEE 
GROUP BY dno) ); -- employee�� ��Ʈ����Ʈ �� select ���� �� �� �ʿ� x

--10. EMPLOYEE��DEPARTMENT �����̼��������ϰ�μ���ȣ���������������϶�.
select * from employee e, department d 
where e.dno = d.deptno 
order by deptno;

--10. EMPLOYEE��DEPARTMENT �����̼��������ϰ�μ���ȣ���������������϶�.
select * from employee e
join department d on e.dno = d.deptno 
order by deptno;

--11. ������������޺��α׷�ȭ�ϰ��׷캰���������ձ޿����˻��϶�.
select count(empno) as �����, avg(salary) as ��ձ޿�
from employee
group by title;

--11. ������������޺��α׷�ȭ�ϰ��׷캰���������ձ޿����˻��϶�.
 SELECT TITLE, COUNT(*) AS �����, ROUND(AVG(SALARY), 2) AS ��ձ޿�
FROM EMPLOYEE
 GROUP BY TITLE;

--12. ������������޺��α׷�ȭ�ϰ������������»������2���̻������޿����ؼ�����, �����, �����޿����˻��϶�.
 SELECT TITLE, COUNT(*) AS �����, SUM(SALARY*12) AS �����޿�
FROM EMPLOYEE
 GROUP BY TITLE
 HAVING COUNT(*) >= 2;
 
 --13. �����̴븮�λ�������2���̻���Ѻμ����̸����˻��϶�.
 select d.deptname 
 from department d, employee e
 where e.dno = d.deptno and e.title = '�븮'
 group by d.deptname
 having count(e.empno) >= 2;
 
 --10. EMPLOYEE��DEPARTMENT �����̼��������ϰ�μ���ȣ���������������϶�.
 SELECT * 
FROM EMPLOYEE E, DEPARTMENT D
 WHERE E.DNO = D.DEPTNO
 ORDER BY D.DEPTNO;
 
 --14. ���μ������ؼ��̸�, ��, ���μ����ٹ��ϴ»�������˻��϶�. ����̾��ºμ������Խ��Ѷ�.
 SELECT D.DEPTNAME, D.FLOOR, COUNT(E.EMPNO) AS �����
FROM DEPARTMENT D
left join EMPLOYEE E ON D.DEPTNO = E.DNO
 GROUP BY D.DEPTNAME, D.FLOOR;
 

--15. �μ�1, 2, 3�����������ִ��������˻��϶�.
 SELECT TITLE FROM EMPLOYEE
 WHERE DNO IN (1, 2, 3)
 GROUP BY TITLE
 HAVING COUNT(DISTINCT DNO) = 3;
 
--18. �Ҽӻ������4�������κμ����̸�����������˻��϶�.
select d.deptname, count(e.empno)
from department d, employee e
where d.deptno = e.dno
group by d.deptname
having count(e.empno) <= 4;

--19. �ڽ��̼��Ѻμ�����ձ޿����ٸ��̹޴»�����̸�, �μ���ȣ, �޿����˻��϶�
SELECT e.empname AS �̸�, 
       e.dno AS �μ���ȣ, 
       e.salary AS �޿�
FROM employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.dno = e.dno
    GROUP BY e2.dno
);

--20. ���μ��������帹���޿����޴»�������̸�, �μ���ȣ, �޿����˻��϶�.
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
 
 --22. ����ö�Ǵ��̼��ΰ�������������������������ؼ�������̸����������˻��϶�.
 SELECT EMPNAME, TITLE
 FROM EMPLOYEE
 where title in 
 (select e2.title from employee e2 where e2.empname in ('����ö', '�̼���') );
 
 --24. DEPARTMENT �����̼ǿ�Ʃ��(5, 'ȫ��', 8)�������϶�
 insert into department values(5, 'ȫ��', 8);
 
 --26. �μ���ȣ2���ٹ��ϴ»�����Ǳ޿���5% �λ��϶�.
 UPDATE EMPLOYEE
 SET SALARY = SALARY * 1.05
 WHERE DNO = 2;
 
 
 

