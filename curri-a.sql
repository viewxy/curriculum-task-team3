SELECT * 
FROM projects 
WHERE projects.course_id = 'TST01' 
GROUP BY course_id, projects.project_id 
ORDER BY projects.project_id;

SELECT * 
FROM projects 
WHERE projects.course_id = 'TST02' 
GROUP BY course_id, projects.project_id 
ORDER BY projects.project_id;

SELECT * 
FROM projects 
WHERE projects.course_id = 'FRT01' 
GROUP BY course_id, projects.project_id 
ORDER BY projects.project_id;

SELECT * 
FROM projects 
WHERE projects.course_id = 'BCK01' 
GROUP BY course_id, projects.project_id 
ORDER BY projects.project_id;

SELECT * 
FROM projects 
WHERE projects.course_id = 'SYS01' 
GROUP BY course_id, projects.project_id 
ORDER BY projects.project_id;