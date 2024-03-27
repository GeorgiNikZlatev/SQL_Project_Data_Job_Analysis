WITH trending_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS numb_jobs
    FROM
        skills_dim
        LEFT JOIN skills_job_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_work_from_home = TRUE
        AND job_title_short LIKE 'Data Analyst'
    GROUP BY
        skills_dim.skills,
        skills_dim.skill_id
    ORDER BY
        numb_jobs DESC
)
SELECT
    *
FROM
    trending_skills
LIMIT
    5