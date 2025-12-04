SELECT s.student_name AS "Tên sinh viên",
       c.course_name  AS "Môn học",
       e.score        AS "Điểm"
FROM students s
         JOIN enrollments e ON s.student_id = e.student_id
         JOIN courses c ON c.course_id = e.course_id;

SELECT s.student_name AS "Tên sinh viên",
       AVG(e.score)   AS "Điểm trung bình",
       MAX(e.score)   AS "Điểm cao nhất",
       MIN(e.score)   AS "Điểm thấp nhất"
FROM students s
         JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;

SELECT s.major,
       AVG(e.score) AS avg_score
FROM students s
         JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.major
HAVING AVG(e.score) > 7.5;

SELECT s.student_name AS "Tên sinh viên",
       c.course_name  AS "Môn học",
       c.credits      AS "Số tín chỉ",
       e.score        AS "Điểm"
FROM students s
         JOIN enrollments e ON s.student_id = e.student_id
         JOIN courses c ON c.course_id = e.course_id;


SELECT s.student_name,
       AVG(e.score) AS avg_student
FROM students s
         JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(e.score) > (SELECT AVG(score) FROM enrollments);


(SELECT student_id
 FROM enrollments
 WHERE score >= 9)
UNION
(SELECT DISTINCT student_id
 FROM enrollments);

(SELECT student_id
 FROM enrollments
 WHERE score >= 9)
INTERSECT
(SELECT student_id
 FROM enrollments);
