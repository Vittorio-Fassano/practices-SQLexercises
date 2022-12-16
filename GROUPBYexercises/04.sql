SELECT MAX(jobs.salary) AS maximumSalary, roles.name AS role 
FROM roles JOIN jobs ON roles.id = jobs."roleId" 
WHERE jobs.active = true GROUP BY roles.id ORDER BY maximumSalary ASC;