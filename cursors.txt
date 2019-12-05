SET SERVEROUTPUT ON;
/

DECLARE
--v_name EMPLOYEE.EMPLOYEENAME%TYPE;
--v_hiredate EMPLOYEE.DATEOFJOINING%TYPE;
--v_hiredate EMPLOYEE.DESIGNATION%TYPE;

CURSOR emp_details IS
    SELECT employeename,dateofjoining,designation
    FROM employee;
    emp_record emp_details%ROWTYPE;
BEGIN
OPEN emp_details;
LOOP
    FETCH emp_details INTO emp_record;
    EXIT WHEN emp_details%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Name: '||emp_record.employeename|| ' @@@@ ' || 'Hiredate: ' || emp_record.dateofjoining || ' Designation:  ' ||emp_record.designation);
END LOOP;
END;
/

DESCRIBE department;
/

DECLARE
d_deptid DEPARTMENT.DEPARTMENTCODE%TYPE;
d_deptname DEPARTMENT.DEPARTMENTNAME%TYPE;
CURSOR department_cursor IS
    SELECT departmentcode,departmentname
    FROM department;
BEGIN
OPEN department_cursor;
LOOP
    FETCH department_cursor INTO d_deptid,d_deptname;
    EXIT WHEN department_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('DeptId: '||d_deptid || '     DeptName: ' || d_deptname);
END LOOP;
END;
/

DECLARE
CURSOR empdetails_cursor IS
    SELECT d.departmentcode,d.departmentname,e.employeename
    FROM department d, employee e
    WHERE d.departmentcode = e.departmentcode;
    emprecord empdetails_cursor%ROWTYPE;
BEGIN
    OPEN empdetails_cursor;
    DBMS_OUTPUT.PUT_LINE('Employee-Name:   ' || '   ' || ' DepartmentCode:' || '             ' || ' DepartmentName: ');
LOOP
    FETCH empdetails_cursor INTO emprecord;
    EXIT WHEN empdetails_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( emprecord.employeename||'    .............    '||emprecord.departmentcode || '  .............   '||emprecord.departmentname );
END LOOP;
END;
/

DECLARE
CURSOR employee_cursor IS 
    SELECT employeename,employeenumber,dateofjoining
    FROM employee;
BEGIN
FOR employee_record IN employee_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('EmpId: '||employee_record.employeenumber|| ' __________ ' ||' EmpName: '||employee_record.employeename || ' __________ ' ||'  date of joining: ' || employee_record.dateofjoining );
    END LOOP;
END;
/