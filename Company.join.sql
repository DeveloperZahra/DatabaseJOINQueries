--========USE Company_SD DATABASE========= 
USE Company_SD 
--===========SHOW THE DATA FOR ALL TABLES========
SELECT * FROM Departments

SELECT * FROM Dependent

SELECT * FROM Employee

SELECT * FROM Project

SELECT * FROM Works_for

---=========JOIN=============
--==========1.Display the department ID, department name, manager ID, and the full name of the manager=======================

SELECT  d.Dnum,  d.Dname, e.Superssn , e.Fname + ' ' + e.Lname AS full_name
FROM Departments d INNER JOIN Employee e 

ON d.Dnum = e.Dno

--==========2. Display the names of departments and the names of the projects  =====================================
SELECT  d.Dname, P.Pname

FROM Departments d INNER JOIN Project P

ON d.Dnum = P.Dnum 

--===========3. Display full data of all dependents, along with the full name of the employee they depend on=================
SELECT dep.* , e.Fname + ' ' + e.Lname AS full_name

FROM Dependent dep left join Employee e

ON E.SSN = DEP.ESSN

--=============4. Display the project ID, name, and location of all projects located in Cairo or Alex=====================
SELECT Pnumber ,Pname ,Plocation

FROM Project

WHERE City= 'Cairo'

OR City= 'Alex'

--=============5. Display all project data where the project name starts with the letter 'A'================================
SELECT *

FROM Project

WHERE Pname 

LIKE 'A%' 

--=============6. Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE===============
SELECT Fname ,Lname , SSN

FROM Employee

WHERE Dno =30 

AND Salary BETWEEN 1000 AND 2000 

--=============7. Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project==========
SELECT Fname ,Lname 

FROM Employee

JOIN Works_for W

ON  SSN = W.ESSn

JOIN Project P

ON  W.Pno = P.Pnumber 


WHERE Dno =10 
AND P.Pname ='AL Rabwah'
AND W.Hours >= 10

--============8. Find the names of employees who are directly supervised by "Kamel Mohamed"=================

SELECT (e.Fname + ' '+ e.Lname) AS 'Employee Name'

FROM Employee e INNER JOIN Employee s

ON s.SSN = e.Superssn 
WHERE(s.Fname + ' '+ s.Lname)  = 'Kamel Mohamed';

--============9.Retrieve the names of employees and the names of the projects they work on, sorted by project name========

SELECT (e.Fname + ' '+ e.Lname) AS 'Employee Name', P.Pname AS 'Projects Name'

FROM Employee e  INNER JOIN Works_for W ON e.SSN = W.ESSn INNER JOIN Project P ON P.Pnumber = W.Pno 

ORDER BY P.Pname;

--==========10.For each project located in Cairo, display the project number, controlling department name, manager's last name, address, and birthdate=====

SELECT P.Pnumber AS'Project Number',  d.Dname AS 'Department Name', e.Lname AS 'Manager Last Name', e.Address AS 'Address', e.Bdate AS 'Birthdate'

FROM Departments d INNER JOIN Project P ON d.Dnum = P.Dnum INNER JOIN Employee e ON e.SSN = d.MGRSSN

WHERE P.City = 'Cairo';

--=============-11. Display all data of managers in the company=======================

SELECT M.*
FROM Employee e, Employee m
WHERE m.SSN = e.Superssn;

--============12.  Display all employees and their dependents, even if some employees have no dependents================

SELECT e.* , dep.Dependent_name AS 'Dependent Name'

FROM Employee E LEFT OUTER JOIN Dependent dep

ON e.SSN = dep.ESSN;
