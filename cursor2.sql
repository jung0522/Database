set serveroutput on;
DECLARE   --선언절
    avg_salary NUMBER;
    l_empname VARCHAR2 (10);
    l_title  VARCHAR2 (10);
    l_salary  NUMBER;
    
    --커서를 이용하여 employee 정보를 가져온다.
    CURSOR get_employee_rec IS
        SELECT empname, title, salary
        FROM employee
        WHERE dno = 3;
        
BEGIN  --실행절
    SELECT AVG(salary)
    INTO avg_salary
    FROM employee
    WHERE dno= 3;

    IF avg_salary >= 3000000 THEN
        FOR emp_rec IN get_employee_rec /* 묵시적으로 커서를 OPEN하고 FETCH한다 */

        LOOP
            l_empname := emp_rec.empname;
            l_title := emp_rec.title;
            l_salary := emp_rec.salary;
            dbms_output.put_line (l_empname || l_title || l_salary);
        END LOOP; /* 묵시적으로 커서를 CLOSE한다 */
    ELSE
        dbms_output.put_line ('3번 부서의 평균 급여가 3800000 미만입니다.');
    END IF;
END ;
/