

CREATE TABLE Departments (
    Dept_no varchar(20)   NOT NULL,
    Dept_name varchar(100)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE Department_Emp (
    Emp_no int   NOT NULL,
    Dept_no varchar(20)   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Department_Emp PRIMARY KEY (
        Emp_no,Dept_no
     )
);

CREATE TABLE Employees (
    Emp_no int   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar(100)   NOT NULL,
    Last_name varchar(100)   NOT NULL,
    Gender char(10)   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Salaries (
    Emp_no int   NOT NULL,
    Salary money   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL
);

CREATE TABLE Titles (
    Emp_no int   NOT NULL,
    Title varchar(100)   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL
);

CREATE TABLE Department_Mgr (
    Dept_no varchar(20)   NOT NULL,
    Emp_no int   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Department_Mgr PRIMARY KEY (
        Emp_no
     )
);

ALTER TABLE Departments ADD CONSTRAINT fk_Departments_Dept_no FOREIGN KEY("Dept_no")
REFERENCES Department_Mgr (Dept_no);

ALTER TABLE Department_Emp ADD CONSTRAINT fk_Department_Emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Titles (Emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Department_Mgr ADD CONSTRAINT fk_Department_Mgr_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Department_Emp (Emp_no);

