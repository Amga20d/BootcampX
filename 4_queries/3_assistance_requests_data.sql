SELECT 
    teachers.name AS teacher_name,
    students.name AS student_name,
    assignments.name AS assignment_name,
    (assistance_requests.completed_at - assistance_requests.started_at) AS duration
FROM 
    assistance_requests
JOIN 
    teachers ON assistance_requests.teacher_id = teachers.id
JOIN 
    students ON assistance_requests.student_id = students.id
LEFT JOIN 
    assignments ON assistance_requests.assignment_id = assignments.id
ORDER BY 
    duration;
