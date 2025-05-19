# Insert records into InsuranceInfo table
INSERT INTO InsuranceInfo (insurance_id, insurance_name, insurance_policy, coverage_amount)
VALUES (4, 'Blue Cross Blue Shield', 'Policy 1', 5000),
       (5, 'Aetna', 'Policy 2', 6000),
       (6, 'Cigna', 'Policy 3', 7000),
       (7, 'UnitedHealthcare', 'Policy 4', 8000),
       (8, 'Humana', 'Policy 5', 9000),
       (9, 'Anthem', 'Policy 6', 10000),
       (10, 'Kaiser Permanente', 'Policy 7', 11000),
       (11, 'Molina Healthcare', 'Policy 8', 12000);

# Insert  records into DentistInfo table
INSERT INTO DentistInfo (Dentist_id, Dentist_name, Qualification, Phone_number, Email,password)
VALUES (1, 'Dr. Smith', 'DDS', '123-456-7890', 'drsmith@example.com','dentist123'),
       (2, 'Dr. Johnson', 'DMD', '987-654-3210', 'drjohnson@example.com','dentist123'),
       (3, 'Dr. Wilson', 'DDS', '555-1111', 'drwilson@example.com','dentist123'),
       (4, 'Dr. Lee', 'DMD', '555-2222', 'drlee@example.com','dentist123'),
       (5, 'Dr. Garcia', 'DDS', '555-3333', 'drgarcia@example.com','dentist123'),
       (6, 'Dr. Patel', 'DMD', '555-4444', 'drpatel@example.com','dentist123'),
       (7, 'Dr. Chen', 'DDS', '555-5555', 'drchen@example.com','dentist123'),
       (8, 'Dr. Nguyen', 'DMD', '555-6666', 'drnguyen@example.com','dentist123');
# Insert  records into PatientsInfo table
INSERT INTO PatientsInfo (patient_id, First_Name, Last_Name, Address, Phone_number, insurance_id, email, password) 
VALUES 
(1, 'Michael', 'Brown', '111 Pine St', '555-1111', 4, 'michael@example.com', 'patient12'),
(2, 'Jennifer', 'Davis', '222 Maple St', '555-2222', 5, 'jennifer@example.com', 'patient12'),
(3, 'William', 'Miller', '333 Oak St', '555-3333', 6, 'william@example.com', 'patient12'),
(4, 'Lisa', 'Wilson', '444 Elm St', '555-4444', 7, 'lisa@example.com', 'patient12'),
(5, 'David', 'Taylor', '555 Cedar St', '555-5555', 8, 'david@example.com', 'patient12'),
(6, 'Mary', 'Anderson', '666 Walnut St', '555-6666', 9, 'mary@example.com', 'patient12'),
(7, 'James', 'Thomas', '777 Birch St', '555-7777', 10, 'james@example.com', 'patient12'),
(8, 'Linda', 'Martinez', '888 Spruce St', '555-8888', 11, 'linda@example.com', 'patient12');


# Insert records into AppointmentInfo table
INSERT INTO AppointmentInfo (appointment_id, Patient_id, Dentist_id, appointment_date, appointment_time)
VALUES (1, 1, 1, '2024-04-04', '09:00:00'),
       (2, 2, 2, '2024-04-05', '10:00:00'),
       (3, 3, 3, '2024-04-06', '11:00:00'),
       (4, 4, 4, '2024-04-07', '12:00:00'),
       (5, 5, 5, '2024-04-08', '13:00:00'),
       (6, 6, 6, '2024-04-09', '14:00:00'),
       (7, 7, 7, '2024-04-10', '15:00:00'),
       (8, 8, 8, '2024-04-11', '16:00:00');
       

