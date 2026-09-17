WITH assignment_scores AS (
    SELECT
        sas.student_id,
        a.assessment_id,
        ROUND(sas.score * a.assessment_weighting, 2) AS weighted_score
    FROM
        assessments AS a
        INNER JOIN student_assessment_scores AS sas ON a.assessment_id = sas.assessment_id
),
overall_scores AS (
    SELECT
        student_id,
        SUM(weighted_score) AS overall_score
    FROM
        assignment_scores
    GROUP BY
        student_id
)
SELECT
    s.student_id,
    s.given_name,
    s.family_name,
    COALESCE(os.overall_score, 0) AS final_score
FROM
    students AS s
    LEFT JOIN overall_scores AS os ON s.student_id = os.student_id;