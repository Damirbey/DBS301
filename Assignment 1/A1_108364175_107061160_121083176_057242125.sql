-- **********************************************************************************************************************************************************
-- ********************************************************GROUP MEMBERS INFORMATION*************************************************************************
-- **********************************************************************************************************************************************************
-- First Group Member:
-- Name: Damirkhon Yodgorov
-- ID: 108364175
-- Date: 06.11.2018
-- Purpose: Assignment 1 - DBS301
-- *********************** 
-- ***********************
-- ***********************
-- Second Group Member:
-- Name: Gayane Babayan
-- ID: 107061160
-- Date: 06.11.2018
-- Purpose: Assignment 1 - DBS301
-- *********************** 
-- ***********************
-- ***********************
-- Third Group Member:
-- Name: Mohammed Suleiman Mohamed Al-Falahy
-- ID: 121083176
-- Date: 06.11.2018
-- Purpose: Assignment 1 - DBS301
-- *********************** 
-- ***********************
-- ***********************
-- Fourth Group Member:
-- Name: Daniel Altunyuzuk
-- ID: 057242125
-- Date: 06.11.2018
-- Purpose: Assignment 1 - DBS301
-- *********************** 

--****************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************
-- ********************************************************        ANSWERS         * ************************************************************************
-- **********************************************************************************************************************************************************


-- QUESTION 1:

-- Display the employee number, full employee name, job and hire date of all employees
-- hired in May or November of any year, with the most recently hired employees
-- displayed first.
-- • Also, exclude people hired in 1994 and 1995.
-- • Full name should be in the form Lastname, Firstname with an alias called Full
-- Name.
-- • Hire date should point to the last day in May or November of that year (NOT to
-- the exact day) and be in the form of [May 31<st,nd,rd,th> of 1996] with the
-- heading Start Date. Do NOT use LIKE operator.
-- <st,nd,rd,th> means days that end in a 1, should have “st”, days that end in a 2
-- should have “nd”, days that end in a 3 should have “rd” and all others should
-- have “th”
-- • You should display ONE row per output line by limiting the width of the Full
-- Name to 25 characters. The output lines should look like this line: 

-- SOLUTION FOR QUESTION 1:
  
  SELECT
  EMPLOYEE_ID,
  SUBSTR(LAST_NAME ||', ' || FIRST_NAME,1,25) AS "Full Name",
  JOB_ID,
  TO_CHAR(LAST_DAY(HIRE_DATE),'[fmMonth ddth "of" YYYY]') AS "Start Date"                                    
  FROM EMPLOYEES  
  WHERE TO_CHAR(HIRE_DATE,'fmMonth') IN ('May','November')
  AND   TO_CHAR(HIRE_DATE,'YYYY') NOT IN (1994, 1995)
  ORDER BY HIRE_DATE DESC;
  
-- **********************************************************************************************************************************************************

-- QUESTION 2:

-- List the employee number, full name, job and the modified salary for all employees
-- whose monthly earning (without this increase) is outside the range $6,000 – $11,000
-- and who are employed as Vice Presidents or Managers (President is not counted here).
--• You should use Wild Card characters for this.
--• VP’s will get 30% and managers 20% salary increase.
--• Sort the output by the top salaries (before this increase) firstly.
--• Heading will be like Employees with increased Pay
--• The output lines should look like this sample line:

-- SOLUTION FOR QUESTION 2:

  SELECT 
        'Emp# ' || EMPLOYEE_ID ||
        ' named ' || FIRST_NAME||' '|| LAST_NAME ||
        ' who is ' || JOB_ID ||
        ' will have a new salary of ' || '$' || 
        CASE 
             WHEN upper(JOB_ID) like '%VP%' THEN SALARY * 1.3
             ELSE SALARY * 1.2 
        END
        AS "Employees with increased Pay"
  FROM    EMPLOYEES
  WHERE   SALARY NOT BETWEEN 6000 AND 11000
  AND     (JOB_ID LIKE '%VP'
  OR      JOB_ID LIKE '%MGR'
  OR      JOB_ID LIKE '%MAN')
  ORDER BY SALARY DESC;
  
-- **********************************************************************************************************************************************************

-- QUESTION 3:
-- Display the employee last name, salary, job title and manager# of all employees not
-- earning a commission OR if they work in the SALES department, but only if their total
-- monthly salary with $1000 included bonus and commission (if earned) is greater than
-- $15,000.
--• Let’s assume that all employees receive this bonus.
--• If an employee does not have a manager, then display the word NONE
--• instead. This column should have an alias Manager#.
--• Display the Total annual salary as well in the form of $135,600.00 with the
--• heading Total Income. Sort the result so that best paid employees are shown
-- first.
--• The output lines should look like this sample line:

-- SOLUTION FOR QUESTION 3:
 SELECT 
   LAST_NAME,
   SALARY,
   JOB_ID,
   NVL(TO_CHAR(MANAGER_ID),'NONE') AS "Manager#",
   TO_CHAR(((SALARY+1000) * 12),'$999,999.00') AS "Total Income"
 FROM EMPLOYEES
 WHERE (NVL(COMMISSION_PCT,0) = 0
 OR DEPARTMENT_ID = 80)
 AND (SALARY + 1000 + (SALARY * NVL(COMMISSION_PCT,0))) > 15000
 ORDER BY 4 DESC;

