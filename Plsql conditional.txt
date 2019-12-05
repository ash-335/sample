SET SERVEROUTPUT ON;
/
DECLARE 
e_name EMPLOYEE.EMPLOYEENAME%TYPE;
e_id EMPLOYEE.EMPLOYEENUMBER%TYPE;
e_salary EMPLOYEE.SALARY%TYPE :=30000;
e_dept EMPLOYEE.DEPARTMENTCODE%TYPE := 'JavaCap';
BEGIN
FOR output IN (SELECT employeenumber, employeename,salary,departmentcode
                INTO e_id,e_name,e_salary,e_dept
                FROM employee
                WHERE e_salary = salary OR e_dept = departmentcode
                )
LOOP
e_id := output.employeenumber;
e_name := output.employeename;
e_dept := output.departmentcode;
DBMS_OUTPUT.PUT_LINE('ID: '||e_id||' NAME: '||e_name ||' DEPT: '||e_dept);
END LOOP;
END;
/
SELECT * FROM Employee;
/
DESCRIBE Employee;
/

DECLARE
e_name EMPLOYEE.EMPLOYEENAME%TYPE;
e_num EMPLOYEE.EMPLOYEENUMBER%TYPE;
e_monthsal EMPLOYEE.SALARY%TYPE;
e_sal EMPLOYEE.SALARY%TYPE := 420000;
BEGIN
FOR out IN (SELECT employeename,employeenumber,salary INTO e_name,e_num, e_sal
            FROM Employee
            WHERE salary > (SELECT max(salary)
                            FROM employee
                            WHERE e_sal =  salary )) 
LOOP
e_name := out.employeename;
e_num := out.employeenumber;
e_sal := out.salary;
e_monthsal := (out.salary /12);
DBMS_OUTPUT.PUT_LINE('NAME:  '||e_name||' No: ' || e_num||' SALARY:  '||e_sal||' Monthly-Salary:' || e_monthsal);
END LOOP;
END;
/