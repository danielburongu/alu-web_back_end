-- Insert Clients
INSERT INTO Clients (ClientName, ContactName, ContactEmail) VALUES 
('Big Retail Inc.', 'Peter Parker', 'peter.parker@example.com'),
('EduTech Solutions', 'Walter White', 'walter.white@example.com'),
('Trendsetters Inc.', 'Sandra Bullock', 'sandra.bullock@example.com'),
('Gearhead Supply Co.', 'Daniel Craig', 'daniel.craig@example.com'),
('Fine Dine Group', 'Olivia Rodriguez', 'olivia.rodriguez@example.com'),
('Green Thumb Gardens', 'Mark Robinson', 'mark.robinson@example.com'),
('Busy Bees Daycare', 'Emily Blunt', 'emily.blunt@example.com'),
('Acme Pharmaceuticals', 'David Kim', 'david.kim@example.com'),
('Knowledge Stream Inc.', 'Matthew McConaughey', 'matthew.mcconaughey@example.com'),
('Software Craft LLC', 'Jennifer Lopez', 'jennifer.lopez@example.com');

-- Insert Employees
INSERT INTO Employees (EmployeeName) VALUES 
('Alice Brown'),
('David Lee'),
('Jane Doe'),
('Michael Young'),
('Emily Chen'),
('William Green'),
('Sarah Jones');

-- Insert Projects
INSERT INTO Projects (ProjectName, Requirements, Deadline, ClientID) VALUES 
('E-commerce Platform', 'Extensive documentation', '2024-12-01', 1),
('Mobile App for Learning', 'Gamified learning modules', '2024-08-15', 2),
('Social Media Management Tool', 'User-friendly interface with analytics', '2024-10-31', 3),
('Inventory Management System', 'Barcode integration and real-time stock tracking', '2024-11-01', 4),
('Restaurant Reservation System', 'Online booking with table management', '2024-09-01', 5),
('Content Management System (CMS)', 'Drag-and-drop interface for easy content updates', '2024-12-15', 6),
('Customer Relationship Management (CRM)', 'Secure parent portal and communication tools', '2024-10-01', 7),
('Data Analytics Dashboard', 'Real-time visualization of key performance indicators (KPIs)', '2024-11-30', 8),
('E-learning Platform Development', 'Interactive course creation and delivery tools', '2024-09-15', 9),
('Bug Tracking and Issue Management System', 'Prioritization and collaboration features for bug reporting', '2024-12-31', 10);

-- Insert Team Members
INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES 
(1, 2), (1, 3), -- David Lee, Jane Doe
(2, 4), (2, 5), -- Michael Young, Emily Chen
(3, 3), (3, 6), -- Jane Doe, William Green
(4, 4), (4, 5), -- Michael Young, Emily Chen
(5, 6), (5, 7), -- William Green, Sarah Jones
(6, 3), (6, 4), -- Jane Doe, Michael Young
(7, 6), (7, 7), -- William Green, Sarah Jones
(8, 4), (8, 5), -- Michael Young, Emily Chen
(9, 3), (9, 6), -- Jane Doe, William Green
(10, 4), (10, 7); -- Michael Young, Sarah Jones

-- Insert Project Team (Team Leads)
INSERT INTO ProjectTeam (ProjectID, EmployeeID, TeamLead) VALUES 
(1, 1, TRUE), -- Alice Brown
(2, 2, TRUE), -- David Lee
(3, 1, TRUE), -- Alice Brown
(4, 2, TRUE), -- David Lee
(5, 1, TRUE), -- Alice Brown
(6, 2, TRUE), -- David Lee
(7, 1, TRUE), -- Alice Brown
(8, 2, TRUE), -- David Lee
(9, 1, TRUE), -- Alice Brown
(10, 2, TRUE); -- David Lee
