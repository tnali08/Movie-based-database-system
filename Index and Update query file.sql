CREATE INDEX idx_insurance_name ON InsuranceInfo (insurance_name);
CREATE INDEX idx_patients_name ON PatientsInfo (Last_Name, First_Name);
CREATE INDEX idx_dentist_name ON DentistInfo (Dentist_name);
CREATE INDEX idx_appointment_date ON AppointmentInfo (appointment_date);
CREATE INDEX idx_procedure_name ON ProceduresInfo (Name_of_the_procedure);
CREATE INDEX idx_billing_patient_id ON BillingInvoice (patient_id);
CREATE INDEX idx_prescription_date ON PrescriptionInfo (Start_Date);
CREATE INDEX idx_medicine_patient_id ON MedicineInfo (Patient_id);


       
       select *from emr.log;
       
       UPDATE AppointmentInfo
SET appointment_time = '15:30:00'
WHERE appointment_id = 1;
