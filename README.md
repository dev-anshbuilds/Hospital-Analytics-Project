# Hospital Analytics Dashboard – Resource Utilization & Patient Outcomes

An interactive hospital analytics dashboard built using Power BI, MySQL, and FastAPI to monitor patient admissions, resource utilization, clinical outcomes, and financial performance across hospital departments and branches.

This solution is designed for hospital administrators and operations teams to support data-driven decision-making, bottleneck identification, staffing optimization, and long-term capacity planning.

---

## 🚀 Features

- Executive KPIs: Admissions, Average Length of Stay, Readmission Rate, Revenue, Bed Occupancy
- Admission trends and peak hour analysis
- Department-level performance comparison
- Doctor workload and utilization analysis
- Financial insights with billing and cost breakdown
- Patient outcome and readmission analysis
- Interactive slicers for branch, department, date, and demographics

---

## 🛠️ Technology Stack

- **Power BI** – Data visualization and dashboarding  
- **MySQL** – Relational database  
- **FastAPI** – Backend API layer  
- **Python** – Data generation and ETL  

---

## 📂 Project Structure

hospital-analytics-dashboard/
│
├── backend/
│ ├── main.py
│
├── dashboard/
│ └── Hospital_Analytics_Dashboard.pbix
│
├── data_generator
│ └──project.ipynb
│
├── database
│ ├── dim_bed.csv
│ ├── dim_branch.csv
│ ├── dim_department.csv
│ ├── dim_doctor.csv
│ ├── dim_patient.csv
│ ├── fact_admission.csv
│ ├── fact_bed_occupancy.csv
│ ├── fact_billing.csv
│ ├── fact_outcome.csv
│ ├── fact_procedure.csv
│ ├── schema.sql
│
├── screenshots/
│ ├── Overview.png
│ ├── Department.png
│ ├── Financial.png
│ ├── Doctor Utilization.png
│ └── Data Model View.png
│
├── README.md
└── submission.md

---

## ⚙️ Setup Instructions

### 1️⃣ Database Setup
- Install MySQL Server
- Create a database named `hospital_db`
- Import the provided CSV files into MySQL tables

### 2️⃣ Backend Setup
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload 

### 3️⃣ Power BI Setup

Open Hospital_Analytics_Dashboard.pbix
Connect Power BI to the MySQL database
Refresh the dataset
Use slicers to explore insights
