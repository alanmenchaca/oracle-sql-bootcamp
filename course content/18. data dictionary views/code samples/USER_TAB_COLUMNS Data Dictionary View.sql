/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : USER_TAB_COLUMNS Data Dictionary View             *
 ***************************************************************/

SELECT  * FROM user_tab_columns;

SELECT * FROM user_tab_columns WHERE table_name = 'DEPARTMENTS';

SELECT * FROM all_tab_columns WHERE table_name = 'DEPARTMENTS';