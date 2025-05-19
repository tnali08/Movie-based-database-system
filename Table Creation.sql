create database emr;
use emr;

#create statement for insurance information table
CREATE TABLE InsuranceInfo (
  insurance_id INT PRIMARY KEY,
  insurance_name VARCHAR(30) NOT NULL,
  insurance_policy VARCHAR(40) NOT NULL,
  coverage_amount INT
);

#create statement for patients information table
CREATE TABLE PatientsInfo (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  First_Name VARCHAR(60) NOT NULL,
  Last_Name VARCHAR(60) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Phone_number VARCHAR(40) NOT NULL,
  insurance_id INT,
  email varchar(40) NOT NULL, 
  password varchar(40) NOT NULL,
  FOREIGN KEY (insurance_id) REFERENCES InsuranceInfo(insurance_id)
);

#create statement for dentist information table
CREATE TABLE DentistInfo (
Dentist_id INT PRIMARY KEY AUTO_INCREMENT,
Dentist_name VARCHAR(50) NOT NULL,
Qualification VARCHAR(40) NOT NULL,
Phone_number VARCHAR(20) NOT NULL,
Email VARCHAR(100) NOT NULL,
Password varchar(40) NOT NULL
);

#create statement for appointment information table
CREATE TABLE AppointmentInfo ( 
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
Patient_id INT NOT NULL,
Dentist_id INT NOT NULL,
appointment_date DATE NOT NULL,
appointment_time TIME NOT NULL,
FOREIGN KEY (Patient_id) REFERENCES PatientsInfo(patient_id),
FOREIGN KEY (Dentist_id) REFERENCES DentistInfo(Dentist_id)
);


#create statement for procedures information table
CREATE TABLE ProceduresInfo (
Procedure_id INT PRIMARY KEY AUTO_INCREMENT,
Name_of_the_procedure VARCHAR(100) NOT NULL,
Cost VARCHAR(20) NOT NULL,
Procedure_details VARCHAR(400) NOT NULL,
time_requires TIME
);

#create statement for billing information table
CREATE TABLE BillingInvoice (
  invoice_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  appointment_id INT NOT NULL,
  patient_name VARCHAR(40) NOT NULL,
  Treatment_name VARCHAR(100) NOT NULL,
  Treatment_Description VARCHAR(100) NOT NULL,
  Insurance_payment VARCHAR(20) NOT NULL,
  Patient_payment VARCHAR(20) NOT NULL,
  Balance_due VARCHAR(20) NOT NULL,
  payment_due_date DATE NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES PatientsInfo(patient_id),
  FOREIGN KEY (appointment_id) REFERENCES AppointmentInfo(appointment_id)
);

#create statement for prescription information table
CREATE TABLE PrescriptionInfo (
Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
Patient_id INT NOT NULL,
Dentist_id INT NOT NULL,
Date_Prescribed VARCHAR(20) NOT NULL,
Medication_Name VARCHAR(20) NOT NULL,
Dosage VARCHAR(20) NOT NULL,
Start_Date DATE NOT NULL,
End_Date DATE NOT NULL,
FOREIGN KEY (Patient_id) REFERENCES PatientsInfo(patient_id),
FOREIGN KEY (Dentist_id) REFERENCES DentistInfo(Dentist_id)
);

#create statement for medicine information table
CREATE TABLE MedicineInfo (
Medicine_ID INT PRIMARY KEY AUTO_INCREMENT,
Medicine_Name VARCHAR(40) NOT NULL,
Medicine_Company VARCHAR(30) NOT NULL,
Medicine_Dosage VARCHAR(40) NOT NULL,
Patient_id INT,
Dentist_id INT,
FOREIGN KEY (Patient_id) REFERENCES PatientsInfo(patient_id),
FOREIGN KEY (Dentist_id) REFERENCES DentistInfo(Dentist_id)
);

CREATE TABLE Log (
  log_id INT PRIMARY KEY AUTO_INCREMENT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user varchar(50) NOT NULL,
  table_name VARCHAR(30) NOT NULL,
  operation_type VARCHAR(30) NOT NULL,
  old_value VARCHAR(200),
  new_value VARCHAR(200)
);

