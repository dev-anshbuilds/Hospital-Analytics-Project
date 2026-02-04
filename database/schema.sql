CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE dim_patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    insurance_type VARCHAR(20)
);
CREATE TABLE dim_department (
    dept_id VARCHAR(5) PRIMARY KEY,
    department_name VARCHAR(50)
);
CREATE TABLE dim_branch (
    branch_id VARCHAR(5) PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE dim_doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id VARCHAR(5),
    branch_id VARCHAR(5),
    specialization VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES dim_department(dept_id),
    FOREIGN KEY (branch_id) REFERENCES dim_branch(branch_id)
);
CREATE TABLE dim_bed (
    bed_id INT PRIMARY KEY,
    branch_id VARCHAR(5),
    dept_id VARCHAR(5),
    bed_type VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (branch_id) REFERENCES dim_branch(branch_id),
    FOREIGN KEY (dept_id) REFERENCES dim_department(dept_id)
);
CREATE TABLE fact_admission (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    branch_id VARCHAR(5),
    dept_id VARCHAR(5),
    admission_type VARCHAR(20),
    admission_time DATETIME,
    discharge_time DATETIME,
    length_of_stay_hours INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES dim_patient(patient_id),
    FOREIGN KEY (branch_id) REFERENCES dim_branch(branch_id),
    FOREIGN KEY (dept_id) REFERENCES dim_department(dept_id),
    FOREIGN KEY (doctor_id) REFERENCES dim_doctor(doctor_id)
);
CREATE TABLE fact_bed_occupancy (
    occupancy_id INT PRIMARY KEY,
    bed_id INT,
    admission_id INT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (bed_id) REFERENCES dim_bed(bed_id),
    FOREIGN KEY (admission_id) REFERENCES fact_admission(admission_id)
);
CREATE TABLE fact_procedure (
    procedure_id INT PRIMARY KEY,
    admission_id INT,
    procedure_type VARCHAR(100),
    procedure_time DATETIME,
    cost DECIMAL(10,2),
    FOREIGN KEY (admission_id) REFERENCES fact_admission(admission_id)
);
CREATE TABLE fact_billing (
    admission_id INT PRIMARY KEY,
    room_charges DECIMAL(10,2),
    procedure_charges DECIMAL(10,2),
    medicine_charges DECIMAL(10,2),
    other_charges DECIMAL(10,2),
    total_cost DECIMAL(10,2),
    FOREIGN KEY (admission_id) REFERENCES fact_admission(admission_id)
);
CREATE TABLE fact_outcome (
    admission_id INT PRIMARY KEY,
    outcome_type VARCHAR(20),
    readmitted_within_30d BOOLEAN,
    FOREIGN KEY (admission_id) REFERENCES fact_admission(admission_id)
);
SHOW TABLES;
DESCRIBE fact_admission;





