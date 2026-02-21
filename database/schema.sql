DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    department_id INT NOT NULL,
    job_role VARCHAR(100) NOT NULL,
    experience_years INT CHECK (experience_years >= 0),
    salary DECIMAL(12,2) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON DELETE CASCADE
);

CREATE TABLE performance (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    performance_rating INT CHECK (performance_rating BETWEEN 1 AND 5),
    bonus DECIMAL(10,2),
    attrition ENUM('Yes','No') DEFAULT 'No',
    review_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
        ON DELETE CASCADE
);

CREATE INDEX idx_department ON employees(department_id);
CREATE INDEX idx_salary ON employees(salary);
CREATE INDEX idx_attrition ON performance(attrition);
