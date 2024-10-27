DECLARE
  CURSOR title_cursor IS        
    SELECT title, salary FROM employee FOR UPDATE OF title;
  
  title employee.title%TYPE;  -- title ���� ����
  salary employee.salary%TYPE; -- salary ���� ����
  newtitle VARCHAR2(100);      -- ���ο� Ÿ��Ʋ ��
BEGIN
  -- DBMS_OUTPUT�� Ȱ��ȭ
  DBMS_OUTPUT.ENABLE;

  OPEN title_cursor;

  LOOP
    FETCH title_cursor INTO title, salary;
    EXIT WHEN title_cursor%NOTFOUND;

    -- ���ǿ� ���� title ���� ����
    IF salary >= 2000000 THEN
      newtitle := 'manager';
    else newtitle:=title;

    END IF;

    -- Ÿ��Ʋ�� ������Ʈ
    UPDATE employee
    SET title = newtitle
    WHERE CURRENT OF title_cursor;

    -- salary�� 2000000 �̻��� �� salary ���� ���
    --IF salary >= 2000000 THEN
    --  DBMS_OUTPUT.PUT_LINE('Salary: ' || salary || ' - Title updated to: ' || newtitle);
   -- END IF;
  END LOOP;

  CLOSE title_cursor;
END;
/

select * from employee;