-- I. print out the data
-- 1. departments table & change the colum name to lower case
SELECT * FROM departments;
ALTER TABLE departments RENAME COLUMN `ï»¿Department_ID` TO department_id;
ALTER TABLE departments RENAME COLUMN Department_Name TO department_name;
ALTER TABLE departments RENAME COLUMN Department_Budget TO department_budget;
ALTER TABLE departments RENAME COLUMN Head_of_Department TO head_of_department;
ALTER TABLE departments RENAME COLUMN Number_of_Employees TO number_of_employees;
ALTER TABLE departments RENAME COLUMN Department_Goals TO department_goals;
ALTER TABLE departments RENAME COLUMN Location TO location;

-- 2. employees table  & fix the typo in employee_id
select * from employees;
ALTER TABLE employees RENAME COLUMN `ï»¿employee_id` TO employee_id;

-- 3. project assignments & 
select * from project_assignments;

-- 4. projects
select * from projects; 
--  drop myUnknownColum
ALTER TABLE projects
DROP COLUMN MyUnknownColumn;

-- 5. upcoming projects
select * from upcoming_projects;

-- 6. completed projects
select * from completed_projects;

-- 7.  head_shots
select * from head_shots;


--  II. Join table 
WITH project_status AS (
  SELECT 
    project_id,
    project_name,
    project_budget,
    'upcoming' AS status
  FROM upcoming_projects
  UNION ALL
  SELECT 
    project_id,
    project_name,
    project_budget,
    'completed' AS status
  FROM completed_projects
)

-- Now use the CTE in the JOIN
SELECT 
  emp.employee_id,
  emp.first_name,
  emp.last_name,
  emp.job_title,
  emp.salary,
  dep.department_name,
  projAs.project_id,
  projSta.project_name,
  projSta.status
FROM employees emp
JOIN departments dep 
  ON emp.department_id = dep.department_id
JOIN project_assignments projAs 
  ON projAs.employee_id = emp.employee_id
JOIN project_status projSta
  ON projSta.project_id = projAs.project_id;



