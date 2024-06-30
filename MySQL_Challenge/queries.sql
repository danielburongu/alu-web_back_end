-- 1. Find all projects with a deadline before December 1st, 2024.
SELECT * FROM Projects WHERE Deadline < '2024-12-01';

-- 2. List all projects for "Big Retail Inc." ordered by deadline.
SELECT Projects.* 
FROM Projects 
JOIN Clients ON Projects.ClientID = Clients.ClientID 
WHERE Clients.ClientName = 'Big Retail Inc.'
ORDER BY Projects.Deadline;

-- 3. Find the team lead for the "Mobile App for Learning" project.
SELECT Employees.EmployeeName 
FROM ProjectTeam 
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID 
JOIN Projects ON ProjectTeam.ProjectID = Projects.ProjectID 
WHERE Projects.ProjectName = 'Mobile App for Learning' AND ProjectTeam.TeamLead = TRUE;

-- 4. Find projects containing "Management" in the name.
SELECT * FROM Projects WHERE ProjectName LIKE '%Management%';

-- 5. Count the number of projects assigned to David Lee.
SELECT COUNT(*) 
FROM ProjectTeam 
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID 
WHERE Employees.EmployeeName = 'David Lee';

-- 6. Find the total number of employees working on each project.
SELECT ProjectID, COUNT(EmployeeID) AS NumberOfEmployees 
FROM TeamMembers 
GROUP BY ProjectID;

-- 7. Find all clients with projects having a deadline after October 31st, 2024.
SELECT DISTINCT Clients.*
FROM Clients 
JOIN Projects ON Clients.ClientID = Projects.ClientID 
WHERE Projects.Deadline > '2024-10-31';

-- 8. List employees who are not currently team leads on any project.
SELECT * 
FROM Employees 
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM ProjectTeam WHERE TeamLead = TRUE);

-- 9. Combine a list of projects with deadlines before December 1st and another list with "Management" in the project name.
SELECT * 
FROM Projects 
WHERE Deadline < '2024-12-01'
UNION
SELECT * 
FROM Projects 
WHERE ProjectName LIKE '%Management%';

-- 10. Display a message indicating if a project is overdue (deadline passed).
SELECT ProjectID, ProjectName, 
       CASE 
           WHEN Deadline < CURDATE() THEN 'Overdue' 
           ELSE 'On time' 
       END AS Status 
FROM Projects;
