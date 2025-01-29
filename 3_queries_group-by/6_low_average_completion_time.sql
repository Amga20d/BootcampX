WITH AvgEstTime AS (
    SELECT AVG(duration) AS avg_estimated_time
    FROM assignments
),
StudentAvgTime AS (
    SELECT students.name, AVG(assignment_submissions.duration) AS avg_completion_time
    FROM students
    JOIN assignment_submissions ON students.id = assignment_submissions.student_id
    WHERE students.end_date IS NULL
    GROUP BY students.name
)
SELECT StudentAvgTime.name, StudentAvgTime.avg_completion_time, AvgEstTime.avg_estimated_time
FROM StudentAvgTime, AvgEstTime
WHERE StudentAvgTime.avg_completion_time < AvgEstTime.avg_estimated_time
ORDER BY StudentAvgTime.avg_completion_time ASC;
