-- Drop tables if they exist
DROP TABLE IF EXISTS voyage_history;
DROP TABLE IF EXISTS medical_records;
DROP TABLE IF EXISTS certifications;
DROP TABLE IF EXISTS ship_assignments;
DROP TABLE IF EXISTS seafarer_registration;

-- Main Seafarer Registration Table
CREATE TABLE IF NOT EXISTS seafarer_registration (
    seafarer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    experience_years INT NOT NULL CHECK (experience_years >= 0),
    license_number VARCHAR(50) NOT NULL UNIQUE,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ship Assignments Table
CREATE TABLE IF NOT EXISTS ship_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    seafarer_id INT,
    ship_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (seafarer_id) REFERENCES seafarer_registration(seafarer_id) ON DELETE CASCADE
);

-- Certifications Table
CREATE TABLE IF NOT EXISTS certifications (
    certification_id INT AUTO_INCREMENT PRIMARY KEY,
    seafarer_id INT,
    certification_name VARCHAR(100) NOT NULL,
    issue_date DATE NOT NULL,
	end_date DATE NOT NULL,
    FOREIGN KEY (seafarer_id) REFERENCES seafarer_registration(seafarer_id) ON DELETE CASCADE
);

-- Medical Records Table
CREATE TABLE IF NOT EXISTS medical_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    seafarer_id INT,
    examination_date DATE NOT NULL,
    result VARCHAR(50) NOT NULL,
    doctor_name VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (seafarer_id) REFERENCES seafarer_registration(seafarer_id) ON DELETE CASCADE
);

-- Voyage History Table
CREATE TABLE IF NOT EXISTS voyage_history (
    voyage_id INT AUTO_INCREMENT PRIMARY KEY,
    seafarer_id INT,
    port_of_origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_date DATE NOT NULL,
    arrival_date DATE NOT NULL,
    FOREIGN KEY (seafarer_id) REFERENCES seafarer_registration(seafarer_id) ON DELETE CASCADE
);

-- Insert Data into seafarer_registration Table
INSERT INTO seafarer_registration (seafarer_id, first_name, last_name, position, nationality, date_of_birth, experience_years, license_number)
VALUES 
(1, 'Jhayron', 'Balaguer', 'Captain', 'Filipino', '1995-03-01', 5, 'L12345'),
(2, 'Mharvin', 'Camana', 'Chief Engineer', 'British', '1993-08-06', 7, 'L67890'),
(3, 'Kyla', 'Dela Cruz', 'Deck Officer', 'Espanol', '1994-09-25', 6, 'L54321'),
(4, 'Ian', 'Aquino', 'Second Engineer', 'Filipino', '1993-08-24', 7, 'L13579'),
(5, 'Arjay', 'Gomez', 'Bosun', 'Spanish', '1985-01-01', 12, 'L24680');  

-- Insert Data into ship_assignments Table
INSERT INTO ship_assignments (seafarer_id, ship_name, start_date, end_date)
VALUES 
(1, 'SS Pacific', '2024-01-01', '2024-03-15'),
(2, 'SS Atlantic', '2024-03-30', '2024-04-30'),
(3, 'SS Oceanic', '2024-05-01', '2024-06-30'),
(4, 'SS Voyager', '2024-07-01', '2024-08-15'),
(5, 'SS Horizon', '2024-09-01', '2024-10-15');

-- Insert Data into certifications Table
INSERT INTO certifications (seafarer_id, certification_name, issue_date, end_date)
VALUES 
(1, 'Advanced Marine Safety', '2020-05-01', '2022-05-01'),
(2, 'Engine Maintenance and Safety', '2021-01-15', '2023-01-15'),
(3, 'Navigation and Seamanship', '2023-06-10', '2026-06-10'),
(4, 'Cargo Handling and Stowage', '2022-09-20', '2024-09-20'),
(5, 'Firefighting Training', '2022-03-05', '2025-03-05');

-- Insert Data into medical_records Table
INSERT INTO medical_records (seafarer_id, examination_date, result, doctor_name, notes)
VALUES 
(1, '2023-01-15', 'Fit for Duty', 'Dr. Kaye Artuz', 'No issues.'),
(2, '2023-03-20', 'Fit for Duty', 'Dr. Russel Estrada', 'Mild Allergies.'),
(3, '2023-05-10', 'Requires Monitoring', 'Dr. Jamal Khan', 'History of hypertension.'),
(4, '2023-04-12', 'Fit for Duty', 'Dr. Kate Lopez', 'Routine check-up.'),
(5, '2023-02-22', 'Fit for Duty', 'Dr. Ahmad Ali', 'No issues.');

-- Insert Data into voyage_history Table
INSERT INTO voyage_history (seafarer_id, port_of_origin, destination, departure_date, arrival_date)
VALUES 
(1, 'Manila', 'Brazil', '2024-01-01', '2024-03-15'),
(2, 'Cape Town', 'New York', '2024-03-30', '2024-04-30'),
(3, 'Kuala Lumpur', 'Japan', '2024-05-01', '2024-06-30'),
(4, 'Thailand', 'UAE', '2024-07-01', '2024-08-15'),
(5, 'Singapore', 'New Zealand', '2024-09-01', '2024-10-15');
