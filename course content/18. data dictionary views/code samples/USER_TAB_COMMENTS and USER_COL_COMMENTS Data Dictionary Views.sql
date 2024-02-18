/************* The Complete Oracle SQL Bootcamp ****************************
 * Author  : Oracle Master Training                                        *
 * Course  : The Complete Oracle SQL Bootcamp                              *
 * Lecture : USER_TAB_COMMENTS and USER_COL_COMMENTS Data Dictionary Views *
 ***************************************************************************/

SELECT * FROM user_tab_comments;

SELECT * FROM user_tab_comments WHERE upper(comments) LIKE '%EMPLOYEE%';

SELECT * FROM user_tab_comments WHERE upper(comments) LIKE '%SALARY%';

SELECT * FROM jobs;

SELECT * FROM user_col_comments WHERE upper(comments) LIKE '%SALARY%';