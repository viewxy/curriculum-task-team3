---ki kicsodát ellenőrzött

SELECT a.name as student, 
projects.project_name, 
b.name as reviewer, 
review.mark AS mark,
review.comment 
FROM review 
JOIN students a 
ON review.student_id =a.student_id 
JOIN students b 
ON review.reviewer_id = b.student_id
JOIN projects 
ON projects.project_id = review.project_id 
ORDER BY a.name;
