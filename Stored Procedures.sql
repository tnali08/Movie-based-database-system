use emr;

Delimiter $$
create procedure dentistLogin(in emailId varchar(40), in pwd varchar(40))
begin
select * from DentistInfo where email = emailId and password = pwd;
end $$
Delimiter ;

DELIMITER $$
CREATE PROCEDURE viewAllAppointments()
BEGIN
    SELECT AppointmentInfo.appointment_id, PatientsInfo.First_Name AS patient_first_name, PatientsInfo.Last_Name AS patient_last_name, DentistInfo.Dentist_name, appointment_date, appointment_time 
    FROM AppointmentInfo
    JOIN PatientsInfo ON AppointmentInfo.Patient_id = PatientsInfo.patient_id
    JOIN DentistInfo ON AppointmentInfo.Dentist_id = DentistInfo.Dentist_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE patientLogin(IN emailId VARCHAR(40), IN pwd VARCHAR(40))
BEGIN
    SELECT * FROM patientsinfo WHERE email = emailId AND password = pwd;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewAllPatients()
BEGIN
    SELECT First_Name+' '+Last_Name as Name, address, phone_number, insurance_id, email FROM patientsinfo;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewAllDentists()
BEGIN
    SELECT dentist_id, dentist_name, qualification, phone_number, email FROM DentistInfo;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewAppointmentsOfDentist(IN dentistId INT)
BEGIN
    SELECT AppointmentInfo.appointment_id, PatientsInfo.First_Name AS patient_first_name, PatientsInfo.Last_Name AS patient_last_name, appointment_date, appointment_time 
    FROM AppointmentInfo
    JOIN PatientsInfo ON AppointmentInfo.Patient_id = PatientsInfo.patient_id
    WHERE AppointmentInfo.Dentist_id = dentistId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewAppointmentsOfPatient(IN patientId INT)
BEGIN
    SELECT AppointmentInfo.appointment_id, DentistInfo.Dentist_name, appointment_date, appointment_time 
    FROM AppointmentInfo
    JOIN DentistInfo ON AppointmentInfo.Dentist_id = DentistInfo.Dentist_id
    WHERE AppointmentInfo.Patient_id = patientId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewPatientInfo(IN patientId INT)
BEGIN
    SELECT * FROM patientsinfo WHERE patient_id = patientId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewPrescriptionOfPatient(IN patientId INT)
BEGIN
    SELECT * FROM prescriptioninfo WHERE patient_id = patientId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE viewPatientsOfDentist(IN dentistId INT)
BEGIN
    SELECT PatientsInfo.patient_id, PatientsInfo.First_Name, PatientsInfo.Last_Name, PatientsInfo.Address, PatientsInfo.Phone_number, PatientsInfo.insurance_id, PatientsInfo.email 
    FROM AppointmentInfo
    JOIN PatientsInfo ON AppointmentInfo.Patient_id = PatientsInfo.patient_id
    WHERE AppointmentInfo.Dentist_id = dentistId;
END $$
DELIMITER ;
