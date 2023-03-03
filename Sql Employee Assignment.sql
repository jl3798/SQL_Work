create table Employee (
	employee_ID Int primary key not null,
	employee_title_id varchar(20) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(2) not null,
	hire_date date not null)
select * from employee
create table Departments (
	department_no varchar(10) primary key not null,
	department_name varchar(30) not null
	)
create table Department_Employee (
	employee_number int not null,
	department_number varchar(5) not null,
	foreign key (department_number) references Departments(department_no)
	foreign key (employee_number) references employee(employee_id)
)
select * from Departments

create table Department_Manager (
	department_number varchar (5) not null,
	manager_number int not null,
	foreign key (department_number) references Departments(department_no)
)
select * from Department_Manager
create table Salaries (
	employee_number int not null,
	salary int,
	foreign key (employee_number) references Employee(employee_ID)
)
select * from Salaries
create table Titles (
	title_id varchar (10) not null,
	title varchar (20)
)
select * from Titles

--Question 1
select employee.employee_ID,employee.last_name,employee.first_name,employee.sex,salaries.salary
from salaries
inner join employee on
employee.employee_ID = salaries.employee_number

--Question 2
select last_name,first_name,hire_date
from Employee
where hire_date >= '01-01-1986'
	and hire_date < '01-01-1987'
	
--Question 3
select department_manager.manager_number,department_manager.department_number,
departments.department_name,
department_employee.department_number,
employee.last_name,employee.first_name
from departments
inner join department_manager on
department_manager.department_number = departments.department_no
inner join department_employee on
department_employee.department_number = department_manager.department_number
inner join employee on
employee.employee_id=department_employee.employee_number

--Question 4
select departments.department_name,departments.department_no,
department_manager.department_number,
employee.employee_id,employee.last_name,employee.first_name
from departments
inner join department_manager on
department_manager.department_number = departments.department_no
inner join department_employee on
department_employee.department_number = department_manager.department_number
inner join employee on
employee.employee_id=department_employee.employee_number

--Question 5
select first_name, last_name, sex
from employee
where first_name = 'Hercules'
and last_name like 'B%'

--Question 6
select employee.employee_id,employee.last_name,employee.first_name, departments.department_name
from departments
inner join department_manager on
department_manager.department_number = departments.department_no
inner join department_employee on
department_employee.department_number = department_manager.department_number
inner join employee on
employee.employee_id=department_employee.employee_number
where department_name = 'Sales'
--Question 7
select employee.employee_id,employee.last_name,employee.first_name, departments.department_name
from departments
inner join department_manager on
department_manager.department_number = departments.department_no
inner join department_employee on
department_employee.department_number = department_manager.department_number
inner join employee on
employee.employee_id=department_employee.employee_number
where department_name = 'Development' or department_name = 'Sales'

--Question 8
select last_name, count(last_name) as "Last names"
from employee
group by last_name
order by "Last names" desc

