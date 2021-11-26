SELECT students.name, 
SUM(review.mark) 
FROM students
INNER JOIN review
ON review.student_id = students.student_id
GROUP BY students.name
ORDER BY SUM(review.mark) DESC
LIMIT 3;