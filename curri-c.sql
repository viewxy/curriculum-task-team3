SELECT students.course_id AS course,
students.student_id AS student_id,
students.name AS name,
students.hobby AS hobby,
students.other AS important_info
FROM students
WHERE students.course_id = 'TST01'
ORDER BY students.student_id;

SELECT students.course_id AS course,
students.student_id AS student_id,
students.name AS name,
students.hobby AS hobby,
students.other AS important_info
FROM students
WHERE students.course_id = 'TST02'
ORDER BY students.student_id;

SELECT students.course_id AS course,
students.student_id AS student_id,
students.name AS name,
students.hobby AS hobby,
students.other AS important_info
FROM students
WHERE students.course_id = 'BCK01'
ORDER BY students.student_id;

SELECT students.course_id AS course,
students.student_id AS student_id,
students.name AS name,
students.hobby AS hobby,
students.other AS important_info
FROM students
WHERE students.course_id = 'FRT01'
ORDER BY students.student_id;

SELECT students.course_id AS course,
students.student_id AS student_id,
students.name AS name,
students.hobby AS hobby,
students.other AS important_info
FROM students
WHERE students.course_id = 'SYS01'
ORDER BY students.student_id;