# Insert  records into ProceduresInfo table
INSERT INTO ProceduresInfo (Procedure_id, Name_of_the_procedure, Cost, Procedure_details, time_requires)
VALUES (1, 'Dental Cleaning', '100', 'Routine dental cleaning', '00:45:00'),
       (2, 'Tooth Extraction', '300', 'Simple tooth extraction', '01:30:00'),
       (3, 'Root Canal', '500', 'Treatment for infected tooth', '02:00:00'),
       (4, 'Dental Filling', '200', 'Filling a cavity', '01:00:00'),
       (5, 'Teeth Whitening', '150', 'Whitening treatment', '00:30:00'),
       (6, 'Dental Crown', '600', 'Placement of dental crown', '02:30:00'),
       (7, 'Dental Implant', '1000', 'Implant surgery', '03:00:00'),
       (8, 'Orthodontic Treatment', '3000', 'Braces installation', '24:00:00');

# Insert  records into BillingInvoice table
INSERT INTO BillingInvoice (invoice_id, patient_id, appointment_id, patient_name, Treatment_name, Treatment_Description, Insurance_payment, Patient_payment, Balance_due, payment_due_date)
VALUES (1, 1, 1, 'Michael Brown', 'Dental Cleaning', 'Routine cleaning and examination', '50', '50', '0', '2024-04-04'),
       (2, 2, 2, 'Jennifer Davis', 'Tooth Extraction', 'Simple tooth extraction', '150', '150', '0', '2024-04-05'),
       (3, 3, 3, 'William Miller', 'Root Canal', 'Treatment for infected tooth', '250', '250', '0', '2024-04-06'),
       (4, 4, 4, 'Lisa Wilson', 'Dental Filling', 'Filling a cavity', '100', '100', '0', '2024-04-07'),
       (5, 5, 5, 'David Taylor', 'Teeth Whitening', 'Whitening treatment', '75', '75', '0', '2024-04-08'),
       (6, 6, 6, 'Mary Anderson', 'Dental Crown', 'Placement of dental crown', '300', '300', '0', '2024-04-09'),
       (7, 7, 7, 'James Thomas', 'Dental Implant', 'Implant surgery', '500', '500', '0', '2024-04-10'),
       (8, 8, 8, 'Linda Martinez', 'Orthodontic Treatment', 'Braces installation', '1500', '1500', '0', '2024-04-11');
# Insert  records into PrescriptionInfo table
INSERT INTO PrescriptionInfo (prescription_id, Patient_id, Dentist_id, Date_Prescribed, Medication_Name, Dosage, Start_Date, End_Date)
VALUES (1, 1, 1, '2024-04-01', 'Painkiller', '500mg', '2024-04-01', '2024-04-07'),
       (2, 2, 2, '2024-04-02', 'Antibiotic', '250mg', '2024-04-02', '2024-04-09'),
       (3, 3, 3, '2024-04-03', 'Anti-inflammatory', '200mg', '2024-04-03', '2024-04-10'),
       (4, 4, 4, '2024-04-04', 'Painkiller', '500mg', '2024-04-04', '2024-04-11'),
       (5, 5, 5, '2024-04-05', 'Antibiotic', '250mg', '2024-04-05', '2024-04-12'),
       (6, 6, 6, '2024-04-06', 'Anti-inflammatory', '200mg', '2024-04-06', '2024-04-13'),
       (7, 7, 7, '2024-04-07', 'Painkiller', '500mg', '2024-04-07', '2024-04-14'),
       (8, 8, 8, '2024-04-08', 'Antibiotic', '250mg', '2024-04-08', '2024-04-15');
# Insert  records into MedicineInfo table
INSERT INTO MedicineInfo (medicine_id, Medicine_Name, Medicine_Company, Medicine_Dosage, Patient_id, Dentist_id)
VALUES (1, 'Ibuprofen', 'MediCorp', '200mg', 1, 1),
       (2, 'Amoxicillin', 'PharmaZen', '500mg', 2, 2),
       (3, 'Prednisone', 'MediPlus', '5mg', 3, 3),
       (4, 'Acetaminophen', 'PharmaWell', '500mg', 4, 4),
       (5, 'Doxycycline', 'PharmaTech', '100mg', 5, 5),
       (6, 'Aspirin', 'MediHealth', '81mg', 6, 6),
       (7, 'Naproxen', 'PharmaVita', '220mg', 7, 7),
       (8, 'Lisinopril', 'MediCare', '10mg', 8, 8);
