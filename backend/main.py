from fastapi import FastAPI
import mysql.connector

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Hospital API is running"}

@app.get("/test-db")
def test_db():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Sheh@nsh1",
        database="hospital_db"
    )
    cur = conn.cursor()
    cur.execute("SELECT COUNT(*) FROM fact_admission;")
    count = cur.fetchone()[0]
    conn.close()
    return {"total_admissions": count}

@app.get("/alos")
def get_alos():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Sheh@nsh1",
        database="hospital_db"
    )
    cur = conn.cursor()
    cur.execute("SELECT ROUND(AVG(length_of_stay_hours)/24, 2) FROM fact_admission;")
    alos = cur.fetchone()[0]
    conn.close()
    return {"average_length_of_stay_days": alos}

@app.get("/bed-occupancy")
def bed_occupancy():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Sheh@nsh1",
        database="hospital_db"
    )
    cur = conn.cursor()

    cur.execute("""
        SELECT 
        ROUND(
            SUM(TIMESTAMPDIFF(HOUR, start_time, end_time)) /
            (
                COUNT(DISTINCT bed_id) *
                DATEDIFF(MAX(end_time), MIN(start_time)) * 24
            ) * 100,
        2)
        FROM fact_bed_occupancy;
    """)

    occupancy = cur.fetchone()[0]
    conn.close()

    return {"bed_occupancy_rate_percent": occupancy}

@app.get("/readmission-rate")
def readmission_rate():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Sheh@nsh1",
        database="hospital_db"
    )
    cur = conn.cursor()

    cur.execute("""
        SELECT 
        ROUND(
            SUM(readmitted_within_30d) / COUNT(*) * 100,
        2)
        FROM fact_outcome;
    """)

    rate = cur.fetchone()[0]
    conn.close()

    return {"readmission_rate_percent": rate}

@app.get("/doctor-utilization")
def doctor_utilization():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Sheh@nsh1",
        database="hospital_db"
    )
    cur = conn.cursor()

    cur.execute("""
        SELECT 
        ROUND(COUNT(a.admission_id) / COUNT(DISTINCT d.doctor_id), 2)
        FROM fact_admission a
        JOIN dim_doctor d ON a.doctor_id = d.doctor_id;
    """)

    avg_patients = cur.fetchone()[0]
    conn.close()

    return {"avg_admissions_per_doctor": avg_patients}
