-- Create a stored procedure to add a new client and their first project in one call.
CREATE PROCEDURE AddClientWithProject (
    IN ClientName VARCHAR(255), 
    IN ContactName VARCHAR(255), 
    IN ContactEmail VARCHAR(255), 
    IN ProjectName VARCHAR(255), 
    IN Requirements TEXT, 
    IN Deadline DATE
)
BEGIN
    DECLARE newClientID INT;
    INSERT INTO Clients (ClientName, ContactName, ContactEmail) 
    VALUES (ClientName, ContactName, ContactEmail);
    SET newClientID = LAST_INSERT_ID();
    INSERT INTO Projects (ProjectName, Requirements, Deadline, ClientID) 
    VALUES (ProjectName, Requirements, Deadline, newClientID);
END;

-- Create a stored procedure to move completed projects (past deadlines) to an archive table.
CREATE PROCEDURE ArchiveCompletedProjects ()
BEGIN
    CREATE TABLE IF NOT EXISTS ArchivedProjects LIKE Projects;
    INSERT INTO ArchivedProjects 
    SELECT * FROM Projects 
    WHERE Deadline < CURDATE();
    DELETE FROM Projects 
    WHERE Deadline < CURDATE();
END;

-- Create a stored procedure to update project team members (remove existing, add new ones).
CREATE PROCEDURE UpdateProjectTeamMembers(
    IN projID INT,
    IN newTeamMembers JSON
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE n INT;
    DECLARE memberID INT;
    SET n = JSON_LENGTH(newTeamMembers);
    DELETE FROM TeamMembers WHERE ProjectID = projID;
    WHILE i < n DO
        SET memberID = JSON_EXTRACT(newTeamMembers, CONCAT('$[', i, ']'));
        INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES (projID, memberID);
        SET i = i + 1;
    END WHILE;
END;
