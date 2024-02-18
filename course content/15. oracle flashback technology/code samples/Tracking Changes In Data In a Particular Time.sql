/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Tracking Changes In Data In a Particular Time  *
 ************************************************************/

SELECT * FROM employees_copy;

SELECT dbms_flashback.get_system_change_number FROM dual;

UPDATE employees_copy 
   SET salary      = 18000 
 WHERE employee_id = 100;

SELECT * from employees_copy as of timestamp(sysdate - interval '2' minute) WHERE employee_id = 100;

SELECT * from employees_copy as of scn 123123 WHERE employee_id = 100;

UPDATE employees_copy 
   SET salary      = 15000 
 WHERE employee_id = 100;

SELECT versions_starttime, versions_endtime, versions_startscn, versions_endscn, 
       versions_operation, versions_xid,     employees_copy.* 
FROM employees_copy VERSIONS BETWEEN scn MINVALUE AND MAXVALUE 
WHERE employee_id = 100;

SELECT versions_starttime, versions_endtime, versions_startscn, versions_endscn, 
       versions_operation, versions_xid, employees_copy.* 
FROM employees_copy VERSIONS BETWEEN TIMESTAMP (sysdate - interval '5'  minute) AND sysdate 
WHERE employee_id = 100;






