SET SERVEROUTPUT ON
/

CREATE OR REPLACE PROCEDURE insert_employee 
    (p_id IN EMPLOYEE.EMPLOYEENUMBER%TYPE,p_name IN EMPLOYEE.EMPLOYEENAME%TYPE,
    p_dateofbirth IN EMPLOYEE.DATEOFBIRTH%TYPE,p_hiredate IN EMPLOYEE.DATEOFJOINING%TYPE,
    p_role IN EMPLOYEE.DESIGNATION%TYPE,p_salary IN EMPLOYEE.SALARY%TYPE,p_managernum IN EMPLOYEE.MANAGEREMPLOYEENUMBER%TYPE,p_dept IN EMPLOYEE.DEPARTMENTCODE%TYPE)
IS
BEGIN
    INSERT INTO employee VALUES(p_id,p_name,p_dateofbirth,p_hiredate,p_role,p_salary,p_managernum,p_dept);
DBMS_OUTPUT.PUT_LINE('Successfully Inserted');
COMMIT;
END insert_employee;
/

BEGIN
insert_employee(7021,'xyz','17-OCT-19','04-JUL-19','MD',20000,7012,'JavaCap');
END;
/

SELECT * FROM employee;
/
SHOW ERRORS;
/

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