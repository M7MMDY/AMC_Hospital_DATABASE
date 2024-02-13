CREATE DATABASE AMC_hospital_Mohamed;

USE AMC_hospital_Mohamed;
-- CREATE TABLES 
CREATE TABLE patient
(
    patient_id INT PRIMARY KEY,
    patient_address VARCHAR(60),
    patient_gender VARCHAR(60),
    patient_age INT,
    patient_name VARCHAR(60),
    gyardian_id INT,
    room_no INT,
    FOREIGN KEY (gyardian_id) REFERENCES gyardian(gyardian_id),
    FOREIGN KEY (room_no) REFERENCES room (room_no)
);

CREATE TABLE doctor
(
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(255),
    doctor_phone BIGINT,
    doctor_address VARCHAR(255),
    doctor_degrees VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)

);

CREATE TABLE department
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255),
    department_manager VARCHAR(255),
);
USE AMC_hospital_Mohamed;
CREATE TABLE appointment
(
    appointment_id INT PRIMARY KEY,
    appointment_date DATE,
    patient_id INT,
    gyardian_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (gyardian_id) REFERENCES gyardian(gyardian_id)
);

CREATE TABLE gyardian
(
    gyardian_id INT PRIMARY KEY,
    gyardian_name VARCHAR(255),
    gyardian_phone BIGINT,
    gyardian_address VARCHAR(255),
);

CREATE TABLE room
(
    room_no INT PRIMARY KEY,
    room_type VARCHAR(255),
    room_location VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE doctor_has_patient
(
    doctor_id INT,
    patient_id INT,
    PRIMARY KEY (doctor_id,patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
);

INSERT INTO patient
    (patient_id, patient_address, patient_gender, patient_age, patient_name, gyardian_id, room_no)
VALUES
    (1, '123 Main St', 'Male', 25, 'John Doe', 41, 101),
    (2, '456 Oak St', 'Female', 30, 'Jane Smith', 42, 102),
    (3, '789 Maple St', 'Male', 22, 'Michael Johnson', 43, 103),
    (4, '111 Pine St', 'Female', 35, 'Emily Davis', 44, 104),
    (5, '222 Birch St', 'Male', 28, 'David Wilson', 45, 105),
    (6, '333 Elm St', 'Female', 40, 'Sophia White', 46, 106),
    (7, '444 Cedar St', 'Male', 32, 'Christopher Brown', 47, 107),
    (8, '555 Walnut St', 'Female', 27, 'Olivia Miller', 48, 108),
    (9, '666 Spruce St', 'Male', 29, 'Ethan Martinez', 49, 109),
    (10, '777 Redwood St', 'Female', 33, 'Ava Taylor', 50, 110);

INSERT INTO doctor
    (doctor_id, doctor_name, doctor_phone, doctor_address, doctor_degrees, department_id)
VALUES
    (11, 'Dr. Smith Johnson', 1234567890, '123 Main St', 'MD, PhD', 21),
    (12, 'Dr. Emily Davis', 9876543210, '456 Oak St', 'MD, MS', 22),
    (13, 'Dr. Michael Wilson', 5551234567, '789 Maple St', 'DO, MPH', 23),
    (14, 'Dr. Sarah Miller', 3339876543, '111 Pine St', 'MD, MBA', 24),
    (15, 'Dr. Christopher Brown', 8885551234, '222 Birch St', 'DO, MS', 25),
    (16, 'Dr. Olivia Martinez', 7774445678, '333 Elm St', 'MD, MPH', 26),
    (17, 'Dr. Ethan Taylor', 2226667890, '444 Cedar St', 'DO, MS', 27),
    (18, 'Dr. Ava White', 6662223456, '555 Walnut St', 'MD, MBA', 28),
    (19, 'Dr. Matthew Garcia', 4441117890, '666 Spruce St', 'DO, MS', 29),
    (20, 'Dr. Emma Clark', 1118883456, '777 Redwood St', 'MD, MPH', 30);

INSERT INTO department
    (department_id, department_name, department_manager)
VALUES
    (21, 'Cardiology', 'Dr. Smith Johnson'),
    (22, 'Orthopedics', 'Dr. Emily Davis'),
    (23, 'Pediatrics', 'Dr. Michael Wilson'),
    (24, 'Neurology', 'Dr. Sarah Miller'),
    (25, 'Oncology', 'Dr. Christopher Brown'),
    (26, 'Gynecology', 'Dr. Olivia Martinez'),
    (27, 'Dermatology', 'Dr. Ethan Taylor'),
    (28, 'Internal Medicine', 'Dr. Ava White'),
    (29, 'ENT (Ear, Nose, Throat)', 'Dr. Matthew Garcia'),
    (30, 'Psychiatry', 'Dr. Emma Clark');

INSERT INTO appointment
    (appointment_id, appointment_date, patient_id, gyardian_id)
VALUES
    (31, '2024-01-15', 1, 41),
    (32, '2024-02-01', 2, 42),
    (33, '2024-03-10', 3, 43),
    (34, '2024-04-05', 4, 44),
    (35, '2024-05-20', 5, 45),
    (36, '2024-06-15', 6, 46),
    (37, '2024-07-02', 7, 47),
    (38, '2024-08-18', 8, 48),
    (39, '2024-09-25', 9, 49),
    (40, '2024-10-12', 10, 50);

INSERT INTO gyardian
    (gyardian_id, gyardian_name, gyardian_phone, gyardian_address)
VALUES
    (41, 'Mr. Johnson', 1234567890, '123 Main St'),
    (42, 'Mrs. Davis', 9876543210, '456 Oak St'),
    (43, 'Dr. Wilson', 5551234567, '789 Maple St'),
    (44, 'Ms. Miller', 3339876543, '111 Pine St'),
    (45, 'Mr. Brown', 8885551234, '222 Birch St'),
    (46, 'Mrs. Martinez', 7774445678, '333 Elm St'),
    (47, 'Dr. Taylor', 2226667890, '444 Cedar St'),
    (48, 'Mrs. White', 6662223456, '555 Walnut St'),
    (49, 'Mr. Garcia', 4441117890, '666 Spruce St'),
    (50, 'Ms. Clark', 1118883456, '777 Redwood St');

INSERT INTO room
    (room_no, room_type, room_location, department_id)
VALUES
    (101, 'Single', 'East Wing,  Floor 1', 21),
    (102, 'Double', 'West Wing,  Floor 2', 22),
    (103, 'Suite', 'North Wing, Floor 3', 23),
    (104, 'Single', 'South Wing, Floor 1', 24),
    (105, 'Double', 'East Wing,  Floor 2', 25),
    (106, 'Suite', 'West Wing,  Floor 3', 26),
    (107, 'Single', 'North Wing, Floor 1', 27),
    (108, 'Double', 'South Wing, Floor 2', 28),
    (109, 'Suite', 'East Wing,  Floor 3', 29),
    (110, 'Single', 'West Wing,  Floor 1', 30);

INSERT INTO doctor_has_patient
    (doctor_id, patient_id)
VALUES
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10);


-- Queries 
SELECT *
FROM patient 

SELECT *
FROM doctor

SELECT *
FROM department

USE AMC_hospital_Mohamed;
SELECT *
FROM appointment

SELECT *
FROM gyardian

SELECT *
FROM room

SELECT *
FROM doctor_has_patient

SELECT doctor_id, doctor_name FROM doctor
WHERE department_id =25 

SELECT room_no, room_location FROM room
WHERE  room_type ='Single' 

SELECT gyardian_id, gyardian_name, gyardian_phone FROM gyardian

SELECT DISTINCT appointment_id, appointment_date, patient_id FROM appointment