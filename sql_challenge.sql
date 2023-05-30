CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);


CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);

###Done
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees
Inner Join public.salaries on employees.emp_no = salaries.emp_no;

###Done
Select employees.first_name, employees.last_name, employees.hire_date
From employees
Where hire_date >='1986-01-01' AND hire_date <= '1986-12-31';

###Done
Select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name  
From employees
Join dept_manager on employees.emp_no = dept_manager.emp_no
Join departments on departments.dept_no = dept_manager.dept_no;

###Done
Select dept_emp.dept_no, departments.dept_name, employees.emp_no, last_name, first_name 
From employees
Join dept_emp on dept_emp.emp_no = employees.emp_no
Join departments on departments.dept_no = dept_emp.dept_no;

###Done
Select emp_no, last_name, first_name 
From employees
where first_name = 'Hercules' AND last_name LIKE 'B&';

###Done
Select employees.emp_no, last_name, first_name 
From employees
Inner Join dept_emp on dept_emp.emp_no = employees.emp_no
Where dept_no = 'd007';
​

###Done
Select employees.emp_no, last_name, first_name, departments.dept_name
From employees
Join dept_emp on dept_emp.emp_no = employees.emp_no
Join departments on departments.dept_no = dept_emp.dept_no
Where dept_emp.dept_no = 'd007' or dept_emp.dept_no = 'd005';

###Done
select last_name, count(last_name)
from employees
group by(last_name)
order by count(last_name) desc;