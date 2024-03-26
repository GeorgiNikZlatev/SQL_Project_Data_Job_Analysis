/*
 What are the top-paying Data Analyst jobs?
 -Identify the top 10 highest-paying Data Analyst roles in London, UK.
 -Focuses on job postings with specified salaries (remove nulls).
 -Why? : Highlight the top-paying opportunities for Data Analyst, offering insights into employment opportunities
 */
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short LIKE 'Data Analyst'
    AND job_location LiKE '%London% UK'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT
    10