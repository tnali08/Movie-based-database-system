use emr;

DELIMITER $$
create trigger AppointmentInsertTrigger
after insert  on AppointmentInfo
for each row
begin
insert into Log 
(timestamp, user, table_name, operation_type, old_value, new_value)
values
(now(), user(), 'AppointmentInfo', 'Insert', null, New.appointment_id);
end $$
DELIMITER ;

DELIMITER $$
create trigger AppointmentUpdateTrigger
after update  on AppointmentInfo
for each row
begin
insert into Log 
(timestamp, user, table_name, operation_type, old_value, new_value)
values
(now(), user(), 'AppointmentInfo', 'Update', old.appointment_id, New.appointment_id);
end $$
DELIMITER ;


DELIMITER $$
create trigger AppointmentDeleteTrigger
after delete on AppointmentInfo
for each row
begin
insert into Log 
(timestamp, user, table_name, operation_type, old_value, new_value)
values
(now(), user(), 'AppointmentInfo', 'Delete', old.appointment_id, null);
end $$
DELIMITER ;


