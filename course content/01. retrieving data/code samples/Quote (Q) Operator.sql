/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : Quote (Q) Operator                                *
 ***************************************************************/

select * from dual;
select 'My Name is Adam' as "Output" from dual;
select 'I''m using quote operator in SQL statements' as "Output" from dual;
select q'[I'm using quote operator in SQL statements]' as "Quote Operator" from dual;
select q'<I'm using quote operator in SQL statements>' as "Quote Operator" from dual;
select q'dI'm using quote operator in SQL statementsd' as "Quote Operator" from dual;
