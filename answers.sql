-- Question 1

SELECT *
FROM Student
WHERE mark > 80
ORDER BY mark DESC;


-- Question 2

SELECT
    MAX(mark) AS highest_mark,
    MIN(mark) AS lowest_mark,
    AVG(mark) AS average_mark
FROM Student;


-- Question 3

SELECT *
FROM Student
ORDER BY mark DESC
LIMIT 5;


-- Question 4

SELECT student_name, mark
FROM Student
WHERE age BETWEEN 18 AND 25
ORDER BY age;


-- Question 5

SELECT
    Course.course_name,
    COUNT(Student.student_id) AS student_count
FROM Course
LEFT JOIN Student
ON Course.course_id = Student.course_id
GROUP BY Course.course_id, Course.course_name;


-- Question 6

SELECT
    Course.course_name,
    COUNT(Student.student_id) AS student_count
FROM Course
INNER JOIN Student
ON Course.course_id = Student.course_id
GROUP BY Course.course_id, Course.course_name
HAVING COUNT(Student.student_id) > 2;


-- Question 7

SELECT
    Student.student_name,
    Student.mark,
    Course.course_name
FROM Student
INNER JOIN Course
ON Student.course_id = Course.course_id;


-- Question 8

SELECT
    Course.course_name,
    Student.student_name,
FROM Course
LEFT JOIN Student
ON Course.course_id = Student.course_id;


-- Question 9

SELECT student_name, mark
FROM Student
WHERE mark > (
    SELECT AVG(mark)
    FROM Student
);


-- Question 10

SELECT
    Student.student_name,
    Student.mark,
    Course.course_name
FROM Student
INNER JOIN Course
ON Student.course_id = Course.course_id
WHERE Student.mark = (
    SELECT MAX(mark)
    FROM Student
    WHERE mark < (
        SELECT MAX(mark)
        FROM Student
    )
);