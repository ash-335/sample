SET SERVEROUTPUT ON;
/
DECLARE
v_checK1_sal EMPLOYEE.SALARY%TYPE;
v_sal EMPLOYEE.SALARY%TYPE := 800000;
v_mid_salary EMPLOYEE.SALARY%TYPE;
v_low_salary EMPLOYEE.SALARY%TYPE;
v_high_salary EMPLOYEE.SALARY%TYPE;
BEGIN
SELECT salary INTO v_sal 
FROM employee
WHERE v_sal = salary;
DBMS_OUTPUT.PUT_LINE(v_sal);
SELECT min(salary) INTO v_low_salary
FROM employee;
DBMS_OUTPUT.PUT_LINE('Lowest salary:'||v_low_salary);
SELECT max(salary) INTO v_high_salary
FROM employee;
DBMS_OUTPUT.PUT_LINE('Highest salary: '||v_high_salary);
v_mid_salary := (v_low_salary + v_high_salary)/2;
DBMS_OUTPUT.PUT_LINE('Mid Range : '||v_mid_salary);
END;
/
DECLARE
v_min_sal EMPLOYEE.SALARY%TYPE;
v_max_sal EMPLOYEE.SALARY%TYPE;
v_mid_sal EMPLOYEE.SALARY%TYPE;

v_name EMPLOYEE.EMPLOYEENAME%TYPE;
v_id EMPLOYEE.EMPLOYEENUMBER%TYPE :=7008;

CURSOR sal_cursor IS 
        SELECT salary,employeename
        FROM employee;
    sal_record sal_cursor%ROWTYPE;
BEGIN
SELECT min(salary) INTO v_min_sal
FROM employee;
DBMS_OUTPUT.PUT_LINE('Minimum salary:'||v_min_sal);
SELECT max(salary) INTO v_max_sal
FROM employee;
DBMS_OUTPUT.PUT_LINE('Maximum salary:'||v_max_sal);
v_mid_sal := (v_min_sal + v_max_sal)/2;
DBMS_OUTPUT.PUT_LINE('Mid salary:'||v_mid_sal);
OPEN sal_cursor;
LOOP
    FETCH sal_cursor INTO sal_record;
    EXIT WHEN sal_cursor%NOTFOUND;
    IF sal_record.salary < v_mid_sal THEN
    DBMS_OUTPUT.PUT_LINE(sal_record.employeename ||'  '|| sal_record.salary);
    END IF;
END LOOP;
CLOSE sal_cursor;
END;
/