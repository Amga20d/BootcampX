SELECT SUM(assignment_submissions.duration) AS total_time_spent
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';
