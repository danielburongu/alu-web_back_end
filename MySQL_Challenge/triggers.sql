-- Create a trigger to log any updates made to project records in a separate table for auditing purposes.
CREATE TRIGGER ProjectUpdateAudit
AFTER UPDATE ON Projects
FOR EACH ROW
BEGIN
    INSERT INTO ProjectAuditLog (ProjectID, OldData, NewData, ChangeDate)
    VALUES (OLD.ProjectID, CONCAT('Old Name: ', OLD.ProjectName, ', Old Requirements: ', OLD.Requirements, ', Old Deadline: ', OLD.Deadline), 
            CONCAT('New Name: ', NEW.ProjectName, ', New Requirements: ', NEW.Requirements, ', New Deadline: ', NEW.Deadline), 
            NOW());
END;

-- Create a trigger to ensure a team lead assigned to a project is a valid employee.
CREATE TRIGGER ValidateTeamLead
BEFORE INSERT ON ProjectTeam
FOR EACH ROW
BEGIN
    IF (NEW.TeamLead = TRUE) AND 
       ((SELECT COUNT(*) FROM Employees WHERE EmployeeID = NEW.EmployeeID) = 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Team Lead. Employee does not exist.';
    END IF;
END;

-- Create a trigger to prevent deleting a project that still has assigned team members.
CREATE TRIGGER PreventProjectDeletion
BEFORE DELETE ON Projects
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM TeamMembers WHERE ProjectID = OLD.ProjectID) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete project with assigned team members.';
    END IF;
END;
