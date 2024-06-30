-- Create a function to calculate the number of days remaining until a project deadline.
CREATE FUNCTION DaysUntilDeadline(ProjectID INT) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE days_left INT;
    SELECT DATEDIFF(Deadline, CURDATE()) INTO days_left 
    FROM Projects 
    WHERE ProjectID = ProjectID;
    RETURN days_left;
END;

-- Create a function to calculate the number of days a project is overdue.
CREATE FUNCTION DaysOverdue(ProjectID INT) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE days_overdue INT;
    SELECT DATEDIFF(CURDATE(), Deadline) INTO days_overdue 
    FROM Projects 
    WHERE ProjectID = ProjectID AND Deadline < CURDATE();
    RETURN days_overdue;
END;
