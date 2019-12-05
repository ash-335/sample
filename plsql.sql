SET SERVEROUTPUT ON
/
/*
CREATE OR REPLACE PROCEDURE query_emp(p_id IN EMPLOYEE.EMPLOYEENUMBER%TYPE,p_name OUT EMPLOYEE.EMPLOYEENAME%TYPE,p_sal OUT EMPLOYEE.SALARY%TYPE)
IS
BEGIN
     SELECT employeename,salary INTO p_name,p_sal
     FROM employee
     WHERE employeenumber = p_id;
END;
/

DECLARE 
     e_name EMPLOYEE.EMPLOYEENAME%TYPE;
     e_sal EMPLOYEE.SALARY%TYPE;
     CURSOR emp_cursor IS
          SELECT *
          FROM employee;
BEGIN
     FOR emp_record IN emp_cursor 
     LOOP
          query_emp(emp_record.employeenumber,e_name,e_sal);
          DBMS_OUTPUT.PUT_LINE('ID: '|| emp_record.employeenumber||' Name: '|| e_name ||' ________Salary: ' || e_sal);
     END LOOP;
END;
/
*/
CREATE OR REPLACE PROCEDURE query_sal(p_id IN EMPLOYEE.EMPLOYEENUMBER%TYPE,p_name OUT EMPLOYEE.EMPLOYEENAME%TYPE,p_sal IN OUT EMPLOYEE.SALARY%TYPE)
IS
temp_sal EMPLOYEE.SALARY%TYPE;
BEGIN
     SELECT employeename,salary INTO p_name, temp_sal
     FROM employee
     WHERE employeenumber = p_id;
     p_sal := temp_sal *2;
END;
/

SHOW ERRORS;
/

DECLARE
e_name EMPLOYEE.EMPLOYEENAME%TYPE;
CURSOR emp_cursor IS
     SELECT *
     FROM employee;
BEGIN
     FOR emp_record IN emp_cursor
     LOOP
          query_sal(emp_record.employeenumber,e_name,emp_record.salary);
          DBMS_OUTPUT.PUT_LINE('Id: ^^^^^^^^ '||emp_record.employeenumber || ' Name: '||e_name || '    ^^^^^^^^^^^^ salary: ' || emp_record.salary);
     END LOOP;
END;
/