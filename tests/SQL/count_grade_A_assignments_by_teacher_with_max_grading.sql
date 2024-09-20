-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH TeacherAssignmentCounts AS (
    SELECT teacher_id, COUNT(*) AS graded_assignment_count 
    FROM assignments 
    WHERE grade IS NOT NULL 
    GROUP BY teacher_id
),
TeachersWithMostGradedAssignments AS (
    SELECT teacher_id 
    FROM TeacherAssignmentCounts
    WHERE graded_assignment_count = (SELECT MAX(graded_assignment_count) FROM TeacherAssignmentCounts)
)
SELECT COUNT(*) AS grade_A_count
FROM assignments a
JOIN TeachersWithMostGradedAssignments t ON a.teacher_id = t.teacher_id
WHERE a.grade = 'A';