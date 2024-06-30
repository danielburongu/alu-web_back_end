-- Create a view to simplify retrieving client contact.
CREATE VIEW ClientContacts AS 
SELECT ClientName, ContactName, ContactEmail 
FROM Clients;

-- Create a view to show only ongoing projects (not yet completed).
CREATE VIEW OngoingProjects AS 
SELECT * FROM Projects 
WHERE Deadline >= CURDATE();

-- Create a view to display project information along with assigned team leads.
CREATE VIEW ProjectWithLeads AS 
SELECT Projects.ProjectName, Employees.EmployeeName AS TeamLead 
FROM Projects 
JOIN ProjectTeam ON Projects.ProjectID = ProjectTeam.ProjectID 
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID 
WHERE ProjectTeam.TeamLead = TRUE;

-- Create a view to show project names and client contact information for projects with a deadline in November 2024.
CREATE VIEW NovemberProjects AS 
SELECT Projects.ProjectName, Clients.ContactName, Clients.ContactEmail 
FROM Projects 
JOIN Clients ON Projects.ClientID = Clients.ClientID 
WHERE MONTH(Projects.Deadline) = 11 AND YEAR(Projects.Deadline) = 2024;

-- Create a view to display the total number of projects assigned to each employee.
CREATE VIEW EmployeeProjectCount AS 
SELECT Employees.EmployeeName, COUNT(TeamMembers.ProjectID) AS ProjectCount 
FROM Employees 
JOIN TeamMembers ON Employees.EmployeeID = TeamMembers.EmployeeID 
GROUP BY Employees.EmployeeName;

-- Create a view to display project details along with the total number of team members assigned.
CREATE VIEW ProjectTeamDetails AS
SELECT Projects.ProjectID, Projects.ProjectName, COUNT(TeamMembers.EmployeeID) AS TotalTeamMembers
FROM Projects
LEFT JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID
GROUP BY Projects.ProjectID, Projects.ProjectName;

-- Create a view to show overdue projects with the number of days overdue.
CREATE VIEW OverdueProjects AS
SELECT ProjectID, ProjectName, DATEDIFF(CURDATE(), Deadline) AS DaysOverdue
FROM Projects
WHERE Deadline < CURDATE();
