CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    department_id INT,
    job_role VARCHAR(100),
    experience_years INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE performance (
    employee_id INT,
    performance_rating INT,
    attrition VARCHAR(10),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
