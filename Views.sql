CREATE VIEW Patients_Insurance_Details AS
SELECT 
    pi.first_name AS patient_first_name,
    pi.last_name AS patient_last_name,
    ii.insurance_name,
    ii.insurance_policy,
    ii.coverage_amount
FROM 
    patientsinfo pi
INNER JOIN 
    insuranceinfo ii ON pi.insurance_id = ii.insurance_id;



select *from emr.patientswithinsurance;


#2nd

CREATE VIEW AppointmentSchedule AS
SELECT ai.appointment_id, pi.First_Name, pi.Last_Name, di.Dentist_name, ai.appointment_date, ai.appointment_time
FROM AppointmentInfo ai
INNER JOIN PatientsInfo pi ON ai.Patient_id = pi.patient_id
INNER JOIN DentistInfo di ON ai.Dentist_id = di.Dentist_id;
SELECT * FROM emr.patientsWithInsurance;

#3rd
CREATE VIEW BillingInformation AS
SELECT 
    bi.Invoice_id, 
    pi.First_Name, 
    pi.Last_Name, 
    ai.appointment_date, 
    ai.appointment_time, 
    bi.Treatment_name, 
    bi.Treatment_Description,
    bi.Insurance_payment,
    bi.Patient_payment,
    bi.Balance_due,
    bi.payment_due_date
FROM BillingInvoice bi
INNER JOIN PatientsInfo pi ON bi.patient_id = pi.patient_id
INNER JOIN AppointmentInfo ai ON bi.appointment_id = ai.appointment_id;

SELECT * FROM emr.patientsWithInsurance;

#4th 

CREATE VIEW PrescriptionInformation AS
SELECT 
    pi.First_Name AS PatientFirstName, 
    pi.Last_Name AS PatientLastName, 
    di.Dentist_name AS DentistName, 
    pi.Address AS PatientAddress, 
    pi.Phone_number AS PatientPhone, 
    pr.Medication_Name AS MedicationName, 
    pr.Dosage AS MedicationDosage, 
    pr.Start_Date AS PrescriptionStart, 
    pr.End_Date AS PrescriptionEnd
FROM PrescriptionInfo pr
INNER JOIN PatientsInfo pi ON pr.Patient_id = pi.patient_id
INNER JOIN DentistInfo di ON pr.Dentist_id = di.Dentist_id;

SELECT * FROM PrescriptionInformation;


