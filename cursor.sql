DECLARE
  CURSOR title_cursor IS        
    SELECT title, salary FROM employee FOR UPDATE OF title;
  
  title employee.title%TYPE;  -- title 변수 선언
  salary employee.salary%TYPE; -- salary 변수 선언
  newtitle VARCHAR2(100);      -- 새로운 타이틀 값
BEGIN
  -- DBMS_OUTPUT를 활성화
  DBMS_OUTPUT.ENABLE;

  OPEN title_cursor;

  LOOP
    FETCH title_cursor INTO title, salary;
    EXIT WHEN title_cursor%NOTFOUND;

    -- 조건에 따라 title 값을 변경
    IF salary >= 2000000 THEN
      newtitle := 'manager';
    else newtitle:=title;

    END IF;

    -- 타이틀을 업데이트
    UPDATE employee
    SET title = newtitle
    WHERE CURRENT OF title_cursor;

    -- salary가 2000000 이상일 때 salary 값을 출력
    --IF salary >= 2000000 THEN
    --  DBMS_OUTPUT.PUT_LINE('Salary: ' || salary || ' - Title updated to: ' || newtitle);
   -- END IF;
  END LOOP;

  CLOSE title_cursor;
END;
/

select * from employee;