-- **********************************************************************************************************************************************************
-- QUESTION 4:

-- Display Department_id, Job_id and the Lowest salary for this combination under the
-- alias Lowest Dept/Job Pay, but only if that Lowest Pay falls in the range $6000 - $18000. 
-- Exclude people who work as some kind of Representative job from this query and
-- departments IT and SALES as well.
--• Sort the output according to the Department_id and then by Job_id.
--• You MUST NOT use the Subquery method. 

-- SOLUTION FOR QUESTION 4:
 SELECT
  DEPARTMENT_ID,
  JOB_ID,
  MIN(SALARY) AS "Lowest Dept/Job Pay"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,JOB_ID
HAVING MIN(SALARY) BETWEEN 6000 AND 18000
AND JOB_ID NOT LIKE '%REP'
AND DEPARTMENT_ID NOT IN(60,80)
ORDER BY DEPARTMENT_ID, JOB_ID;


-- **********************************************************************************************************************************************************

-- QUESTION 5:
-- Display last_name, salary and job for all employees who earn more than all lowest paid
-- employees per department outside the US locations.
--• Exclude President and Vice Presidents from this query.
--• Sort the output by job title ascending.
--• You need to use a Subquery and Joining with the NEW (Oracle9i) method. 

-- SOLUTION FOR QUESTION 5:
SELECT
        LAST_NAME,
        SALARY,
        JOB_ID
FROM    EMPLOYEES 
WHERE   SALARY > ALL (SELECT
                          MIN(SALARY)
                      FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)
                      JOIN LOCATIONS USING (LOCATION_ID)
                      WHERE COUNTRY_ID <> 'US'
                      GROUP BY DEPARTMENT_ID)
AND     JOB_ID NOT IN ('AD_PRES','AD_VP')
ORDER BY JOB_ID;

-- **********************************************************************************************************************************************************
-- QUESTION 6:
-- Who are the employees (show last_name, salary and job) who work either in IT or
-- MARKETING department and earn more than the worst paid person in the ACCOUNTING
-- department.
--• Sort the output by the last name alphabetically.
--• You need to use ONLY the Subquery method (NO joins allowed). 

-- SOLUTION FOR QUESTION 6 :

SELECT
    LAST_NAME,
    SALARY,
    JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT
                          DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME IN('IT','Marketing'))
AND SALARY > (SELECT
                  MIN(SALARY)
                FROM EMPLOYEES 
                WHERE DEPARTMENT_ID = (SELECT
                                          DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting'))
ORDER BY LAST_NAME;   


-- **********************************************************************************************************************************************************

-- QUESTION 7:

-- Display alphabetically the full name, job, salary (formatted as a currency amount incl.
-- thousand separator, but no decimals) and department number for each employee who
-- earns less than the best paid unionized employee (i.e. not the president nor any
-- manager nor any VP), and who work in either SALES or MARKETING department.
--• Full name should be displayed as Firstname Lastname and should have the
-- heading Employee.
--• Salary should be left-padded with the = symbol till the width of 12 characters. It
-- should have an alias Salary.
--• You should display ONE row per output line by limiting the width of the
-- Employee to 25 characters.


-- SOLUTION FOR QUESTION 7:

SELECT
      INITCAP(FIRST_NAME ||' '|| LAST_NAME) AS "Employee",
      JOB_ID,
      LPAD(TO_CHAR(SALARY,'99,999'),12,'=') AS "Salary",
      DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY < (SELECT
                    MAX(SALARY)
                FROM EMPLOYEES
            
                WHERE JOB_ID NOT LIKE '%MAN'
                AND    JOB_ID NOT LIKE '%MGR'
                AND  JOB_ID NOT LIKE '%VP'
                AND  JOB_ID NOT LIKE '%PRES'
                AND DEPARTMENT_ID NOT IN(80,20))
ORDER BY EMPLOYEE_ID;



-- **************************************************************************************************************************************************************

-- QUESTION 8:

-- Display department name, city and number of different jobs in each department. If city
-- is null, you should print Not Assigned Yet.
--• This column should have alias City.
--• Column that shows # of different jobs in a department should have the heading #
--of Jobs
--• You should display ONE row per output line by limiting the width of the City to
--25 characters. 
-- You need to show complete situation from the EMPLOYEE point of view,
-- meaning include also employees who work for NO department (but do NOT
-- display empty departments) and from the CITY point of view meaning you need
-- to display all cities without departments as well.
--• You need to use Outer Joining with the NEW (Oracle9i) method.

-- SOLUTION FOR QUESTION 8:

SELECT
    NVL(DEPARTMENT_NAME, 'No Department') AS "Deparmtent Name",
    SUBSTR(NVL(CITY,'Not Assigned Yet'),1,25) AS "City",    
    COUNT(DISTINCT(JOB_ID)) AS "# of Jobs"
FROM LOCATIONS LEFT JOIN DEPARTMENTS USING(LOCATION_ID)
FULL JOIN EMPLOYEES USING(DEPARTMENT_ID)
GROUP BY CITY, DEPARTMENT_NAME
ORDER BY 3 desc,2;

-- ***************************************************************************************************************************************************************





