
select * from employees

---Details of each employee
SELECT employees.Emp_no,employees.First_name, employees.Last_name, employees.Gender, Salaries.Salary
FROM employees JOIN salaries ON salaries.Emp_no = Employees.Emp_no

---List employees who were hired in 1986
SELECT employees.Emp_no,employees.First_name, employees.Last_name,employees.hire_date
   FROM employees
  WHERE employees.hire_date >= '1986-01-01'::date AND employees.hire_date <= '1986-12-31'::date;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select department_mgr.dept_no, n.dept_name, department_mgr.emp_no, e.First_name, e.Last_name,department_mgr.from_date,department_mgr.to_date
	From department_mgr
	Join departments n on department_mgr.dept_no = n.dept_no
	Join employees e on department_mgr.emp_no = e.emp_no
	
---List the department of each employee with the following information
--- employee number, last name, first name, and department name.
select department_emp.emp_no, e.Last_name, e.First_name, n.dept_name
	from department_emp
	Join employees e on department_emp.emp_no = e.emp_no
	Join departments n on department_emp.dept_no = n.dept_no
order by department_emp.emp_no
	
--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
	Where first_name = 'Hercules' and last_name like 'B%'
order by employees.last_name
	
--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

Select department_emp.emp_no, e.Last_name, e.First_name, departments.dept_name
	from department_emp
	Join Departments on departments.dept_no = department_emp.dept_no
	Join employees e on department_emp.emp_no = e.emp_no
	where departments.dept_name = 'Sales'
order by department_emp.emp_no
	
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Select department_emp.emp_no, e.Last_name, e.First_name, departments.dept_name
	from department_emp
	Join Departments on departments.dept_no = department_emp.dept_no
	Join employees e on department_emp.emp_no = e.emp_no
	where departments.dept_name = 'Sales' 
	or departments.dept_name = 'Development'
order by department_emp.emp_no
	
--In descending order, list the frequency count of employee last names, i.e., 
---how many employees share each last name.

select last_name, count(last_name)As Frequency
	from employees
	Group by last_name
	order by
	Frequency Desc;
	




	

	






