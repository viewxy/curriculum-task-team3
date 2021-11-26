SELECT students.name, 
ROUND(AVG(review.mark)) AS AVG, 
ROUND(AVG(review.mark)/5*100) AS PERCENT, 
CASE 
WHEN ROUND(AVG(review.mark)/5*100) >= 60 THEN 'Haladó' 
ELSE 'Megfontoltan haladó' 
END AS RESULT 
FROM students 
FULL JOIN review 
ON students.student_id = review.student_id 
GROUP BY students.name 
ORDER BY percent DESC, name;