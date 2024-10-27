set serveroutput on;
DECLARE   --������
    avg_salary NUMBER;
    l_empname VARCHAR2 (10);
    l_title  VARCHAR2 (10);
    l_salary  NUMBER;
    
    --Ŀ���� �̿��Ͽ� employee ������ �����´�.
    CURSOR get_employee_rec IS
        SELECT empname, title, salary
        FROM employee
        WHERE dno = 3;
        
BEGIN  --������
    SELECT AVG(salary)
    INTO avg_salary
    FROM employee
    WHERE dno= 3;

    IF avg_salary >= 3000000 THEN
        FOR emp_rec IN get_employee_rec /* ���������� Ŀ���� OPEN�ϰ� FETCH�Ѵ� */

        LOOP
            l_empname := emp_rec.empname;
            l_title := emp_rec.title;
            l_salary := emp_rec.salary;
            dbms_output.put_line (l_empname || l_title || l_salary);
        END LOOP; /* ���������� Ŀ���� CLOSE�Ѵ� */
    ELSE
        dbms_output.put_line ('3�� �μ��� ��� �޿��� 3800000 �̸��Դϴ�.');
    END IF;
END ;
/